//
//  TLTodoListViewController.swift
//  
//
//  Created by 김수진 on 2023/03/11.
//

import UIKit

import TLCore

public class TLTodoListViewController: UIViewController {
    
    // MARK: - property
    public var todoList: [TLTodo] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    public var hasPlusButton: Bool {
        didSet {
            self.updateNavigationUI()
        }
    }
    public var didSelect: (() -> Void)?
    public var plusButtonAction: (() -> Void)?
    
    var safeArea: UILayoutGuide {
        self.view.safeAreaLayoutGuide
    }
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - lifecycle
    public init(hasPlusButton: Bool = true){
        self.hasPlusButton = hasPlusButton
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureLayout()
        self.configureTableView()
        self.configureNavigation()
    }
    
    // MARK: - func
    func configureLayout() {
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.safeArea.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor),
        ])
    }
    
    func configureNavigation() {
        // TODO: navigationController.view 의 색상 지정에 대한 책임은 누구한테 있는지 생각해보기
        // TODO: 색상 값 모아서 관리하기
        self.navigationController?.view.backgroundColor = .cyan
        self.updateNavigationUI()
    }
    
    func updateNavigationUI() {
        self.navigationController?.navigationBar.backgroundColor = .cyan
        
        self.navigationItem.title = "할 일 목록"
        
        if hasPlusButton {
            let addTodoButton: UIBarButtonItem = {
                let button = UIBarButtonItem(
                    image: UIImage(systemName: "plus") ?? UIImage(),
                    style: .plain,
                    target: self,
                    action: #selector(self.touchUpInsidePlusButton)
                )
                return button
            }()
            self.navigationItem.rightBarButtonItems = [addTodoButton]
        }
    }
    
    @objc
    func touchUpInsidePlusButton() {
        self.plusButtonAction?()
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
        
        cell.todo = todoList[indexPath.row]
        return cell
    }
    
}

extension TLTodoListViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelect?()
    }
}
