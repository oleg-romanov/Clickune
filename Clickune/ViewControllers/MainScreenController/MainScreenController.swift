//
//  ViewController.swift
//  Clickune
//
//  Created by Олег Романов on 01.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit
import SPAlert

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
     //   UserDefaults.standard.set(customView.getScore(), forKey: "score")
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
        if let score: Int = UserDefaults.standard.value(forKey: "score") as? Int {
            customView.countCoins = score
        }
    }
}

extension MainScreenController: ShopScreenControllerDelegate {
    func appendBoost(boost: Boost) {
        if customView.countCoins >= boost.cost {
            customView.countCoins -= boost.cost
            SPAlert.present(title: "Success", message: "Boost updated", preset: .done)
            customView.value += boost.boost
        } else {
            SPAlert.present(title: "Fail", message: "Sorry Honey, no money...", preset: .error)
        }
        
    }
}

