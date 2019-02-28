//
// Created by Александр Цикин on 2019-02-28.
// Copyright (c) 2019 SunnyDay.Dev. All rights reserved.
//

import Foundation
import Cleanse

public struct Singleton : Scope { }
public typealias SingletonBinder = Binder<Singleton>

struct AppComponent: Cleanse.RootComponent {

    // When we call AppComponent().build() it will return the Root type if successful
    typealias Root = PropertyInjector<AppDelegate>
    typealias Scope = Singleton

    static func configure(binder: SingletonBinder) {

        binder.install(dependency: AppSubComponent.self)

    }

    static func configureRoot(binder bind: ReceiptBinder<PropertyInjector<AppDelegate>>) -> BindingReceipt<PropertyInjector<AppDelegate>> {
        return bind.propertyInjector(configuredWith: AppModule.configureAppDelegateInjector)
    }

}

struct AppModule : Module {

    typealias Scope = Singleton

    static func configure(binder: SingletonBinder) {

        binder
            .bind(AppDelegate.self)
            .to(factory: { UIApplication.shared.delegate as! AppDelegate })

    }

    static func configureAppDelegateInjector(binder bind: PropertyInjectionReceiptBinder<AppDelegate>) -> BindingReceipt<PropertyInjector<AppDelegate>> {
        return bind.to(injector: AppDelegate.injectProperties)
    }

}