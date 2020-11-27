//
//  AvatarModel.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 22.11.2020.
//

import Foundation
import UIKit
import LetterAvatarKit

struct AvatarModel {
    let image: UIImage?
    
    init?(imageData: Data?, username: String) {
        if let avatar = imageData {
            self.image = UIImage(data: avatar)
        } else {
            self.image = LetterAvatarMaker()
                .setCircle(true)
                .setLettersFont(AppTheme.h3)
                .setUsername(username)
                .setBackgroundColors([ AppTheme.accentMain ])
                .build()
        }
    }
}
