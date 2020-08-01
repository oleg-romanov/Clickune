//
//  ViewController.swift
//  Click
//
//  Created by Олег Романов on 01.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

class MainScreenController: UIViewController {
    
    lazy var customView: MainScreenView = MainScreenView()

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.setText()
        addActionHandlers()
        
    }
    
    override func loadView() {
        view = customView
    }
    
    // MARK: - Action handlers
    
    private func addActionHandlers() {
        customView.coinButton.addTarget(self, action: #selector(coinButtonClicked), for: .touchUpInside)
    }
    
    @objc private func coinButtonClicked() {
        customView.changeCountOfCoins()
        customView.setText()
    }


}

