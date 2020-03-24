//
//  ThermostatClient.swift
//  
//
//  Created by Michael Schlicker on 24.03.20.
//

import NIO

protocol ThermostatClient {
    func getThermostat(id: String) -> EventLoopFuture<Thermostat>
    func getThermostatIds() -> EventLoopFuture<[String]>
    func getMeasurements(id: String) -> EventLoopFuture<[Measurement]>
//    func uploadMeasurements(measurement: [Measurement]) -> EventLoopFuture<[Measurement]>
    func calculateStatistics(measurements: [Measurement]) -> EventLoopFuture<MeasurementStats>
}
