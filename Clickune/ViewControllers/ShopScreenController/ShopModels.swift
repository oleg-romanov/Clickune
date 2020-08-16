//
//  ShopModels.swift
//  Clickune
//
//  Created by Олег Романов on 14.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

struct Boost {
    var title: String
    var boost: Int
    var cost: Int
    
    static func generateCells() -> [Boost] {
        let cell1 = Boost(
            title: "Пицца",
            boost: 100000000000,
            cost: 10
        )
        
        let cell2 = Boost(
            title: "Шаурма",
            boost: 2,
            cost: 40
        )
        return [cell1, cell2]
    }
    
}
