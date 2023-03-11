//
//  TLTodoListViewController.swift
//  
//
//  Created by 김수진 on 2023/03/11.
//

import UIKit

public class TLTodoListViewController: UIViewController {
    
    public struct TodoList {}
    
    // MARK: - property
    // TODO: 초기값 없애기
    public var todoList: [TodoList] = [.init(), .init(), .init()] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    open var didSelect: (() -> Void)?
    
    var safeArea: UILayoutGuide {
        self.view.safeAreaLayoutGuide
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - lifecycle
    public init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureLayout()
        self.configureTableView()
    }
    
    // MARK: - func
    func configureLayout() {
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.safeArea.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeArea.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor),
        ])
    }
    
}

// MARK: - TableView
extension TLTodoListViewController {
    private func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(TLTodoListTableViewCell.self, forCellReuseIdentifier: TLTodoListTableViewCell.className)
    }
    
}

extension TLTodoListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.todoList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TLTodoListTableViewCell.className) as? TLTodoListTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
}

extension TLTodoListViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelect?()
    }
}
