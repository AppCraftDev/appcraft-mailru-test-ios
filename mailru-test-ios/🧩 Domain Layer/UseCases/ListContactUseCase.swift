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
    func errorNotAccess(useCase: ListContactUseCase)
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
            
            guard access else {
                self.output?.errorNotAccess(useCase: self)
                return
            }
            
            guard error == nil else {
                self.output?.error(useCase: self, error: error)
                return
            }
            
            self._fetch { [weak self] result, error in
                guard let self = self else { return }
                guard error == nil else {
                    self.output?.error(useCase: self, error: error)
                    return
                }
                let contactModels = result.map({ ContactModel(contact: $0) })
                
                var result: [ContactModel] = []
                result.append(contentsOf: contactModels.filter({ !$0.name.isEmpty }).sorted(by: { $0.name < $1.name }))
                result.append(contentsOf: contactModels.filter({ $0.name.isEmpty }).sorted(by: { $0.name < $1.name }))
                
                self.output?.provideFetch(useCase: self, contacts: result)
            }
        }
    }
    
    func _fetch(completion: ([CNContact], Error?) -> Void) {
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactIdentifierKey,
            CNContactGivenNameKey,
            CNContactFamilyNameKey,
            CNContactImageDataKey,
            CNContactThumbnailImageDataKey,
            CNContactImageDataAvailableKey,
            CNContactPhoneNumbersKey
        ] as [CNKeyDescriptor]
        
        var contacts: [CNContact] = []
        
        let allContainers = (try? contactStore.containers(matching: nil)) ?? []
        allContainers.forEach({ container in
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            let containerResults = (try? contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch)) ?? []
            contacts.append(contentsOf: containerResults)
        })
        
        var contactsUnique: [CNContact] = []
        contacts.forEach({ contact in
            if !contactsUnique.contains(contact) {
                contactsUnique.append(contact)
            }
        })
        completion(contactsUnique, nil)
    }
    
}
