//
//  OrderTotalView.swift
//  CoffeeOrdering
//
//  Created by Paulo Gama on 24/11/19.
//  Copyright © 2019 GamaPaulo. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
    let total: Double

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "$%.2f", total))
                .font(.title)
                .foregroundColor(.green)
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.65)
    }
}
