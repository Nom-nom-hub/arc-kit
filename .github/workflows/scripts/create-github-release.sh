#!/usr/bin/env bash
set -euo pipefail

# create-github-release.sh
# Create a GitHub release with all template zip files
# Usage: create-github-release.sh <version>

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <version>" >&2
  exit 1
fi

VERSION="$1"

# Remove 'v' prefix from version for release title
VERSION_NO_V=${VERSION#v}

gh release create "$VERSION" \
  .genreleases/arc-kit-template-copilot-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-copilot-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-claude-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-claude-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-gemini-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-gemini-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-cursor-agent-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-cursor-agent-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-opencode-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-opencode-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-qwen-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-qwen-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-windsurf-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-windsurf-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-codex-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-codex-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-kilocode-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-kilocode-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-auggie-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-auggie-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-roo-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-roo-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-codebuddy-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-codebuddy-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-amp-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-amp-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-shai-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-shai-ps-"$VERSION".zip \
  .genreleases/arc-kit-template-q-sh-"$VERSION".zip \
  .genreleases/arc-kit-template-q-ps-"$VERSION".zip \
  --title "Arc Kit Templates - $VERSION_NO_V" \
  --notes-file release_notes.md
