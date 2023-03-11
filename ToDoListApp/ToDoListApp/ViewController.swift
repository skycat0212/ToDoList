//
//  ViewController.swift
//  ToDoListApp
//
//  Created by 김수진 on 2023/03/11.
//

import UIKit

import ToDoListUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc = TLTodoListViewController()
        self.present(vc,animated: true)
    }

}


