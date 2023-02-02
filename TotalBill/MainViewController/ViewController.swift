//
//  MainViewController.swift
//  TotalBill
//
//  Created by Sergio on 2.02.23.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Properties

    let customView = MainView()
    var counter = 2
    var tipsCount = 1
    
    // MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        creatingActionButton()
        addTap()
    }

    // MARK: - Setup

    private func creatingActionButton() {
        customView.personsView.minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        customView.personsView.plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        customView.calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }

    @objc func minusButtonTapped() {
        counter -= 1
        customView.personsView.counterLabel.text = "\(counter)"

        if counter <= 2 {
            customView.personsView.minusButton.isEnabled = false
        }
    }

    @objc func plusButtonTapped() {
        counter += 1
        customView.personsView.counterLabel.text = "\(counter)"
        customView.personsView.minusButton.isEnabled = true
    }

    @objc func calculateButtonTapped() {
        guard let totalBill = customView.totalBildView.sumTextField.text,
              let totalBillInt = Int(totalBill) else {
            customView.descriptionLabel.text = "Enter total bill"
            customView.descriptionLabel.textColor = .red
            return }

        let tipsView = customView.tipsView.tipsCount
        let summ = totalBillInt + totalBillInt * tipsView / 100

        if counter < 2 {
            customView.descriptionLabel.text = "Enter per person"
            customView.descriptionLabel.textColor = .red
        } else {
            let result = summ / counter
            customView.descriptionLabel.text = "\(result) per person"
            customView.descriptionLabel.textColor = .black
        }
    }

    func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
