# Update curse formula to latest GitHub release
update-curse:
    #!/usr/bin/env bash
    set -euo pipefail

    FORMULA="Formula/curse.rb"

    # Fetch latest version from GitHub
    VERSION=$(curl -s https://api.github.com/repos/wu-json/curse/releases/latest | jq -r '.tag_name' | sed 's/^v//')
    CURRENT=$(grep 'version "' "$FORMULA" | sed 's/.*version "\(.*\)"/\1/')

    if [ "$VERSION" = "$CURRENT" ]; then
        echo "Already at latest version: $VERSION"
        exit 0
    fi

    echo "Updating $CURRENT -> $VERSION"

    # Download and compute checksums
    echo "Fetching ARM64 checksum..."
    ARM_SHA=$(curl -sL "https://github.com/wu-json/curse/releases/download/v${VERSION}/curse_${VERSION}_darwin_arm64.tar.gz" | shasum -a 256 | cut -d' ' -f1)

    echo "Fetching Intel checksum..."
    INTEL_SHA=$(curl -sL "https://github.com/wu-json/curse/releases/download/v${VERSION}/curse_${VERSION}_darwin_amd64.tar.gz" | shasum -a 256 | cut -d' ' -f1)

    echo "ARM64:  $ARM_SHA"
    echo "Intel:  $INTEL_SHA"

    # Update version
    sed -i '' "s/version \"$CURRENT\"/version \"$VERSION\"/" "$FORMULA"

    # Update ARM sha256 (line after arm64 url)
    sed -i '' "/darwin_arm64/{ n; s/sha256 \"[a-f0-9]*\"/sha256 \"$ARM_SHA\"/; }" "$FORMULA"

    # Update Intel sha256 (line after amd64 url)
    sed -i '' "/darwin_amd64/{ n; s/sha256 \"[a-f0-9]*\"/sha256 \"$INTEL_SHA\"/; }" "$FORMULA"

    echo "Updated $FORMULA to version $VERSION"
