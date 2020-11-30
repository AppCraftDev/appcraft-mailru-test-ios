//
//  InitialAssembly.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

enum InitialAssembly {
    
    // Create and return controller
    static func create() -> InitialViewController {
        InitialViewController()
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: InitialViewController) -> InitialPresenterInput {
        let presenter = InitialPresenter()
        
        let router = InitialRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
