//
//  TipsView.swift
//  TotalBill
//
//  Created by Sergio on 2.02.23.
//

import UIKit

final class TipsView: UIView {

    // MARK: - Properties

    let tipsArray = ["0%", "10%", "15%", "20%"]
    var tipsCount = 0
    
    // MARK: - UIElements

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tips"
        label.textColor = .gray
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        //collectionViewLayout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupHierarchy()
        setupLayout()
        setDelegates()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func setupHierarchy() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(collectionView)
        collectionView.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: Extension UICollectionViewDataSource

extension TipsView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsCollectionViewCell else {
        return UICollectionViewCell()

        }
        cell.procentLabel.text = tipsArray[indexPath.row]
        return cell
    }
}

// MARK: Extension UICollectionViewDelegate

extension TipsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            tipsCount = 10
        case 2:
            tipsCount = 15
        case 3:
            tipsCount = 20
        default:
            tipsCount = 0
        }
    }
}

// MARK: Extension UICollectionViewDelegateFlowLayout

extension TipsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4.6, height: collectionView.frame.width / 4.6)
    }
}

extension TipsView {
    func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),

            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
