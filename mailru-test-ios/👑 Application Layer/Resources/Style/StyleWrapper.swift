//
//  StyleWrapper.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import UIKit

typealias Style<Element> = (Element) -> Void

enum StyleWrapper<Element> {
    case wrap(style: Style<Element>)
}

extension StyleWrapper where Element: UIView {
    
    static var backgroundMain: StyleWrapper {
        return .wrap { view in
            view.backgroundColor = AppTheme.backgroundMain
        }
    }
    
    static func backgroundContent(alpha: CGFloat = 1.0) -> StyleWrapper {
        return .wrap { view in
            view.backgroundColor = AppTheme.backgroundContent(alpha: alpha)
        }
    }
    
    static func backgroundControl(alpha: CGFloat = 1.0) -> StyleWrapper {
        return .wrap { view in
            view.backgroundColor = AppTheme.backgroundControl(alpha: alpha)
        }
    }
    
    static var accentMain: StyleWrapper {
        return .wrap { view in
            view.backgroundColor = AppTheme.accentMain
        }
    }
    
}

extension StyleWrapper where Element: UIImageView {
    
    static func generalFitStyle() -> StyleWrapper {
        return .wrap { imageView in
            imageView.contentMode = .scaleAspectFit
            imageView.layer.masksToBounds = true
        }
    }
    
    static func generalFillStyle() -> StyleWrapper {
        return .wrap { imageView in
            imageView.contentMode = .scaleAspectFill
            imageView.layer.masksToBounds = true
        }
    }
    
}

extension StyleWrapper where Element: UILabel {
    
    static func text(_ value: String?) -> StyleWrapper {
        return .wrap { label in
            label.text = value
        }
    }
    
    static func textAlignment(_ value: NSTextAlignment) -> StyleWrapper {
        return .wrap { label in
            label.textAlignment = value
        }
    }
    
    static var h1: StyleWrapper {
        return .wrap { label in
            label.font = AppTheme.h1
        }
    }
    
    static var textMain: StyleWrapper {
        return .wrap { label in
            label.textColor = AppTheme.textMain
        }
    }
    
    static var textSub: StyleWrapper {
        return .wrap { label in
            label.textColor = AppTheme.textSub
        }
    }

}
