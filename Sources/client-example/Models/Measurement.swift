//
//  Measurement.swift
//  
//
//  Created by Michael Schlicker on 22.03.20.
//

import Foundation

struct Measurement: Codable {
    var id: String?
    var timestamp: Int = Int(Date().timeIntervalSince1970)
    var temperature: Int
    var thermostatId: String
}

struct Measurements: Codable {
    let measurements: [Measurement]
}
