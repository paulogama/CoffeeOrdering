//
//  OrderListView.swift
//  CoffeeOrdering
//
//  Created by Paulo Gama on 23/11/19.
//  Copyright © 2019 GamaPaulo. All rights reserved.
//

import SwiftUI

struct OrderListView: View {
    var orders: [OrderViewModel]

    init(orders: [OrderViewModel]) {
        self.orders = orders
    }

    var body: some View {
        List {
            ForEach(orders, id: \.id) { order in
                HStack {
                    Image(order.coffeeName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(16)

                    VStack {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .bottom], 10)

                        HStack {
                            Text(order.coffeeName)
                            .padding(10)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)

                            Text(order.size)
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: Order(name: "Mary", coffeeName: "Coado", size: "Médio", total: 4.5))])
    }
}
