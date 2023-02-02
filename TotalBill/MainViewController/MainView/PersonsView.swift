//
//  PersonsView.swift
//  TotalBill
//
//  Created by Sergio on 2.02.23.
//

import UIKit

final class PersonsView: UIView {

    // MARK: - UIElements

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Persons"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let backgroundGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("–", for: .normal)
        button.tintColor = .gray
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 50)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.tintColor = .gray
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 40)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        counterLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.6)
    }

    // MARK: - Setup

    func setupHierarchy() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(titleLabel)
        addSubview(backgroundGrayView)
        backgroundGrayView.addSubview(minusButton)
        backgroundGrayView.addSubview(plusButton)
        backgroundGrayView.addSubview(counterLabel)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),

            backgroundGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            backgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundGrayView.bottomAnchor.constraint(equalTo: bottomAnchor),

            minusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor),
            minusButton.leadingAnchor.constraint(equalTo: backgroundGrayView.leadingAnchor),
            minusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),

            plusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor),
            plusButton.trailingAnchor.constraint(equalTo: backgroundGrayView.trailingAnchor),
            plusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),

            counterLabel.centerYAnchor.constraint(equalTo: backgroundGrayView.centerYAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10)
        ])
    }
}
