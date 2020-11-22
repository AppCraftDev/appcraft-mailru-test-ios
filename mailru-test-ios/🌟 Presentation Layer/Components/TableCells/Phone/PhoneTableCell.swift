//
//  PhoneTableCell.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 22.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import GKRepresentable

class PhoneTableCell: TableCell {
    
    // MARK: - Props
    private let phoneLb = UILabel()

    // MARK: - Override
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        return
    }
    
    override func setupView() {
        self.setPhoneLb()
    }

    override func updateViews() {
        guard let model = self.model as? PhoneTableCellModel else { return }
        self.phoneLb.text = model.phone
    }
    
    private func setPhoneLb() {
        self.phoneLb.removeFromSuperview()
        self.contentView.addSubview(self.phoneLb)
        self.phoneLb.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.phoneLb.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.phoneLb.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.phoneLb.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.phoneLb.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
        ])

        self.phoneLb.apply([.textAccent, .h4])
    }

}
