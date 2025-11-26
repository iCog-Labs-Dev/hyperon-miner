#!/bin/bash
set -e

# Clone PeTTa repository
git clone https://github.com/patham9/PeTTa
cd PeTTa || exit 1

# Checkout latest commit on default branch
git fetch origin
git checkout "$(git rev-parse origin/HEAD)"

# Ensure run.sh has a proper bash shebang
if ! grep -q "^#!/bin/bash" run.sh; then
    sed -i '1i#!/bin/bash' run.sh
fi

# Build absolute paths
SCRIPT_DIR="$(pwd)/src/main.pl"
#MORK_DIR="$(pwd)/mork_ffi/target/release/libmork_ffi.so"

# Update paths inside run.sh
sed -i "s|./src/main.pl|$SCRIPT_DIR|" run.sh
#sed -i "s|./mork_ffi/target/release/libmork_ffi.so|$MORK_DIR|" run.sh

# Make run.sh executable
chmod +x run.sh

# Add repo path to PATH (local shell)
repo_path="$(pwd)"
if ! echo "$PATH" | grep -q "$repo_path"; then
    export PATH="$PATH:$repo_path"
fi

# Add to GitHub Actions env only if running in CI
if [ -n "$GITHUB_ENV" ]; then
    echo "PATH=$PATH" >> "$GITHUB_ENV"
fi

echo "PeTTa setup complete."
