//
//  AvatarModel.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 22.11.2020.
//

import Foundation
import UIKit

struct AvatarModel {
    let image: UIImage?
    let backgroundColor: UIColor?
    let needRadius: Bool
    
    init?(imageData: Data?) {
        if let avatar = imageData {
            self.image = UIImage(data: avatar)
            self.backgroundColor = nil
            self.needRadius = true
        } else {
            if #available(iOS 13.0, *) {
                self.image = UIImage(systemName: "person")
                self.backgroundColor = nil
                self.needRadius = false
            } else {
                self.image = nil
                self.backgroundColor = AppTheme.backgroundContent()
                self.needRadius = true
            }
        }
    }
}
