//
//  ViewController.swift
//  Clickune
//
//  Created by Олег Романов on 01.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import SPAlert
import UIKit

class MainScreenController: UIViewController {
    lazy var customView: MainScreenView = MainScreenView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addActionHandlers()
        loadScore()
        customView.onceDisplayCountCoins()
        customView.onceDisplayValue()
    }

    override func loadView() {
        view = customView
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        customView.coinButton.addTarget(self, action: #selector(coinButtonClicked), for: .touchUpInside)
        customView.shopButton.addTarget(self, action: #selector(shopButtonClicked), for: .touchUpInside)
    }

    @objc private func coinButtonClicked() {
        customView.changeCountOfCoins()
        MainService.shared.updateScore(customView.countCoins) { result, error in
            if let error = error {
                SPAlert.present(title: error.localizedDescription, message: nil, preset: .error)
            }
        }
    }

    @objc private func shopButtonClicked() {
        showShop()
    }

    private func showShop() {
        // AppDelegate.shared?.window?.rootViewController = ShopScreenController()
        let shopScreenController = ShopScreenController()
        let navigationController = UINavigationController(rootViewController: shopScreenController)
        shopScreenController.delegate = self
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }

    // MARK: - Private methods

    private func loadScore() {
        MainService.shared.getScore { result, error in
            if let error = error {
                SPAlert.present(title: error.localizedDescription, message: nil, preset: .error)
                return
            }
            customView.countCoins = result ?? 0
        }
        
        MainService.shared.getOffset { result, error in
        if let error = error {
            SPAlert.present(title: error.localizedDescription, message: nil, preset: .error)
            return
        }
        customView.value = result ?? 0
    }
}
}

extension MainScreenController: ShopScreenControllerDelegate {
    func appendBoost(boost: Boost) {
        if customView.countCoins >= boost.cost {
            customView.countCoins -= boost.cost
            SPAlert.present(title: "Успех", message: "Буст увеличен", preset: .done)
            customView.value += boost.boost
            MainService.shared.updateOffset(customView.value) {result, error in
                if let error = error {
                    SPAlert.present(title: error.localizedDescription, message: nil, preset: .error)
                    return
                }
                customView.value = result ?? 0
            }
        } else {
            SPAlert.present(title: "Ошибка", message: "Подкопи деньжат, пупсик", preset: .error)
        }
    }
}
