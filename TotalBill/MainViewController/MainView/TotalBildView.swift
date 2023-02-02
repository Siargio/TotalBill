//
//  TotalBildView.swift
//  TotalBill
//
//  Created by Sergio on 2.02.23.
//

import UIKit

final class TotalBildView: UIView {

    // MARK: - UIElements

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .gray
        //label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let sumTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.tintColor = .purple
        //textField.font = UIFont(name: "Avenir Next Bold", size: 45)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.font = UIFont(name: "Avenir Next", size: frame.width / 26.7)
        sumTextField.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.6)
    }

    // MARK: - Setup

    func setupHierarchy() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(titleLabel)
        addSubview(sumTextField)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),

            sumTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            sumTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            sumTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            sumTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
