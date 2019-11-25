//
//  CoffeeViewModel.swift
//  CoffeeOrdering
//
//  Created by Paulo Gama on 24/11/19.
//  Copyright © 2019 GamaPaulo. All rights reserved.
//

import Foundation

class CoffeeListViewModel {
    var coffees = [CoffeeViewModel]()
}

struct CoffeeViewModel {
    private var coffee: Coffee
    var name: String { coffee.name }
    var imageURL: String { coffee.imageURL }
    var price: Double { coffee.price }

    init(coffee: Coffee) {
        self.coffee = coffee
    }
}
