//
//  EmptyTableViewModel.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 22.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

struct EmptyTableViewModel {
    
    // MARK: - Props
    let message: String
    let btnTitle: String
    
    // MARK: - Init
    
    // MARK: - Handler
    var tapBt: (() -> Void)?
}

extension EmptyTableViewModel {
    static func contactsEmpty(tapBt: (() -> Void)?) -> EmptyTableViewModel {
        .init(message: AppLocalization.ContactsEmpty.message.localized, btnTitle: AppLocalization.ContactsEmpty.btnTitle.localized, tapBt: tapBt)
    }
    
    static func contactsAccessDenied(tapBt: (() -> Void)?) -> EmptyTableViewModel {
        .init(message: AppLocalization.ContactsAccessDenied.message.localized, btnTitle: AppLocalization.ContactsAccessDenied.btnTitle.localized, tapBt: tapBt)
    }
}
