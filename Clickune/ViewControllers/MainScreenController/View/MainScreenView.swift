//
//  View.swift
//  Clickune
//
//  Created by Олег Романов on 01.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import SnapKit
import UIKit

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
    }()

    private var offsetLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .italicSystemFont(ofSize: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()

    lazy var shopButton: ShopButton = ShopButton(title: "Shop")
    
    lazy var clickIndicator: ClickIndicator = ClickIndicator()

    // MARK: - Init

    init() {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        addSubviews()
        makeConstraints()
        setupStyle()
    }

    private func setupStyle() {
        backgroundColor = .blue
        isUserInteractionEnabled = true
        isMultipleTouchEnabled = true
    }

    private func addSubviews() {
        addSubview(clickIndicator)
        addSubview(countCoinsLabel)
        addSubview(shopButton)
        addSubview(offsetLabel)
    }

    private func makeConstraints() {
        clickIndicator.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        countCoinsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().inset(90)
            make.width.equalToSuperview()
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

    func changeCountOfCoins() {
        countCoins += value
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let tapOrigin = touch.location(in: self)
            clickIndicator.clickHappend(tapOrigin)
            print(tapOrigin)
        }
        print("\n")
        super.touchesBegan(touches, with: event)
    }
}
