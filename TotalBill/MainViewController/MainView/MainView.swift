//
//  MainView.swift
//  TotalBill
//
//  Created by Sergio on 2.02.23.
//

import UIKit

final class MainView: UIView {

    // MARK: - Properties

    let totalBildView = TotalBildView()
    let personsView = PersonsView()
    let tipsView = TipsView()

    // MARK: - UIElements

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .black
        //label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoimage1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the invoice amount and clock \"Calculate\""
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        //label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .purple
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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

        titleLabel.font = UIFont(name: "Avenir Next Bold", size: frame.width * 0.1)

    }

    // MARK: - Setup

    func setupHierarchy() {
        backgroundColor = .white

        addSubview(titleLabel)
        addSubview(titleImage)
        addSubview(descriptionLabel)
        addSubview(totalBildView)
        addSubview(personsView)
        addSubview(calculateButton)
        addSubview(tipsView)
    }
}

extension MainView {

    func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            titleImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            titleImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.23),
            titleImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.23),

            descriptionLabel.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            totalBildView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            totalBildView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            totalBildView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            totalBildView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.13),

            personsView.topAnchor.constraint(equalTo: totalBildView.bottomAnchor, constant: 10),
            personsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            personsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            personsView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.13),

            tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.16),

            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 10),
            calculateButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.06)
        ])
    }
}
