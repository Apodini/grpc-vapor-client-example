import Foundation
import GRPC
import NIO
import NIOSSL

class GRPCThermostatClient: ThermostatClient {

    var client: ThermostatServiceClient

    init(group: EventLoopGroup) throws {
        let certificate = try NIOSSLCertificate.fromPEMBytes(Array(sampleCert.utf8))
        let channel = ClientConnection
            .secure(group: group)
            .withTLS(serverHostnameOverride: "localhost")
            .withTLS(trustRoots: NIOSSLTrustRoots.certificates(certificate))
            .connect(host: host, port: port)
        client = ThermostatServiceClient(channel: channel)
    }

    func getThermostat(id: String) -> EventLoopFuture<Thermostat> {
        var thermostatId = _ThermostatID()
        thermostatId.id = id
        return client.getThermostatWithId(thermostatId).response
            .map {
                let thermostat = Thermostat(id: $0.id, name: $0.name, isSmartThermostat: $0.isSmartThermostat)
                print(thermostat)
                return thermostat
        }
    }

    func getThermostatIds() -> EventLoopFuture<[String]> {
        var ids: [String] = []
        return client.getThermostatIds(_Empty(), handler: { id in
                print(id.id)
                return ids.append(id.id)
            })
            .status
            .map { status in
                print(status)
                return ids }
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
            print(measurement)
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
            print(measurement)
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
            .map {
                let stats = MeasurementStats(maxTemperature: Int($0.maxTemperature),
                                                minTemperature: Int($0.minTemperature),
                                                avgTemperature: $0.avgTemperature,
                                                measurmentCount: Int($0.measurmentCount))
                print(stats)
                return stats
            }
    }

}
