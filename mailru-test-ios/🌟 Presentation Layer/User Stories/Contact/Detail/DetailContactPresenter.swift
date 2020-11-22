//
//  DetailContactPresenter.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper
import GKRepresentable

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
    init(contact: ContactModel) {
        self.viewModel = DetailContactViewModel(contact: contact)
    }
    
    // MARK: - DetailContactPresenterInput
    
    // MARK: - DetailContactViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
        
        let rows = self.viewModel.contact.phones.map({ PhoneTableCellModel(phone: $0) })
        self.view?.reloadData(with: rows)
    }
    
    func didSelectRow(_ row: TableCellModel) {
        guard let model = row as? PhoneTableCellModel else { return }
        guard let url = URL(string: "tel://\(model.phone.replace(["(", ")", "+", " ", "-"], with: ""))") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
        
    // MARK: - Module functions
}
