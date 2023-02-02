//
//  TipsCollectionViewCell.swift
//  TotalBill
//
//  Created by Sergio on 2.02.23.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = UIColor.purple.cgColor
            } else {
                layer.borderWidth = 0
            }
        }
    }

    // MARK: - UIElements

    let procentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = .black
        label.textAlignment = .center
        //label.font = UIFont(name: "Avenir Next Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        procentLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 3.4)
    }

    // MARK: - Setup

    func setupView() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 10
    }

    func setupHierarchy() {
        addSubview(procentLabel)
    }

    func setLayout() {
        NSLayoutConstraint.activate([
            procentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            procentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            procentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
