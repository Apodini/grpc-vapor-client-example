import Alamofire
import NIO
import Foundation

struct RESTThermostatClient: ThermostatClient {

    var eventLoop: EventLoop

    func getThermostat(id: String) -> EventLoopFuture<Thermostat> {
        let request = AF
            .request("http:\(host):\(port)/thermostat/\(id)", method: .get)

        let promise = eventLoop.makePromise(of: Thermostat.self)

        request.responseDecodable(of: Thermostat.self) { response in
            guard let thermostat = try? response.result.get() else {
                return promise.fail(ClientError.RESTError)
            }
            promise.succeed(thermostat)
        }

        return promise.futureResult
    }

    func getThermostatIds() -> EventLoopFuture<[String]> {
        let request = AF
            .request("http:\(host):\(port)/thermostatIds", method: .get)

        let promise = eventLoop.makePromise(of: [String].self)

        request.responseDecodable(of: [String].self) { response in
            guard let thermostatIds = try? response.result.get() else {
                return promise.fail(ClientError.RESTError)
            }
            promise.succeed(thermostatIds)
        }

        return promise.futureResult
    }

    func getMeasurements(id: String) -> EventLoopFuture<[Measurement]> {
        let request = AF
            .request("http:\(host):\(port)/measurements/\(id)", method: .get)

        let promise = eventLoop.makePromise(of: [Measurement].self)

        request.responseDecodable(of: [Measurement].self) { response in
            guard let measurements = try? response.result.get() else {
                return promise.fail(ClientError.RESTError)
            }
            promise.succeed(measurements)
        }

        return promise.futureResult
    }

    func uploadMeasurement(measurement: Measurement) -> EventLoopFuture<Measurement> {
        let request = AF
            .request("http:\(host):\(port)/measurement", method: .post, parameters: measurement.dictionary ?? [:], encoding: JSONEncoding.default)

        let promise = eventLoop.makePromise(of: Measurement.self)

        request.responseDecodable(of: Measurement.self) { response in
            guard let measurement = try? response.result.get() else {
                return promise.fail(ClientError.RESTError)
            }
            promise.succeed(measurement)
        }

        return promise.futureResult
    }

    func calculateStatistics(measurements: [Measurement]) -> EventLoopFuture<MeasurementStats> {
        let measurementDict = Measurements(measurements: measurements)
        let request = AF
            .request("http:\(host):\(port)/measurementStats", method: .post, parameters: measurementDict.dictionary ?? [:], encoding: JSONEncoding.default)

        let promise = eventLoop.makePromise(of: MeasurementStats.self)

        request.responseDecodable(of: MeasurementStats.self) { response in
            guard let stats = try? response.result.get() else {
                return promise.fail(ClientError.RESTError)
            }
            promise.succeed(stats)
        }

        return promise.futureResult
    }

}

enum ClientError: Error {
    case RESTError
    case GRPCError
}
