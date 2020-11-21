//
//  DetailContactViewController.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol DetailContactViewInput: ViperViewInput { }

protocol DetailContactViewOutput: ViperViewOutput { }

class DetailContactViewController: ViperViewController, DetailContactViewInput {

    // MARK: - Outlets
    
    // MARK: - Props
    fileprivate var output: DetailContactViewOutput? {
        guard let output = self._output as? DetailContactViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    // MARK: - DetailContactViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension DetailContactViewController { }

// MARK: - Module functions
extension DetailContactViewController { }
