//
//  ContactListTableCellModel.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import GKRepresentable

class ContactListTableCellModel: TableCellModel {

    // MARK: - Override
    public override var cellIdentifier: String {
        ContactListTableCell.identifier
    }
    
    // MARK: - Props
    
    // MARK: - Init
    
    // MARK: - Handler
    typealias ActionHandler = (_ cell: ContactListTableCell, _ action: Action) -> Void
    
    enum Action {}
    
    var didAction: ActionHandler = { _, _ in }
}
