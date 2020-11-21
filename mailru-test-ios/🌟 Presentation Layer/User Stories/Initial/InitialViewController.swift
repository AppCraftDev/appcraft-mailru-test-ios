//
//  InitialViewController.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol InitialViewInput: ViperViewInput { }

protocol InitialViewOutput: ViperViewOutput { }

class InitialViewController: ViperViewController, InitialViewInput {
    
    // MARK: - Props
    fileprivate var output: InitialViewOutput? {
        guard let output = self._output as? InitialViewOutput else { return nil }
        return output
    }
    
    private let titleLb = UILabel()
    
    // MARK: - Lifecycle
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .default
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.setTitleLb()
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.backgroundMain)
        self.titleLb.apply([.h1, .text(AppLocalization.Inital.title.localized), .textMain, .textAlignment(.center)])
    }
    
    // MARK: - InitialViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension InitialViewController { }

// MARK: - Animations
extension InitialViewController { }

// MARK: - Module functions
extension InitialViewController {
    
    private func setTitleLb() {
        self.titleLb.removeFromSuperview()
        self.view.addSubview(self.titleLb)
        self.titleLb.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.titleLb.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.titleLb.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            self.titleLb.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            self.titleLb.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
        ])
    }
    
}
