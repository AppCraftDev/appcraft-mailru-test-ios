//
//  PhoneTableCellModel.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 22.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import GKRepresentable

class PhoneTableCellModel: TableCellModel {

    // MARK: - Override
    public override var cellIdentifier: String {
        PhoneTableCell.identifier
    }
    
    // MARK: - Props
    let phone: String
    
    // MARK: - Init
    init(phone: String) {
        self.phone = phone
    }
    
    // MARK: - Handler
    typealias ActionHandler = (_ cell: PhoneTableCell, _ action: Action) -> Void
    
    enum Action {}
    
    var didAction: ActionHandler = { _, _ in }
}
