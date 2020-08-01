//
//  View.swift
//  Click
//
//  Created by Олег Романов on 01.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit
import SnapKit

class MainScreenView: UIView {
    
    // MARK: - Properties
    
    private var countCoins: Int = 0
    
    private lazy var countCoinsLabel: UILabel = {
        var countCoinsLabel = UILabel()
        countCoinsLabel.textColor = .black
        countCoinsLabel.textAlignment = .center
        countCoinsLabel.font = .boldSystemFont(ofSize: 50)
        
        return countCoinsLabel
    } ()
    
    lazy var coinButton: CoinButton = CoinButton()
    
    // MARK: - Init
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        commonInit()
    }
    
    private func commonInit() {
        addSubviews()
        makeConstraints()
        setupStyle()
    }
    
    private func setupStyle() {
        backgroundColor = .red
    }
    
    private func addSubviews() {
        addSubview(countCoinsLabel)
        addSubview(coinButton)
    }
    
    private func makeConstraints() {
        coinButton.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(90)
            make.size.equalTo(CGSize(width: 350, height: 350))
        }
        
        countCoinsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-90)
        }
    }
    
    func setText() {
        countCoinsLabel.text = String(countCoins)
    }
    
    func changeCountOfCoins () {
        self.countCoins += 1
        print(countCoins)
    }
    
}
