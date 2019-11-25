//
//  Order.swift
//  CoffeeOrdering
//
//  Created by Paulo Gama on 23/11/19.
//  Copyright © 2019 GamaPaulo. All rights reserved.
//

import Foundation

struct Order: Codable {
    let name: String
    let coffeeName: String
    let size: String
    let total: Double
}
