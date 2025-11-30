# Technical Decisions

This document outlines the key architectural decisions and patterns used in the Places project.

## Minimum iOS Version

**Selected Version:** iOS 17.0

**Reasoning:**
- **Adoption Rate:** The majority of iOS users are on iOS 17 or higher in Europe ([source](https://gs.statcounter.com/ios-version-market-share/all/europe)).
- **Modern Features:** Targeting iOS 17 allows us to leverage the latest advancements in SwiftUI (e.g., `Observation` framework, improved navigation APIs) and Swift, resulting in cleaner, more performant, and maintainable code.

## MVVM (Model-View-ViewModel)

**Pattern:** MVVM

**Reasoning:**
- **Separation of Concerns:** Clearly separates the UI (View) from the business logic and state management (ViewModel).
- **Testability:** ViewModels can be easily unit tested in isolation without needing a UI host, ensuring robust logic.
- **SwiftUI Integration:** MVVM works naturally with SwiftUI's reactive data flow (`ObservableObject`, `@Published`, or the new `@Observable` macro), making state updates seamless.

## Coordinator Pattern

**Pattern:** Coordinator

**Reasoning:**
- **Navigation Logic:** Decouples navigation logic from Views. Views should not know about other Views; View Models simply delegate navigation actions to the Coordinator.
- **Deep Linking:** Centralized navigation logic makes implementing deep links and handling complex navigation flows much easier.

## Dependency Injection

**Tool:** [Needle](https://github.com/uber/needle)

**Reasoning:**
- **Compile-time Safety:** Needle ensures that all dependencies are satisfied at compile time, eliminating runtime crashes due to missing dependencies.
- **Hierarchical Structure:** It supports a hierarchical dependency injection structure that mirrors the component tree of the application, making scoping and sharing dependencies intuitive.
- **Code Generation:** Reduces boilerplate code through automated code generation, allowing developers to focus on defining dependencies rather than wiring them.

## Modularization

**Modules:**
- **PlacesCore:** Contains shared logic, models, and utilities used across different features. This promotes code reuse and separation of concerns.
- **PlacesNetworking:** A dedicated module for network layer implementation. It encapsulates API calls, request/response handling, and networking configurations, ensuring that networking logic is isolated and easily testable.

**Benefits:**
- **Build Times:** improved incremental build times as modules can be compiled independently.
- **Isolation:** Enforces strict boundaries between components, preventing tight coupling.

## Accessibility

**Coverage:**
- **VoiceOver:** UI elements are configured with appropriate accessibility labels, hints, and traits to support VoiceOver users.
- **Dynamic Type:** The app supports Dynamic Type, ensuring that text scales correctly according to the user's system settings.
- **Semantic Views:** Usage of standard SwiftUI controls ensures a high level of default accessibility support.

## Localization

**Format:** String Catalogs (.xcstrings)

**Reasoning:**
- **Modern Workflow:** String Catalogs provide a visual editor and unified way to manage translations, replacing legacy `.strings` and `.stringsdict` files.
- **Safety:** The compiler verifies that keys used in code exist in the catalog, reducing missing translation errors.
