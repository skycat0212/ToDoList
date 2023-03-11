//
//  NSObject+.swift
//  
//
//  Created by 김수진 on 2023/03/11.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
