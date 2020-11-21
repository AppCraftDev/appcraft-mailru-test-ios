//
//  ContactListTableCell.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import GKRepresentable

class ContactListTableCell: TableCell {

    // MARK: - Outlet
    
    // MARK: - Constraint
    
    // MARK: - Props

    // MARK: - Override
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        return
    }
    
    override func setupView() { }

    override func updateViews() {
        guard let model = self.model as? ContactListTableCellModel else { return }
    }
    
    // MARK: - Actions
    @objc
    private func tapButton(_ sender: UIButton) {
        guard let model = self.model as? ContactListTableCellModel else { return }
    }
    
    @objc
    private func tapGesture(_ gesture: UITapGestureRecognizer) {
        guard let model = self.model as? ContactListTableCellModel else { return }
    }

}
