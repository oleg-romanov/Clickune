//
//  BackButtonFromShop.swift
//  Clickune
//
//  Created by Олег Романов on 14.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

class BackFromShopButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setupStyle(title: title)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle(title: String) {
        setTitle(title, for: .normal)
    }
}
