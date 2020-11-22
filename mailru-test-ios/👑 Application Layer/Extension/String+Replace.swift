//
//  String+Replace.swift
//  mailru-test-ios
//
//  Created by Дмитрий Поляков on 22.11.2020.
//

import Foundation

extension String {
    
    func replace(_ targets: [String], with: String) -> String {
        var string = self
        targets.forEach({ string = string.replace($0, with: with) })
        return string
    }
    
}
