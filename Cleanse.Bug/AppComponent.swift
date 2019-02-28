//
// Created by Александр Цикин on 2019-02-28.
// Copyright (c) 2019 SunnyDay.Dev. All rights reserved.
//

import Foundation
import Cleanse

struct AppComponent: Cleanse.RootComponent {

    // When we call AppComponent().build() it will return the Root type if successful
    typealias Root = PropertyInjector<AppDelegate>

    static func configure(binder: Binder<Unscoped>) {

        binder.install(dependency: AppSubComponent.self)

    }

    static func configureRoot(binder bind: ReceiptBinder<PropertyInjector<AppDelegate>>) -> BindingReceipt<PropertyInjector<AppDelegate>> {
        return bind.propertyInjector(configuredWith: AppModule.configureAppDelegateInjector)
    }

}

struct AppModule : Module {

    static func configure(binder: Binder<Unscoped>) { }

    static func configureAppDelegateInjector(binder bind: PropertyInjectionReceiptBinder<AppDelegate>) -> BindingReceipt<PropertyInjector<AppDelegate>> {
        return bind.to(injector: AppDelegate.injectProperties)
    }

}