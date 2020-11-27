//
//  ListContactPresenter.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper
import GKRepresentable

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
        self.beginLoading()
        self.reloadData()
    }
    
    override func reloadData() {
        self.listContactUseCase.fetch()
    }
    
    func didSelectRow(_ row: TableCellModel) {
        guard let model = row as? ContactListTableCellModel else { return }
        self.router?.showDetailContact(contact: model.contact)
    }
    
    func beginRefresh() {
        self.reloadData()
    }
        
    // MARK: - Module functions
}

// MARK: - ListContactUseCaseOutput
extension ListContactPresenter: ListContactUseCaseOutput {
    
    func error(useCase: ListContactUseCase, error: Error?) {
        self.finishLoading(with: error)
    }
    
    func errorNotAccess(useCase: ListContactUseCase) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.reloadData(with: [])
            self?.view?.setEmptyView(with: .contactsAccessDenied(tapBt: {
                guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }))
            self?.finishLoading(with: nil)
        }
    }
    
    func provideFetch(useCase: ListContactUseCase, contacts: [ContactModel]) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            let rows: [ContactListTableCellModel] = contacts.map({ ContactListTableCellModel(contact: $0) })
            self?.view?.reloadData(with: rows)
            self?.view?.setEmptyView(with: nil)
            
            if rows.isEmpty {
                self?.view?.setEmptyView(with: .contactsEmpty(tapBt: { [weak self] in
                    self?.beginLoading()
                    self?.reloadData()
                }))
            }
            
            self?.finishLoading(with: nil)
        }
    }
    
}
