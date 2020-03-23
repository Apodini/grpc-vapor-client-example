import NIO
import Foundation

let host = "127.0.0.1:8080"
let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)

defer {
    try! group.syncShutdownGracefully()
}

let restClient = RESTClient(eventLoop: group.next())
//let thermostat = restClient.getThermostat(id: "528CE717-7A6E-48E4-A2EC-61AC3BCB3562")
//let thermostats = restClient.getThermostatIds()
//let measurements = restClient.getMeasurements(id: "528CE717-7A6E-48E4-A2EC-61AC3BCB3562")
let measurement1 = Measurement(id: nil, timestamp: 322, temperature: 84, thermostatId: "528CE717-7A6E-48E4-A2EC-61AC3BCB3562")
let measurement2 = Measurement(id: nil, timestamp: 346, temperature: 90, thermostatId: "528CE717-7A6E-48E4-A2EC-61AC3BCB3562")

//let newMeasurementResult = restClient.uploadMeasurement(measurement: newMeasurement)
let measurementStats = restClient.calculateStatistics(measurements: [measurement1, measurement2])
//thermostat.whenComplete { print($0) }
//thermostats.whenComplete { print($0) }
//measurements.whenComplete { print($0) }
//newMeasurementResult.whenComplete { print($0) }
measurementStats.whenComplete { print($0) }
RunLoop.main.run()
