//
//  AvatarView.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 22.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

class AvatarView: UIView {
    
    public let heightDefault: CGFloat = 112
    private let avatar = UIImageView()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    // MARK: - Props
    private var model: AvatarViewModel?
    
    // MARK: - Setup functions
    public func setupView() {
        self.setAvatar()
    }
    
    public func setup(model: AvatarViewModel) {
        self.model = model
        self.setupView()
    }
    
    private func setAvatar() {
        self.avatar.removeFromSuperview()
        self.addSubview(self.avatar)
        self.avatar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.avatar.widthAnchor.constraint(equalToConstant: 80),
            self.avatar.heightAnchor.constraint(equalToConstant: 80),
            self.avatar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.avatar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
        
        guard let avatar = self.model?.avatar else { return }
        self.avatar.image = avatar.image
        self.backgroundColor = avatar.backgroundColor
        self.avatar.apply([.avatar(cornerRadius: avatar.needRadius ? 40 : 0)])
    }
    
}
