//
//  CoinButton.swift
//  Click
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        setImage(UIImage(named: "coin"), for: .normal)
    }
}
