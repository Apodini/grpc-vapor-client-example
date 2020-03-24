import Foundation
import GRPC
import NIO

class GRPCThermostatClient: ThermostatClient {
    func getThermostat(id: String) -> EventLoopFuture<Thermostat> {
        var thermostatId = _ThermostatID()
        thermostatId.id = id
        return client.getThermostatWithId(thermostatId).response
            .map { Thermostat(id: $0.id, name: $0.name, isSmartThermostat: $0.isSmartThermostat) }
    }

    func getThermostatIds() -> EventLoopFuture<[String]> {
        var ids: [String] = []
        return client.getThermostatIds(_Empty(), handler: { ids.append($0.id) })
            .status
            .map { _ in ids }
    }

    func getMeasurements(id: String) -> EventLoopFuture<[Measurement]> {
        var measurements: [Measurement] = []
        var thermostatId = _ThermostatID()
        thermostatId.id = id
        return client.getMeasurements(thermostatId, handler: {
            let measurement = Measurement(id: $0.id,
                                          timestamp: Int($0.timestamp),
                                          temperature: Int($0.temperature),
                                          thermostatId: $0.thermostatID)
            measurements.append(measurement)
        })
        .status
        .map { _ in measurements }
    }

    func uploadMeasurement(measurements: [Measurement]) -> EventLoopFuture<[Measurement]> {
        let messages = measurements.map { measurement -> _Measurement in
            var message = _Measurement()
            message.timestamp = Int64(measurement.timestamp)
            message.temperature = Int64(measurement.temperature)
            message.thermostatID = measurement.thermostatId
            return message
        }
        var result: [Measurement] = []
        let call = client.uploadMeasurements(handler: {
            let measurement = Measurement(id: $0.id,
                                          timestamp: Int($0.timestamp),
                                          temperature: Int($0.temperature),
                                          thermostatId: $0.thermostatID)
            result.append(measurement)
        })

        return call.sendMessages(messages, compression: .disabled)
            .flatMap { call.sendEnd() }
            .flatMap { call.status }
            .map { _ in result }
    }

    func calculateStatistics(measurements: [Measurement]) -> EventLoopFuture<MeasurementStats> {
        let messages = measurements.map { measurement -> _Measurement in
            var message = _Measurement()
            message.timestamp = Int64(measurement.timestamp)
            message.temperature = Int64(measurement.temperature)
            message.thermostatID = measurement.thermostatId
            return message
        }

        let call = client.calculateStatistics()

        return call.sendMessages(messages, compression: .disabled)
            .flatMap { call.sendEnd() }
            .flatMap { call.response }
            .map { MeasurementStats(maxTemperature: Int($0.maxTemperature),
                                     minTemperature: Int($0.minTemperature),
                                     avgTemperature: $0.avgTemperature,
                                     measurmentCount: Int($0.measurmentCount))
            }
    }

    var client: ThermostatServiceClient

    init(group: EventLoopGroup) {
        let channel = ClientConnection.insecure(group: group)
            .connect(host: host, port: port)
        client = ThermostatServiceClient(channel: channel)
    }



}
