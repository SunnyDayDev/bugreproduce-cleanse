//
// Created by Александр Цикин on 2019-02-28.
// Copyright (c) 2019 SunnyDay.Dev. All rights reserved.
//

import Foundation
import Cleanse


struct AppSubComponent: Cleanse.Component {

    // When we call AppComponent().build() it will return the Root type if successful
    typealias Root = ()

    static func configure(binder: Binder<Unscoped>) { }

    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
        return bind.to(factory: { () })
    }

}