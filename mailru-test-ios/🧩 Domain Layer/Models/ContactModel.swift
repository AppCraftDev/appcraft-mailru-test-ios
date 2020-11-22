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
    let image: AvatarModel?
    let thumbnail: AvatarModel?
    let name: String
    let phoneMain: String?
    let phones: [String]
    
    init(contact: CNContact) {
        self.id = contact.identifier
        
        self.image = AvatarModel(imageData: contact.imageData)
        self.thumbnail = AvatarModel(imageData: contact.thumbnailImageData)
        
        let givenName = contact.givenName
        let familyName = contact.familyName
        self.name = "\(givenName)\(givenName.isEmpty ? "" : " ")\(familyName)"
        
        let phoneNumbers = contact.phoneNumbers
        let phones = phoneNumbers.map({ $0.value.stringValue })
        self.phoneMain = phoneNumbers.first(where: { $0.label == CNLabelPhoneNumberMain })?.value.stringValue ?? phones.first
        self.phones = phones
    }
}
