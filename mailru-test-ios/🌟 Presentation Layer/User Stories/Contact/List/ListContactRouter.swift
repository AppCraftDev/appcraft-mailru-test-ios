//
//  ListContactRouter.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol ListContactRouterInput: ViperRouterInput {
    func showDetailContact(contact: ContactModel)
}

class ListContactRouter: ViperRouter, ListContactRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: ListContactViewController? {
        guard let mainController = self._mainController as? ListContactViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - ListContactRouterInput
    func showDetailContact(contact: ContactModel) {
        let vc = DetailContactAssembly.create()
        _ = DetailContactAssembly.configure(with: vc, contact: contact)
        self.push(to: vc, animated: true)
    }
    
    // MARK: - Module functions
}
