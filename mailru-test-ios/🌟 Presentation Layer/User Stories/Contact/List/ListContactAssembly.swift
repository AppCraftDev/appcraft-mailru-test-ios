//
//  ListContactAssembly.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

enum ListContactAssembly {
    
    // Create and return controller
    static func create() -> ListContactViewController {
        ListContactViewController()
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: ListContactViewController) -> ListContactPresenterInput {
        let presenter = ListContactPresenter()
        
        let router = ListContactRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
