//
//  OrderListViewModel.swift
//  CoffeeOrdering
//
//  Created by Paulo Gama on 23/11/19.
//  Copyright © 2019 GamaPaulo. All rights reserved.
//

import Foundation

class OrderListViewModel: ObservableObject {
    @Published var orders = [OrderViewModel]()

    init() {
        fetchOrders()
    }

    func fetchOrders() {
        Webservice().getAllOrders() { orders in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }
}

class OrderViewModel {
    private var order: Order
    
    var id = UUID()
    var name: String { order.name }
    var size: String { order.size }
    var coffeeName: String { order.coffeeName}
    var total: Double { order.total }

    init(order: Order) {
        self.order = order
    }
}
