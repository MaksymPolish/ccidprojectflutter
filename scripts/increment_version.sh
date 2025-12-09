#!/bin/bash
set -e

# Read current version from pubspec.yaml
CURRENT_VERSION=$(grep "^version:" pubspec.yaml | awk '{print $2}')
VERSION_NAME=$(echo $CURRENT_VERSION | cut -d'+' -f1)
BUILD_NUMBER=$(echo $CURRENT_VERSION | cut -d'+' -f2)

if [ -z "$BUILD_NUMBER" ]; then
  BUILD_NUMBER=0
fi

NEW_BUILD_NUMBER=$((BUILD_NUMBER + 1))
NEW_VERSION="${VERSION_NAME}+${NEW_BUILD_NUMBER}"

# Update pubspec.yaml
sed -i "s/version: ${CURRENT_VERSION}/version: ${NEW_VERSION}/" pubspec.yaml

echo "Version updated: ${CURRENT_VERSION} -> ${NEW_VERSION}"
