//
//  MeasurementStats.swift
//  
//
//  Created by Michael Schlicker on 22.03.20.
//

import Foundation

struct MeasurementStats: Codable {
    let maxTemperature: Int
    let minTemperature: Int
    let avgTemperature: Double
    let measurmentCount: Int
}
