//
//  ListContactRouter.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol ListContactRouterInput: ViperRouterInput { }

class ListContactRouter: ViperRouter, ListContactRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: ListContactViewController? {
        guard let mainController = self._mainController as? ListContactViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - ListContactRouterInput
    
    // MARK: - Module functions
}
