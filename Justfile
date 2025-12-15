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

    # Download and compute checksums for macOS
    echo "Fetching macOS ARM64 checksum..."
    DARWIN_ARM_SHA=$(curl -sL "https://github.com/$REPO/releases/download/v${VERSION}/${NAME}_${VERSION}_darwin_arm64.tar.gz" | shasum -a 256 | cut -d' ' -f1)

    echo "Fetching macOS Intel checksum..."
    DARWIN_INTEL_SHA=$(curl -sL "https://github.com/$REPO/releases/download/v${VERSION}/${NAME}_${VERSION}_darwin_amd64.tar.gz" | shasum -a 256 | cut -d' ' -f1)

    # Download and compute checksums for Linux
    echo "Fetching Linux ARM64 checksum..."
    LINUX_ARM_SHA=$(curl -sL "https://github.com/$REPO/releases/download/v${VERSION}/${NAME}_${VERSION}_linux_arm64.tar.gz" | shasum -a 256 | cut -d' ' -f1)

    echo "Fetching Linux AMD64 checksum..."
    LINUX_AMD_SHA=$(curl -sL "https://github.com/$REPO/releases/download/v${VERSION}/${NAME}_${VERSION}_linux_amd64.tar.gz" | shasum -a 256 | cut -d' ' -f1)

    echo "macOS ARM64:  $DARWIN_ARM_SHA"
    echo "macOS Intel:  $DARWIN_INTEL_SHA"
    echo "Linux ARM64:  $LINUX_ARM_SHA"
    echo "Linux AMD64:  $LINUX_AMD_SHA"

    # Update version
    sed -i '' "s/version \"$CURRENT\"/version \"$VERSION\"/" "$FORMULA"

    # Update macOS ARM sha256 (line after darwin_arm64 url)
    sed -i '' "/darwin_arm64/{ n; s/sha256 \"[a-f0-9]*\"/sha256 \"$DARWIN_ARM_SHA\"/; }" "$FORMULA"

    # Update macOS Intel sha256 (line after darwin_amd64 url)
    sed -i '' "/darwin_amd64/{ n; s/sha256 \"[a-f0-9]*\"/sha256 \"$DARWIN_INTEL_SHA\"/; }" "$FORMULA"

    # Update Linux ARM sha256 (line after linux_arm64 url)
    sed -i '' "/linux_arm64/{ n; s/sha256 \"[a-f0-9]*\"/sha256 \"$LINUX_ARM_SHA\"/; }" "$FORMULA"

    # Update Linux AMD64 sha256 (line after linux_amd64 url)
    sed -i '' "/linux_amd64/{ n; s/sha256 \"[a-f0-9]*\"/sha256 \"$LINUX_AMD_SHA\"/; }" "$FORMULA"

    echo "Updated $FORMULA to version $VERSION"

# Update all formulas to latest GitHub releases
# Usage: just update-all-formulas
#        just update-all-formulas --force
update-formulas force="":
    #!/usr/bin/env bash
    set -euo pipefail
    for formula in Formula/*.rb; do
        name=$(basename "$formula" .rb)
        echo "=== Updating $name ==="
        just update-formula "$name" "{{ force }}"
    done
