//
//  ShopScreenController.swift
//  Clickune
//
//  Created by Олег Романов on 14.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

protocol ShopScreenControllerDelegate: AnyObject {
    func appendBoost(boost: Boost)
}

class ShopScreenController: UIViewController {
    
    lazy var customView: ShopView = ShopView()
    
    weak var delegate: ShopScreenControllerDelegate?
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        setupStyle()
        addActionHandlers()
    }
    
    private func setupStyle() {
        navigationItem.leftBarButtonItem = customView.backFromShopButton
        navigationItem.title = "Shop"
        customView.updateData(Boost.generateCells())
    }
    
    private func addActionHandlers() {
        customView.backFromShopButton.target = self
        customView.backFromShopButton.action = #selector(backFromShopButtonClicked)
        customView.dataSource.delegate = self
    }
    
    @objc private func backFromShopButtonClicked() {
        // AppDelegate.shared?.window?.rootViewController = MainScreenController()
        dismiss(animated: true, completion: nil)
    }
}

extension ShopScreenController: ShopViewDataSourceDelegate {
    func boostSelected(boost: Boost) {
        delegate?.appendBoost(boost: boost)
    }
}
