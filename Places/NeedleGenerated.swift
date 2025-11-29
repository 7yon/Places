

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
    var apiClient: ApiClient {
        return rootComponent.apiClient
    }
    var coordinator: Coordinator {
        return rootComponent.coordinator
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
private class CustomLocationDependency5b37b7f43133f5ca915aProvider: CustomLocationDependency {
    var coordinator: Coordinator {
        return rootComponent.coordinator
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->CustomLocationComponent
private func factory695679b9fa9338fe7f48b3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CustomLocationDependency5b37b7f43133f5ca915aProvider(rootComponent: parent1(component) as! RootComponent)
}

#else
extension ListComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\ListDependency.apiClient] = "apiClient-ApiClient"
        keyPathToName[\ListDependency.coordinator] = "coordinator-Coordinator"
    }
}
extension RootComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["environment-AppEnvironment"] = { [unowned self] in self.environment as Any }
        localTable["urlOpener-any URLOpener"] = { [unowned self] in self.urlOpener as Any }
        localTable["apiClient-ApiClient"] = { [unowned self] in self.apiClient as Any }
        localTable["listComponent-ListComponent"] = { [unowned self] in self.listComponent as Any }
        localTable["customLocation-CustomLocationComponent"] = { [unowned self] in self.customLocation as Any }
        localTable["coordinator-Coordinator"] = { [unowned self] in self.coordinator as Any }
    }
}
extension CustomLocationComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\CustomLocationDependency.coordinator] = "coordinator-Coordinator"
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
    registerProviderFactory("^->RootComponent->ListComponent", factory2ecbff52c934651ff190b3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->CustomLocationComponent", factory695679b9fa9338fe7f48b3a8f24c1d289f2c0f2e)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
