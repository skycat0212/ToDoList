//
//  TLTodoDetailViewController.swift
//  
//
//  Created by 김수진 on 2023/03/26.
//

import UIKit

import TLCore

public class TLTodoDetailViewController: UIViewController {
    
    public let todo: TLTodo
    
    public init(todo: TLTodo) {
        self.todo = todo
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
