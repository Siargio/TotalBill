//
//  TipsCollectionView.swift
//  TotalBill
//
//  Created by Sergio on 2.02.23.
//

import UIKit

class TipsCollectionView: UICollectionView {

    // MARK: - UIElements
    
    var flowLayout = UICollectionViewFlowLayout()

    // MARK: - LifeCycle
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: flowLayout)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func setupView() {
        delegate = self
        dataSource = self
    }
}

extension TipsCollectionView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsCollectionViewCell else {
        return UICollectionViewCell()
        }

        return cell
    }
}

extension TipsCollectionView: UICollectionViewDelegate {

}
