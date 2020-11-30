//
//  AppTheme.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKExtensions

enum AppTheme {
    
    // MARK: - Status bar style
    public static var statusBarStyle: UIStatusBarStyle {
        switch AppThemeManager.current.type {
        case .dark:
            return .default
        }
    }
    
    // MARK: - Window background color
    public static var backgroundMain: UIColor {
        if #available(iOS 13.0, *) {
            return .systemBackground
        } else {
            return .white
        }
    }

    // MARK: - Accent colors of the app
    public static var accentMain: UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return .systemBlue
        }
    }

    // MARK: - Text colors
    public static var textMain: UIColor {
        if #available(iOS 13.0, *) {
            return .label
        } else {
            return .black
        }
    }
    
    public static var textSub: UIColor {
        if #available(iOS 13.0, *) {
            return .secondaryLabel
        } else {
            return .gray
        }
    }
    
    public static var textAccent: UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return .systemBlue
        }
    }
    
    // MARK: - Typography
    public static let h1 = UIFont.systemFont(ofSize: 30, weight: .bold)
    public static let h3 = UIFont.systemFont(ofSize: 24, weight: .medium)
    public static let h4 = UIFont.systemFont(ofSize: 18, weight: .medium)
    public static let body = UIFont.systemFont(ofSize: 16, weight: .medium)
    public static let bodyLight = UIFont.systemFont(ofSize: 16, weight: .regular)
}
