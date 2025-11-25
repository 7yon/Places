#!/bin/bash
# Setup homebrew and upgrade required formulae

scripts/setup_homebrew.sh

brew update

# Install SwiftLint
brew install swiftlint