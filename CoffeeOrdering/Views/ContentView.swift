//
//  ContentView.swift
//  CoffeeOrdering
//
//  Created by Paulo Gama on 23/11/19.
//  Copyright © 2019 GamaPaulo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var orderListViewModel = OrderListViewModel()
    @State private var showModal = false

    var body: some View {
        NavigationView {
            OrderListView(orders: orderListViewModel.orders)
                .sheet(isPresented: $showModal) {
                    AddCoffeeOrderView(isPresented: self.$showModal)
            }
            .navigationBarTitle("Pedidos de Café")
            .navigationBarItems(leading: Button(action: reloadOrders) {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.white)
                }, trailing: Button(action: showAddCoffeeOrderView) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
            })
        }
    }

    private func reloadOrders() { orderListViewModel.fetchOrders() }
    private func showAddCoffeeOrderView() { showModal = true }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
