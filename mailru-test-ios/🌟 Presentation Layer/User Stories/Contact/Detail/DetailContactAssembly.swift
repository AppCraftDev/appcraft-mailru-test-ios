//
//  DetailContactAssembly.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

enum DetailContactAssembly {
    
    // Create and return controller
    static func create() -> DetailContactViewController {
        DetailContactViewController()
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: DetailContactViewController, contact: ContactModel) -> DetailContactPresenterInput {
        let presenter = DetailContactPresenter(contact: contact)
        
        let router = DetailContactRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
