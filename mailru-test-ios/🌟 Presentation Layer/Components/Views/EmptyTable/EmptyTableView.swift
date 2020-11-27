//
//  EmptyTableView.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 22.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

class EmptyTableView: UIView, DataSourceEmptyView {
    
    private let messageLb = UILabel()
    private let btn = UIButton(type: .system)
    
    // MARK: - Lifecycle
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    // MARK: - Props
    private var model: EmptyTableViewModel?
    
    // MARK: - Setup functions
    func setupView() {
        self.apply(.backgroundMain)
        self.setMessageLb()
        self.setBtn()
    }
    
    public func setup(model: EmptyTableViewModel) {
        self.model = model
        self.messageLb.text = model.message
        self.btn.setTitle(model.btnTitle, for: .normal)
    }
    
    private func setMessageLb() {
        self.messageLb.removeFromSuperview()
        self.addSubview(self.messageLb)
        self.messageLb.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.messageLb.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            self.messageLb.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.messageLb.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        ])
        self.messageLb.apply([.textMain, .body, .textAlignment(.center)])
        self.messageLb.numberOfLines = 0
    }
    
    private func setBtn() {
        self.btn.removeFromSuperview()
        self.addSubview(self.btn)
        self.btn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.btn.topAnchor.constraint(equalTo: self.messageLb.bottomAnchor, constant: 16),
            self.btn.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        self.btn.addTarget(self, action: #selector(self.tapBt), for: .touchUpInside)
    }
    
    @objc
    private func tapBt() {
        self.model?.tapBt?()
    }
    
}
