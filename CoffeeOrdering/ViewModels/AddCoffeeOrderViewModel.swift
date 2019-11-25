//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrdering
//
//  Created by Paulo Gama on 24/11/19.
//  Copyright © 2019 GamaPaulo. All rights reserved.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    private var webservice: Webservice

    var name = ""
    @Published var size = "Médio"
    @Published var coffeeName = ""
    var total: Double { calculateTotalPrice() }
    var coffees: [CoffeeViewModel] { Coffee.all().map(CoffeeViewModel.init) }
    
    init() {
        self.webservice = Webservice()
    }

    func placeOrder() {
        let order = Order(name: name, coffeeName: coffeeName, size: size, total: total)

        webservice.createCoffeeOrder(order: order) { _ in

        }
    }

    private func priceForSize() -> Double {
        let prices = [
            "Pequeno": 2.0,
            "Médio": 3.0,
            "Grande": 4.0
        ]

        return prices[size] ?? 0.0
    }

    private func calculateTotalPrice() -> Double {
        guard let coffeeViewModel = coffees.first(where: { $0.name == coffeeName }) else { return 0.0 }

        return coffeeViewModel.price * priceForSize()
    }
}
