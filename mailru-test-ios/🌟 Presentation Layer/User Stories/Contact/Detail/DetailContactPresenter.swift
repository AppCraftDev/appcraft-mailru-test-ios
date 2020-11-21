//
//  DetailContactPresenter.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol DetailContactPresenterInput: ViperPresenterInput { }

class DetailContactPresenter: ViperPresenter, DetailContactPresenterInput, DetailContactViewOutput {
    
    // MARK: - Props
    fileprivate var view: DetailContactViewInput? {
        guard let view = self._view as? DetailContactViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var router: DetailContactRouterInput? {
        guard let router = self._router as? DetailContactRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: DetailContactViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = DetailContactViewModel()
    }
    
    // MARK: - DetailContactPresenterInput
    
    // MARK: - DetailContactViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
        
    // MARK: - Module functions
}
