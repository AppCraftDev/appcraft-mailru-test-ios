//
//  DetailContactViewModel.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

class DetailContactViewModel: ViperViewModel {
    
    let contact: ContactModel
    
    init(contact: ContactModel) {
        self.contact = contact
    }
    
}
