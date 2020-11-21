//
//  ListContactPresenter.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol ListContactPresenterInput: ViperPresenterInput { }

class ListContactPresenter: ViperPresenter, ListContactPresenterInput, ListContactViewOutput {
    
    // MARK: - Props
    fileprivate var view: ListContactViewInput? {
        guard let view = self._view as? ListContactViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var router: ListContactRouterInput? {
        guard let router = self._router as? ListContactRouterInput else {
            return nil
        }
        return router
    }
    
    private let viewModel: ListContactViewModel
    private let listContactUseCase: ListContactUseCaseInput
    
    // MARK: - Initialization
    override init() {
        self.viewModel = ListContactViewModel()
        self.listContactUseCase = ListContactUseCase()
        super.init()
        self.listContactUseCase.subscribe(with: self)
    }
    
    // MARK: - ListContactPresenterInput
    
    // MARK: - ListContactViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
        self.reloadData()
    }
    
    override func reloadData() {
        self.listContactUseCase.fetch()
    }
        
    // MARK: - Module functions
}

// MARK: - ListContactUseCaseOutput
extension ListContactPresenter: ListContactUseCaseOutput {
    
    func error(useCase: ListContactUseCase, error: Error?) {
        self.finishLoading(with: error)
    }
    
    func provideFetch(useCase: ListContactUseCase, contacts: [ContactModel]) {
        print(contacts)
    }
    
}
