//
//  AddCoffeeOrderView.swift
//  CoffeeOrdering
//
//  Created by Paulo Gama on 24/11/19.
//  Copyright © 2019 GamaPaulo. All rights reserved.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    @ObservedObject private var addCoffeeViewModel = AddCoffeeOrderViewModel()
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("INFORMAÇÃO").font(.body)) {
                        TextField("Digite o nome", text: $addCoffeeViewModel.name)
                    }

                    Section(header: Text("Selecione seu café").font(.body)) {
                        ForEach(addCoffeeViewModel.coffees, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeViewModel.coffeeName)
                        }
                    }

                    Section(header: Text("Selecione o tamanho").font(.body), footer: OrderTotalView(total: addCoffeeViewModel.total)) {
                        Picker("", selection: $addCoffeeViewModel.size) {
                            Text("Pequeno").tag("Pequeno")
                            Text("Médio").tag("Médio")
                            Text("Grande").tag("Grande")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }

                HStack {
                    Button("Fazer Pedido") {
                        self.addCoffeeViewModel.placeOrder()
                        self.isPresented = false
                    }
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(.white)
                    .background(Color(red: 46/255, green: 204/255, blue: 113/255))
                    .cornerRadius(10)
            }
            .navigationBarTitle("Adicionar pedido")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    let coffee: CoffeeViewModel
    @Binding var selection: String

    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding([.leading], 20)
            Spacer()
            if (selection == coffee.name) { Image(systemName: "checkmark") }
        }.onTapGesture { self.selection = self.coffee.name }
    }
}
