//
//  AvatarViewModel.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 22.11.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

struct AvatarViewModel {
    
    // MARK: - Props
    
    // MARK: - Init
    let avatar: AvatarModel?
    
    // MARK: - Handler
    typealias ActionHandler = (_ view: AvatarView, _ action: Action) -> Void
    
    enum Action {}
    
    var didAction: ActionHandler = { _, _ in }
    
}
