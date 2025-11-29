

import Foundation
import NeedleFoundation

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class ListDependency9c2f5b85fb6808210ea1Provider: ListDependency {
    var urlOpener: any URLOpener {
        return rootComponent.urlOpener
    }
    var apiClient: ApiClient {
        return rootComponent.apiClient
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->ListComponent
private func factory2ecbff52c934651ff190b3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ListDependency9c2f5b85fb6808210ea1Provider(rootComponent: parent1(component) as! RootComponent)
}

#else
extension RootComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["environment-AppEnvironment"] = { [unowned self] in self.environment as Any }
        localTable["urlOpener-any URLOpener"] = { [unowned self] in self.urlOpener as Any }
        localTable["apiClient-ApiClient"] = { [unowned self] in self.apiClient as Any }
    }
}
extension ListComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\ListDependency.urlOpener] = "urlOpener-any URLOpener"
        keyPathToName[\ListDependency.apiClient] = "apiClient-ApiClient"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->ListComponent", factory2ecbff52c934651ff190b3a8f24c1d289f2c0f2e)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
