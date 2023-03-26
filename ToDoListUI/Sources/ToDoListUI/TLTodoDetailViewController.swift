//
//  TLTodoDetailViewController.swift
//  
//
//  Created by 김수진 on 2023/03/26.
//

import UIKit

import TLCore

public class TLTodoDetailViewController: UIViewController {
    
    public var todo: TLTodo {
        didSet {
            self.titleTextView.text = todo.title
            self.descriptionTextView.text = todo.description
        }
    }
    
    public var safeArea: UILayoutGuide { self.view.safeAreaLayoutGuide }
    private let titleTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }()
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }()
    
    public init(todo: TLTodo) {
        self.todo = todo
        super.init(nibName: nil, bundle: nil)
        self.titleTextView.text = todo.title
        self.descriptionTextView.text = todo.description
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViews()
    }
    
    private func setupViews() {
        let titleLabel: UILabel = {
            $0.text = "Todo"
            return $0
        }(UILabel())
        let descriptionLabel: UILabel = {
            $0.text = "Description"
            return $0
        }(UILabel())
        
        let stackView: UIStackView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.axis = .vertical
            $0.distribution = .fill
            $0.backgroundColor = .yellow
            return $0
        }(UIStackView(
            arrangedSubviews: [
                titleLabel,
                titleTextView,
                descriptionLabel,
                descriptionTextView
            ]
        ))
        
        titleLabel.heightAnchor.constraint(equalTo: descriptionLabel.heightAnchor).isActive = true
        titleTextView.heightAnchor.constraint(equalTo: descriptionTextView.heightAnchor).isActive = true
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        descriptionLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        titleTextView.setContentHuggingPriority(.defaultLow, for: .vertical)
        descriptionTextView.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
        ])
        
        
    }

}
