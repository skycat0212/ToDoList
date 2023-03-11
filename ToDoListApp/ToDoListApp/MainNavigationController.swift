//
//  MainNavigationController.swift
//  ToDoListApp
//
//  Created by 김수진 on 2023/03/11.
//

import UIKit

import ToDoListUI

class MainNavigationController: UINavigationController {
    
    init() {
        let rootViewController = TLTodoListViewController()
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
