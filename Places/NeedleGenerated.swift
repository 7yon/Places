

import Foundation
import NeedleFoundation
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

private func parent2(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class CoordinatorDependency0f71d0b6ef2bb3d907eeProvider: CoordinatorDependency {
    var urlOpener: URLOpener {
        return rootComponent.urlOpener
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->CoordinatorComponent
private func factory8dc1270a3a9a35cfa51db3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CoordinatorDependency0f71d0b6ef2bb3d907eeProvider(rootComponent: parent1(component) as! RootComponent)
}
private class ListDependencyfecbdc575a7460ee2a75Provider: ListDependency {
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
/// ^->RootComponent->CoordinatorComponent->ListComponent
private func factory8a8bc51579ede1162164a9403e3301bb54f80df0(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ListDependencyfecbdc575a7460ee2a75Provider(rootComponent: parent2(component) as! RootComponent)
}
private class CustomLocationDependency4111dd6f55e6bc4d82c1Provider: CustomLocationDependency {
    var coordinator: Coordinator {
        return rootComponent.coordinator
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->CoordinatorComponent->CustomLocationComponent
private func factory24540fb03fdc21174c44a9403e3301bb54f80df0(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CustomLocationDependency4111dd6f55e6bc4d82c1Provider(rootComponent: parent2(component) as! RootComponent)
}

#else
extension CoordinatorComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\CoordinatorDependency.urlOpener] = "urlOpener-URLOpener"

    }
}
extension ListComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\ListDependency.apiClient] = "apiClient-ApiClient"
        keyPathToName[\ListDependency.coordinator] = "coordinator-Coordinator"
    }
}
extension RootComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["environment-AppEnvironment"] = { [unowned self] in self.environment as Any }
        localTable["urlOpener-URLOpener"] = { [unowned self] in self.urlOpener as Any }
        localTable["apiClient-ApiClient"] = { [unowned self] in self.apiClient as Any }
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
    registerProviderFactory("^->RootComponent->CoordinatorComponent", factory8dc1270a3a9a35cfa51db3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->CoordinatorComponent->ListComponent", factory8a8bc51579ede1162164a9403e3301bb54f80df0)
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->CoordinatorComponent->CustomLocationComponent", factory24540fb03fdc21174c44a9403e3301bb54f80df0)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
