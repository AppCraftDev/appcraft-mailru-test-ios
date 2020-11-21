//
//  ListContactUseCase.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import GKUseCase
import Contacts

protocol ListContactUseCaseInput: UseCaseInput {
    func fetch()
}

protocol ListContactUseCaseOutput: UseCaseOutput {
    func error(useCase: ListContactUseCase, error: Error?)
    func provideFetch(useCase: ListContactUseCase, contacts: [ContactModel])
}

class ListContactUseCase: UseCase, ListContactUseCaseInput {
    
    // MARK: - Props
    var output: ListContactUseCaseOutput? {
        guard let output = self._output as? ListContactUseCaseOutput else { return nil }
        return output
    }
    
    // MARK: - Init
    
    // MARK: - Input
    func fetch() {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { [weak self] access, error in
            guard let self = self else { return }
            guard access, error == nil else {
                self.output?.error(useCase: self, error: error)
                return
            }
            
            let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
            let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
            
            let predicate = CNContact.predicateForContactsInContainer(withIdentifier: store.defaultContainerIdentifier())
            let keysToFetch = [
                CNContactIdentifierKey,
                CNContactGivenNameKey,
                CNContactFamilyNameKey,
                CNContactImageDataKey,
                CNContactThumbnailImageDataKey,
                CNContactImageDataAvailableKey
            ] as [CNKeyDescriptor]
            
            do {
                // 3.
//                try store.enumerateContacts(with: request, usingBlock: { [weak self] contact, stopPointer in
////                    self.contacts.append(FetchedContact(firstName: contact.givenName, lastName: contact.familyName, telephone: contact.phoneNumbers.first?.value.stringValue ?? ""))
//                })
                
                let contacts = try store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch)
                let contactModels = contacts.map({ ContactModel(contact: $0) })
                self.output?.provideFetch(useCase: self, contacts: contactModels)
            } catch let error {
                self.output?.error(useCase: self, error: error)
            }
        }
    }
    
}
