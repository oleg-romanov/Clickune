//
//  View.swift
//  Clickune
//
//  Created by Олег Романов on 01.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit
import SnapKit

class MainScreenView: UIView {
    
    // MARK: - Properties
    
    var countCoins: Int = 0 {
        didSet {
            countCoinsLabel.text = String(countCoins)
        }
    }
    
    var value: Int = 1 {
        didSet {
            offsetLabel.text = String(value)
        }
    }
    
    func onceDisplayCountCoins() {
        countCoinsLabel.text = String(countCoins)
    }
    
    func onceDisplayValue() {
        offsetLabel.text = String(value)
    }
    
    
    private lazy var countCoinsLabel: UILabel = {
        var countCoinsLabel = UILabel()
        countCoinsLabel.textColor = .white
        countCoinsLabel.textAlignment = .center
        countCoinsLabel.font = .italicSystemFont(ofSize: 80)
        countCoinsLabel.adjustsFontSizeToFitWidth = true
        countCoinsLabel.minimumScaleFactor = 0.5
        return countCoinsLabel
    } ()
    
    private var offsetLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .italicSystemFont(ofSize: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    lazy var coinButton: CoinButton = CoinButton()
    
    lazy var shopButton: ShopButton = ShopButton(title: "Shop")
    
    // MARK: - Init
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubviews()
        makeConstraints()
        setupStyle()
    }
    
    private func setupStyle() {
        backgroundColor = .blue
    }
    
    private func addSubviews() {
        addSubview(countCoinsLabel)
        addSubview(coinButton)
        addSubview(shopButton)
        addSubview(offsetLabel)
    }
    
    private func makeConstraints() {
        countCoinsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().inset(90)
            make.width.equalToSuperview()
        }
        
        coinButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        shopButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide).inset(20)
           
        }
        
        offsetLabel.snp.makeConstraints { make in
            make.bottom.equalTo(shopButton).inset(10)
            make.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(shopButton.snp.trailing).offset(25)
        }
    }
    
    func changeCountOfCoins () {
        self.countCoins += value
        print(countCoins)
    }
}
