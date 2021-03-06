// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: application.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct _Thermostat {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var nameOptional: OneOf_NameOptional? {
    get {return _storage._nameOptional}
    set {_uniqueStorage()._nameOptional = newValue}
  }

  var name: String {
    get {
      if case .name(let v)? = _storage._nameOptional {return v}
      return String()
    }
    set {_uniqueStorage()._nameOptional = .name(newValue)}
  }

  var noName: _Nil {
    get {
      if case .noName(let v)? = _storage._nameOptional {return v}
      return _Nil()
    }
    set {_uniqueStorage()._nameOptional = .noName(newValue)}
  }

  var idOptional: OneOf_IDOptional? {
    get {return _storage._idOptional}
    set {_uniqueStorage()._idOptional = newValue}
  }

  var id: String {
    get {
      if case .id(let v)? = _storage._idOptional {return v}
      return String()
    }
    set {_uniqueStorage()._idOptional = .id(newValue)}
  }

  var noID: _Nil {
    get {
      if case .noID(let v)? = _storage._idOptional {return v}
      return _Nil()
    }
    set {_uniqueStorage()._idOptional = .noID(newValue)}
  }

  var isSmartThermostat: Bool {
    get {return _storage._isSmartThermostat}
    set {_uniqueStorage()._isSmartThermostat = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_NameOptional: Equatable {
    case name(String)
    case noName(_Nil)

  #if !swift(>=4.1)
    static func ==(lhs: _Thermostat.OneOf_NameOptional, rhs: _Thermostat.OneOf_NameOptional) -> Bool {
      switch (lhs, rhs) {
      case (.name(let l), .name(let r)): return l == r
      case (.noName(let l), .noName(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  enum OneOf_IDOptional: Equatable {
    case id(String)
    case noID(_Nil)

  #if !swift(>=4.1)
    static func ==(lhs: _Thermostat.OneOf_IDOptional, rhs: _Thermostat.OneOf_IDOptional) -> Bool {
      switch (lhs, rhs) {
      case (.id(let l), .id(let r)): return l == r
      case (.noID(let l), .noID(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct _MeasurementStats {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var minTemperature: Int64 = 0

  var maxTemperature: Int64 = 0

  var avgTemperature: Double = 0

  var measurmentCount: Int64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct _ThermostatID {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct _Measurement {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var temperature: Int64 {
    get {return _storage._temperature}
    set {_uniqueStorage()._temperature = newValue}
  }

  var idOptional: OneOf_IDOptional? {
    get {return _storage._idOptional}
    set {_uniqueStorage()._idOptional = newValue}
  }

  var id: String {
    get {
      if case .id(let v)? = _storage._idOptional {return v}
      return String()
    }
    set {_uniqueStorage()._idOptional = .id(newValue)}
  }

  var noID: _Nil {
    get {
      if case .noID(let v)? = _storage._idOptional {return v}
      return _Nil()
    }
    set {_uniqueStorage()._idOptional = .noID(newValue)}
  }

  var thermostatID: String {
    get {return _storage._thermostatID}
    set {_uniqueStorage()._thermostatID = newValue}
  }

  var timestamp: Int64 {
    get {return _storage._timestamp}
    set {_uniqueStorage()._timestamp = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_IDOptional: Equatable {
    case id(String)
    case noID(_Nil)

  #if !swift(>=4.1)
    static func ==(lhs: _Measurement.OneOf_IDOptional, rhs: _Measurement.OneOf_IDOptional) -> Bool {
      switch (lhs, rhs) {
      case (.id(let l), .id(let r)): return l == r
      case (.noID(let l), .noID(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct _ThermostatIDS {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var thermostatIds: [Int64] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct _Empty {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct _Nil {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension _Thermostat: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Thermostat"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    536870910: .standard(proto: "no_name"),
    2: .same(proto: "id"),
    536870909: .standard(proto: "no_id"),
    3: .same(proto: "isSmartThermostat"),
  ]

  fileprivate class _StorageClass {
    var _nameOptional: _Thermostat.OneOf_NameOptional?
    var _idOptional: _Thermostat.OneOf_IDOptional?
    var _isSmartThermostat: Bool = false

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _nameOptional = source._nameOptional
      _idOptional = source._idOptional
      _isSmartThermostat = source._isSmartThermostat
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1:
          if _storage._nameOptional != nil {try decoder.handleConflictingOneOf()}
          var v: String?
          try decoder.decodeSingularStringField(value: &v)
          if let v = v {_storage._nameOptional = .name(v)}
        case 2:
          if _storage._idOptional != nil {try decoder.handleConflictingOneOf()}
          var v: String?
          try decoder.decodeSingularStringField(value: &v)
          if let v = v {_storage._idOptional = .id(v)}
        case 3: try decoder.decodeSingularBoolField(value: &_storage._isSmartThermostat)
        case 536870909:
          var v: _Nil?
          if let current = _storage._idOptional {
            try decoder.handleConflictingOneOf()
            if case .noID(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._idOptional = .noID(v)}
        case 536870910:
          var v: _Nil?
          if let current = _storage._nameOptional {
            try decoder.handleConflictingOneOf()
            if case .noName(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._nameOptional = .noName(v)}
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if case .name(let v)? = _storage._nameOptional {
        try visitor.visitSingularStringField(value: v, fieldNumber: 1)
      }
      if case .id(let v)? = _storage._idOptional {
        try visitor.visitSingularStringField(value: v, fieldNumber: 2)
      }
      if _storage._isSmartThermostat != false {
        try visitor.visitSingularBoolField(value: _storage._isSmartThermostat, fieldNumber: 3)
      }
      if case .noID(let v)? = _storage._idOptional {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 536870909)
      }
      if case .noName(let v)? = _storage._nameOptional {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 536870910)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: _Thermostat, rhs: _Thermostat) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._nameOptional != rhs_storage._nameOptional {return false}
        if _storage._idOptional != rhs_storage._idOptional {return false}
        if _storage._isSmartThermostat != rhs_storage._isSmartThermostat {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension _MeasurementStats: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "MeasurementStats"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "minTemperature"),
    2: .same(proto: "maxTemperature"),
    3: .same(proto: "avgTemperature"),
    4: .same(proto: "measurmentCount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt64Field(value: &self.minTemperature)
      case 2: try decoder.decodeSingularInt64Field(value: &self.maxTemperature)
      case 3: try decoder.decodeSingularDoubleField(value: &self.avgTemperature)
      case 4: try decoder.decodeSingularInt64Field(value: &self.measurmentCount)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.minTemperature != 0 {
      try visitor.visitSingularInt64Field(value: self.minTemperature, fieldNumber: 1)
    }
    if self.maxTemperature != 0 {
      try visitor.visitSingularInt64Field(value: self.maxTemperature, fieldNumber: 2)
    }
    if self.avgTemperature != 0 {
      try visitor.visitSingularDoubleField(value: self.avgTemperature, fieldNumber: 3)
    }
    if self.measurmentCount != 0 {
      try visitor.visitSingularInt64Field(value: self.measurmentCount, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: _MeasurementStats, rhs: _MeasurementStats) -> Bool {
    if lhs.minTemperature != rhs.minTemperature {return false}
    if lhs.maxTemperature != rhs.maxTemperature {return false}
    if lhs.avgTemperature != rhs.avgTemperature {return false}
    if lhs.measurmentCount != rhs.measurmentCount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension _ThermostatID: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ThermostatID"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: _ThermostatID, rhs: _ThermostatID) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension _Measurement: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Measurement"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "temperature"),
    2: .same(proto: "id"),
    536870909: .standard(proto: "no_id"),
    3: .same(proto: "thermostatId"),
    4: .same(proto: "timestamp"),
  ]

  fileprivate class _StorageClass {
    var _temperature: Int64 = 0
    var _idOptional: _Measurement.OneOf_IDOptional?
    var _thermostatID: String = String()
    var _timestamp: Int64 = 0

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _temperature = source._temperature
      _idOptional = source._idOptional
      _thermostatID = source._thermostatID
      _timestamp = source._timestamp
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularInt64Field(value: &_storage._temperature)
        case 2:
          if _storage._idOptional != nil {try decoder.handleConflictingOneOf()}
          var v: String?
          try decoder.decodeSingularStringField(value: &v)
          if let v = v {_storage._idOptional = .id(v)}
        case 3: try decoder.decodeSingularStringField(value: &_storage._thermostatID)
        case 4: try decoder.decodeSingularInt64Field(value: &_storage._timestamp)
        case 536870909:
          var v: _Nil?
          if let current = _storage._idOptional {
            try decoder.handleConflictingOneOf()
            if case .noID(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._idOptional = .noID(v)}
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._temperature != 0 {
        try visitor.visitSingularInt64Field(value: _storage._temperature, fieldNumber: 1)
      }
      if case .id(let v)? = _storage._idOptional {
        try visitor.visitSingularStringField(value: v, fieldNumber: 2)
      }
      if !_storage._thermostatID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._thermostatID, fieldNumber: 3)
      }
      if _storage._timestamp != 0 {
        try visitor.visitSingularInt64Field(value: _storage._timestamp, fieldNumber: 4)
      }
      if case .noID(let v)? = _storage._idOptional {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 536870909)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: _Measurement, rhs: _Measurement) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._temperature != rhs_storage._temperature {return false}
        if _storage._idOptional != rhs_storage._idOptional {return false}
        if _storage._thermostatID != rhs_storage._thermostatID {return false}
        if _storage._timestamp != rhs_storage._timestamp {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension _ThermostatIDS: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ThermostatIDS"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "thermostatIds"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedInt64Field(value: &self.thermostatIds)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.thermostatIds.isEmpty {
      try visitor.visitPackedInt64Field(value: self.thermostatIds, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: _ThermostatIDS, rhs: _ThermostatIDS) -> Bool {
    if lhs.thermostatIds != rhs.thermostatIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension _Empty: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Empty"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: _Empty, rhs: _Empty) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension _Nil: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Nil"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: _Nil, rhs: _Nil) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
