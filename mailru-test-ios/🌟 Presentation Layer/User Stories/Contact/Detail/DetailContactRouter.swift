//
//  DetailContactRouter.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol DetailContactRouterInput: ViperRouterInput { }

class DetailContactRouter: ViperRouter, DetailContactRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: DetailContactViewController? {
        guard let mainController = self._mainController as? DetailContactViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - DetailContactRouterInput
    
    // MARK: - Module functions
}
