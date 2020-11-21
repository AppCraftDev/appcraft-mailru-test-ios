//
//  AppManager.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 21.11.2020.
//

import Foundation
import UIKit

class AppManager {
    
    static let current = AppManager()
    
    private var window: UIWindow?
    
    func setupKeyWindowRootController(_ vc: UIViewController) {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    
}
