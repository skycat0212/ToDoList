//
//  TLTodoListTableViewCell.swift
//  
//
//  Created by 김수진 on 2023/03/11.
//

import UIKit

import TLCore

class TLTodoListTableViewCell: UITableViewCell {
    
    var todo: TLTodo? {
        didSet {
            self.todoTitleLabel.text = self.todo?.title
            self.todoDescriptionLabel.text = self.todo?.description
        }
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    let todoTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let todoDescriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureLayout() {
        self.contentView.addSubview(self.stackView)
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(
                equalTo: self.contentView.topAnchor,
                constant: 20
            ),
            self.stackView.bottomAnchor.constraint(
                equalTo: self.contentView.bottomAnchor,
                constant: -20
            ),
            self.stackView.leadingAnchor.constraint(
                equalTo: self.contentView.leadingAnchor,
                constant: 20
            ),
            self.stackView.trailingAnchor.constraint(
                equalTo: self.contentView.trailingAnchor,
                constant: -20
            ),
        ])
        
        self.stackView.addArrangedSubview(self.todoTitleLabel)
        self.stackView.addArrangedSubview(self.todoDescriptionLabel)
    }

}
