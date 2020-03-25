import NIO
import Foundation

/// Setup application

let host = "localhost"
let port = 8080
let group = MultiThreadedEventLoopGroup(numberOfThreads: 4)

defer {
    try! group.syncShutdownGracefully()
}

/// Setup Clients

//let restClient = RESTThermostatClient(eventLoop: group.next())
let grpcClient = try GRPCThermostatClient(group: group)

/// Call Endpoints / gRPC requests

//let thermostat = grpcClient.getThermostat(id: "528CE717-7A6E-48E4-A2EC-61AC3BCB3562")
let thermostats = grpcClient.getThermostatIds()
//let measurements = restClient.getMeasurements(id: "528CE717-7A6E-48E4-A2EC-61AC3BCB3562")
//let measurement1 = Measurement(id: nil, timestamp: 322, temperature: 84, thermostatId: "528CE717-7A6E-48E4-A2EC-61AC3BCB3562")
//let measurement4 = Measurement(id: nil, timestamp: 346, temperature: 0, thermostatId: "528CE717-7A6E-48E4-A2EC-61AC3BCB3562")
//let newMeasurementResult = grpcClient.uploadMeasurement(measurements: [measurement1, measurement2])
//let measurementStats = grpcClient.calculateStatistics(measurements: [measurement1, measurement4])
//let newMeasurementResult = restClient.uploadMeasurement(measurement: measurement4)

/// Print Results

//thermostat.whenComplete { print($0) }
thermostats.whenComplete { print($0) }
//measurements.whenComplete { print($0) }
//newMeasurementResult.whenComplete { print($0) }
//measurementStats.whenComplete { print($0) }

RunLoop.main.run()
