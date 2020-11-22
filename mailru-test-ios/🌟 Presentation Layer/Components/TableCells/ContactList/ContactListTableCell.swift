//
//  ContactListTableCell.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import GKRepresentable
import DPLibrary

class ContactListTableCell: TableCell {
    
    // MARK: - Props
    private let avatar = UIImageView()
    private let nameLb = UILabel()
    private let phoneMainLb = UILabel()

    // MARK: - Override
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        return
    }
    
    override func setupView() {
        self.setAvatar()
        self.setNameLb()
        self.setMainPhoneLb()
    }

    override func updateViews() {
        guard let model = self.model as? ContactListTableCellModel else { return }
        let contact = model.contact
        
        self.nameLb.text = contact.name
        self.phoneMainLb.text = contact.phoneMain
        
        self.setupView()
    }
    
    private func setAvatar() {
        self.avatar.removeFromSuperview()
        self.contentView.addSubview(self.avatar)
        self.avatar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.avatar.widthAnchor.constraint(equalToConstant: 40),
            self.avatar.heightAnchor.constraint(equalToConstant: 40),
            self.avatar.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.avatar.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.avatar.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
        ])
        
        guard let avatar = (self.model as? ContactListTableCellModel)?.contact.thumbnail else { return }
        self.avatar.image = avatar.image
        self.backgroundColor = avatar.backgroundColor
        self.avatar.apply([.avatar(cornerRadius: avatar.needRadius ? 20 : 0)])
    }
    
    private func setNameLb() {
        self.nameLb.removeFromSuperview()
        self.contentView.addSubview(self.nameLb)
        self.nameLb.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nameLb.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.nameLb.leadingAnchor.constraint(equalTo: self.avatar.trailingAnchor, constant: 16),
            self.nameLb.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        ])
        
        self.nameLb.apply([.textMain, .body])
    }
    
    private func setMainPhoneLb() {
        self.phoneMainLb.removeFromSuperview()
        self.contentView.addSubview(self.phoneMainLb)
        self.phoneMainLb.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.phoneMainLb.leadingAnchor.constraint(equalTo: self.avatar.trailingAnchor, constant: 16),
            self.phoneMainLb.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.phoneMainLb.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
        ])

        self.phoneMainLb.apply([.textSub, .bodyLight])
    }

}
