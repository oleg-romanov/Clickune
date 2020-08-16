//
//  CoinButton.swift
//  Clickune
//
//  Created by Олег Романов on 01.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

class CoinButton: UIButton {
    init() {
        super.init(frame: .zero)
        setupStyle()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle() {}
}
