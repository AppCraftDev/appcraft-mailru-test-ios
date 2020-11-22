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
    /// hex F0F0F0
    public static var backgroundMain: UIColor {
        if #available(iOS 13.0, *) {
            return .systemBackground
        } else {
            return .white
        }
    }
    
    /// hex FFFFFF
    public static func backgroundContent(alpha: CGFloat = 1.0) -> UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return .lightGray
        }
    }
    
    public static func backgroundControl(alpha: CGFloat = 1.0) -> UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return UIColor(hex: "1A2F51", alpha: alpha)
        }
    }

    // MARK: - Accent colors of the app
    public static var accentMain: UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return UIColor(hex: "04E785", alpha: 1.0)
        }
    }

    // MARK: - Text color on accent background
    public static var accentTextMain: UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return UIColor(hex: "101E34", alpha: 1.0)
        }
    }
    
    public static var accentTextSub: UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return UIColor(hex: "B0B0B4", alpha: 1.0)
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
    public static let h4 = UIFont.systemFont(ofSize: 18, weight: .medium)
    public static let body = UIFont.systemFont(ofSize: 16, weight: .medium)
    public static let bodyLight = UIFont.systemFont(ofSize: 16, weight: .regular)
}
