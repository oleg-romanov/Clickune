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
            title: "Микроскопический буст",
            boost: 1,
            cost: 30
        )

        let cell2 = Boost(
            title: "Миллископический буст",
            boost: 2,
            cost: 90
        )

        let cell3 = Boost(
            title: "Мелкий буст",
            boost: 3,
            cost: 280
        )

        let cell4 = Boost(
            title: "Нормальный такой буст",
            boost: 4,
            cost: 1050
        )

        let cell5 = Boost(
            title: "Крутой буст",
            boost: 7,
            cost: 5450
        )

        let cell6 = Boost(
            title: "Топовый буст",
            boost: 12,
            cost: 9600
        )

        let cell7 = Boost(
            title: "Нереальный буст",
            boost: 20,
            cost: 28000
        )

        let cell8 = Boost(
            title: "Ультра буст",
            boost: 30,
            cost: 198000
        )

        let cell9 = Boost(
            title: "Крутой Ультра буст",
            boost: 85,
            cost: 780000
        )

        let cell10 = Boost(
            title: "Горчичка",
            boost: 200,
            cost: 5000000
        )
        
        let cell11 = Boost(
            title: "Представительский чаек",
            boost: 200000,
            cost: 1000000000
        )

        return [cell1, cell2, cell3, cell4, cell5,
                cell6, cell7, cell8, cell9, cell10, cell11]
    }
}
