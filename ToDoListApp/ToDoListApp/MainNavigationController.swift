//
//  MainNavigationController.swift
//  ToDoListApp
//
//  Created by 김수진 on 2023/03/11.
//

import UIKit

import TLCore
import ToDoListUI

class MainNavigationController: UINavigationController {
    
    let rootViewController: UIViewController
    
    init() {
        self.rootViewController = TLTodoListViewController()
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.configureRootViewController()
    }
    
    func configureRootViewController() {
        guard let todoListViewController = self.rootViewController as? TLTodoListViewController else { return }
        
        todoListViewController.didSelect = { (todo: TLTodo) -> Void in
            let viewController = UIViewController()
            self.pushViewController(viewController, animated: true)
        }
        
        todoListViewController.plusButtonAction = {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .yellow
            self.present(viewController, animated: true)
        }
    }
}
