# Update a formula to latest GitHub release
# Usage: just update-formula curse
#        just update-formula curse --force
update-formula name force="":
    #!/usr/bin/env bash
    set -euo pipefail

    FORMULA="Formula/{{ name }}.rb"
    FORCE="{{ force }}"

    if [ ! -f "$FORMULA" ]; then
        echo "Formula not found: $FORMULA"
        exit 1
    fi

    # Extract GitHub repo from homepage
    REPO=$(grep 'homepage' "$FORMULA" | sed 's/.*github.com\/\([^"]*\)".*/\1/')
    if [ -z "$REPO" ]; then
        echo "Could not extract GitHub repo from homepage"
        exit 1
    fi

    echo "Repository: $REPO"

    # Fetch latest version from GitHub
    VERSION=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" | jq -r '.tag_name' | sed 's/^v//')
    CURRENT=$(grep 'version "' "$FORMULA" | sed 's/.*version "\(.*\)"/\1/')

    if [ "$VERSION" = "$CURRENT" ] && [ "$FORCE" != "--force" ]; then
        echo "Already at latest version: $VERSION"
        exit 0
    fi

    echo "Updating $CURRENT -> $VERSION"

    # Get formula name for asset pattern (lowercase)
    NAME="{{ name }}"

    # Download and compute checksums
    echo "Fetching ARM64 checksum..."
    ARM_SHA=$(curl -sL "https://github.com/$REPO/releases/download/v${VERSION}/${NAME}_${VERSION}_darwin_arm64.tar.gz" | shasum -a 256 | cut -d' ' -f1)

    echo "Fetching Intel checksum..."
    INTEL_SHA=$(curl -sL "https://github.com/$REPO/releases/download/v${VERSION}/${NAME}_${VERSION}_darwin_amd64.tar.gz" | shasum -a 256 | cut -d' ' -f1)

    echo "ARM64:  $ARM_SHA"
    echo "Intel:  $INTEL_SHA"

    # Update version
    sed -i '' "s/version \"$CURRENT\"/version \"$VERSION\"/" "$FORMULA"

    # Update ARM sha256 (line after arm64 url)
    sed -i '' "/darwin_arm64/{ n; s/sha256 \"[a-f0-9]*\"/sha256 \"$ARM_SHA\"/; }" "$FORMULA"

    # Update Intel sha256 (line after amd64 url)
    sed -i '' "/darwin_amd64/{ n; s/sha256 \"[a-f0-9]*\"/sha256 \"$INTEL_SHA\"/; }" "$FORMULA"

    echo "Updated $FORMULA to version $VERSION"
