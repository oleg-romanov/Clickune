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
            cost: 10
        )

        let cell2 = Boost(
            title: "Миллископический буст",
            boost: 2,
            cost: 40
        )

        let cell3 = Boost(
            title: "Мелкий буст",
            boost: 3,
            cost: 80
        )

        let cell4 = Boost(
            title: "Нормальный такой буст",
            boost: 4,
            cost: 150
        )

        let cell5 = Boost(
            title: "Крутой буст",
            boost: 7,
            cost: 450
        )

        let cell6 = Boost(
            title: "Топовый буст",
            boost: 12,
            cost: 600
        )

        let cell7 = Boost(
            title: "Нереальный буст",
            boost: 20,
            cost: 1800
        )

        let cell8 = Boost(
            title: "Ультра буст",
            boost: 30,
            cost: 3800
        )

        let cell9 = Boost(
            title: "Крутой Ультра буст",
            boost: 55,
            cost: 7800
        )

        let cell10 = Boost(
            title: "Горчичка",
            boost: 200,
            cost: 80800
        )

        return [cell1, cell2, cell3, cell4, cell5,
                cell6, cell7, cell8, cell9, cell10]
    }
}
