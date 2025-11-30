# Places

- **Browse Locations**: View a list of interesting places.
- **Deep Link to Wikipedia**: Navigate directly to the Wikipedia app for more details on a specific location via deep links. Note: https://github.com/7yon/wikipedia-ios/pull/1 with changes related to a new deep link format is already merged to the main branch.
- **Custom Location Entry**: Input specific coordinates, which can then be used to navigate to Wikipedia.

## 🚀 Setup & Requirements

- **Xcode**: 16.0+
- **iOS**: 17.0+

To get started, run the setup script which handles dependencies (Homebrew tools) and installs git hooks for linting:

```bash
sh scripts/setup.sh
```

## 🏗 Architecture & Technical Decisions

I chose a modular approach to ensure clear separation of concerns and to simulate a structure suitable for larger teams.

### Modularization
The project is split into feature and core modules:
- **Places**: Composition root.
- **PlacesCore**: Shared logic and models.
- **PlacesNetworking**: Isolated networking layer.

### Design Patterns
- **MVVM+C**: I used MVVM for the presentation layer to keep Views lightweight and View Models testable. Coordinators handle navigation, ensuring that Views remain unaware of the navigation flow.
- **Dependency Injection**: Implemented using **Needle**. I prefer compile-time safety for DI to catch graph issues early, rather than at runtime.
- **Concurrency**: The app uses **Modern Swift Concurrency** (`async/await`, Actors) for handling asynchronous tasks and thread safety.

## 📱 UI & Accessibility

The UI is built 100% with **SwiftUI**

- **Accessibility**: I've ensured the app is accessible by adding custom identifiers, labels, and hints. It supports Dynamic Type and VoiceOver.
- **Deep Linking**: The app supports deep linking to specific coordinates (e.g., opening a location from a URL).

## 🧪 Testing

I've included a mix of testing strategies to cover different aspects of the app:

- **Unit Tests**: Focused on ViewModels and business logic.
- **Snapshot Tests**: Using `swift-snapshot-testing` to catch UI regressions across different states.
  > [!WARNING]
  > Snapshots were recorded on an **iPhone 17 Pro (iOS 26)** with an **Apple M4 chip**. Running these tests on a different device, OS version, or chip architecture may result in failures due to rendering differences of the `swift-snapshot-testing` library. The recommended approach is to always record and validate snapshots on a CI environment with a fixed build stack.
- **UI Tests**: Covering critical user flows.
- **Accessibility Audit**: Automated checks to ensure basic accessibility compliance.

## 🔄 Development Process

I worked locally, using git to track my progress incrementally. The commit history reflects the step-by-step implementation of features, refactoring, and architectural improvements. I also integrated **SwiftLint** to strictly enforce code style and maintain high code quality throughout the development lifecycle.

## 🛠 Tooling

- **SwiftLint**: Enforced via git hooks to maintain a consistent code style.
- **Scripts**: Helper scripts in `/scripts` to automate setup and environment configuration.
