//
//  ListContactViewController.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol ListContactViewInput: ViperViewInput { }

protocol ListContactViewOutput: ViperViewOutput { }

class ListContactViewController: ViperViewController, ListContactViewInput {

    // MARK: - Props
    fileprivate var output: ListContactViewOutput? {
        guard let output = self._output as? ListContactViewOutput else { return nil }
        return output
    }
    
    private let table = UITableView()
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = AppLocalization.ContactList.navTitle.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.setTable()
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.backgroundMain)
    }
    
    // MARK: - ListContactViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension ListContactViewController { }

// MARK: - Module functions
extension ListContactViewController {
    
    private func setTable() {
        self.table.removeFromSuperview()
        self.view.addSubview(self.table)
        self.table.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.table.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.table.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.table.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
}
