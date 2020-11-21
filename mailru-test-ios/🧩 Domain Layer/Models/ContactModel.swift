//
//  ContactModel.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//

import Foundation
import Contacts

struct ContactModel {
    let id: String
    let image: Data?
    let thumbnail: Data?
    let name: String
    let phoneMain: String?
    let phones: [String]
    
    init(contact: CNContact) {
        self.id = contact.identifier
        
        self.image = contact.imageData
        self.thumbnail = contact.thumbnailImageData
        
        let givenName = contact.givenName
        let familyName = contact.familyName
        self.name = "\(givenName)\(givenName.isEmpty ? "" : " ")\(familyName)"
        
        self.phoneMain = ""
        self.phones = []
    }
}
