//
//  Coffee.swift
//  CoffeeOrdering
//
//  Created by Paulo Gama on 23/11/19.
//  Copyright © 2019 GamaPaulo. All rights reserved.
//

import Foundation

struct Coffee {
    let name: String
    let imageURL: String
    let price: Double
}

extension Coffee {
    static func all() -> [Coffee] {
        [
            Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            Coffee(name: "Espresso", imageURL: "Espresso", price: 2.1),
            Coffee(name: "Coado", imageURL: "Coado", price: 1.0)
        ]
    }
}
