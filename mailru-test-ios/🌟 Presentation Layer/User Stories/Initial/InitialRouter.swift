//
//  InitialRouter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol InitialRouterInput: ViperRouterInput {
    func presentMainViewController()
}

class InitialRouter: ViperRouter, InitialRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: InitialViewController? {
        guard let mainController = self._mainController as? InitialViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - InitialRouterInput
    func presentMainViewController() {
        let vc = ListContactAssembly.create()
        _ = ListContactAssembly.configure(with: vc)
        let nav = BasicNavigationController.create(with: vc)
        AppManager.current.setupKeyWindowRootController(nav)
    }
    
    // MARK: - Module functions
}
