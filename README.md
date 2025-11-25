# Places

An iOS application for exploring places and locations.

## Prerequisites

- Xcode (latest version recommended)

## Setup

To set up the project for development, run the setup script from the project root:

```bash
./scripts/setup.sh
```

This script will:
- Install and upgrade required Homebrew formulae
- Configure Git hooks for code quality validation

## Git Hooks

The project uses Git hooks to maintain code quality. During setup, a pre-commit hook is automatically installed that:

- **Validates SwiftLint compliance** before each commit
- Runs SwiftLint in strict mode to ensure all code meets the project's style guidelines
- Prevents commits if SwiftLint violations are found

If SwiftLint is not installed, the hook will provide installation instructions.

## Development

Open `Places.xcodeproj` in Xcode to start development.
