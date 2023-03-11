//
//  TLTodo.swift
//  
//
//  Created by 김수진 on 2023/03/11.
//

import Foundation

public struct TLTodo {
    public init(_ title: String, _ description: String) {
        self.title = title
        self.description = description
    }
    
    public let title: String
    public let description: String
}
