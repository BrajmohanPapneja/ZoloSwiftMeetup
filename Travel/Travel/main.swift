//
//  main.swift
//  Travel
//
//  Created by Papneja, Brajmohan on 24/08/19.
//  Copyright © 2019 Papneja, Brajmohan. All rights reserved.
//

import Foundation

print("Hello, World!")
protocol Activity {}
struct Trip :Activity{
    var name: String
    var destinations: [String]
}
let cruise : Activity  = Trip(
    name: "Mediterranean Cruise",
    destinations: ["Sorrento", "Capri", "Taormina"])

print(cruise)
print(cruise)





extension Trip: CustomDebugStringConvertible { 
    var debugDescription: String { "Trip description po" }
}


/*
 
 po cruise
 po cruise.name.uppercased()
 po cruise.destinations.sorted()
 expression --object-description -- cruise
 
 
 
 p cruise
 p $R2.destinations
 p $R2.name
 
 
 //Dynamic Type resolution
 protocol Activity {}
 struct Trip : Activity{
 var name: String
 var destinations: [String]
 }
 
 let cruise :Activity = Trip(
 name: "Mediterranean Cruise",
 destinations: ["Sorrento", "Capri", "Taormina"])

 
 p (cruise as! Trip).name
 p (cruise as! Trip).destinations.sorted()
 
 expression --raw -- cruise.name
 
 
 
 v cruise
 frame variable cruise
 v cruise.name
 p cruise.destinations.isEmpty
 po cruise.name.count
 
 
 
 Formatters
type filter add Travel.Trip --child name
type filter delete Travel.Trip
 
type summary add Travel.Trip --summary-string "${var.name} from ${var.destinations[0]} to ${var.destinations[2]}"
type summary delete Travel.Trip
 
command script import ~/LLDB_Python/Trip.py
type summary add Travel.Trip --python-function Trip.SummaryProvider
 
type summary delete Travel.Trip
 
 */
