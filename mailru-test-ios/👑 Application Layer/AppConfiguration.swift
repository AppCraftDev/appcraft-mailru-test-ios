//
//  AppConfiguration.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

enum AppConfiguration {
    
    static var databaseContainerName: String {
        return "mailru-test-ios"
    }
    
    static var serverUrl: String {
        return ""
    }
    
    static var serverApi: String {
        return AppConfiguration.serverUrl + "/api"
    }
    
}
