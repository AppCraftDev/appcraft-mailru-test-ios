//
//  AppLocalization.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

enum AppLocalization {
    
    enum General: String, Localizable {
        case ok         = "OK"
        case save       = "SAVE"
        case cancel     = "CANCEL"
        case close      = "CLOSE"
        case attention  = "ATTENSION"
        case unknown    = "UNKNOWN"
        case loading    = "LOADING"
        case refresh    = "REFRESH"
        case tryAgain   = "TRY_AGAIN"
        case yes        = "YES"
        case noo        = "NO"
        case error      = "ERROR"
        case warning    = "WARNING"
        case cont       = "CONTINUE"
        case search     = "SEARCH"
        case next       = "NEXT"
    }
    
    enum Theme: String, Localizable {
        case light  = "APP_THEME_DARK"
    }
    
    enum Language: String, Localizable {
        case english    = "APP_LANG_ENG"
        case russian    = "APP_LANG_RUS"
    }
    
    enum Inital: String, Localizable {
        case title = "inital_title"
    }
    
    enum ContactList: String, Localizable {
        case navTitle = "contact_list_nav_title"
    }
    
    enum ContactsEmpty: String, Localizable {
        case message = "contacts_empty_message"
        case btnTitle = "contacts_empty_btn_title"
    }
    
    enum ContactsAccessDenied: String, Localizable {
        case message = "contacts_access_denied_message"
        case btnTitle = "contacts_access_denied_btn_title"
    }
    
}
