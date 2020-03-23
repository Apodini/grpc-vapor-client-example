import Foundation
// Copied from: https://stackoverflow.com/questions/45209743/how-can-i-use-swift-s-codable-to-encode-into-a-dictionary
extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
