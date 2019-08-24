//
//  main.swift
//  Travel
//
//  Created by Papneja, Brajmohan on 24/08/19.
//  Copyright © 2019 Papneja, Brajmohan. All rights reserved.
//

import Foundation

print("Hello, World!")
struct Trip {
    var name: String
    var destinations: [String]
}
let cruise = Trip(
    name: "Mediterranean Cruise",
    destinations: ["Sorrento", "Capri", "Taormina"])

print(cruise)



extension Trip: CustomDebugStringConvertible { 
    var debugDescription: String { "Trip description" }
}
