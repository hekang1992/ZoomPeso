//
//  Model.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

struct BaseModel: Codable {
    var wedge: String?
    var circular: String?
    var net: netModel?
}

struct netModel: Codable {
    var recollect: String?
    var attachment: String?
    var ruby: [rubyModel]?
}

struct rubyModel: Codable {
    var bajada: String?
    var juices: [juicesModel]?
}

struct juicesModel: Codable {
    var vain: String?
    var perseveringly: String?
    var entangle: String?
    var cutting: String?
    var shropshire: String?
    var thrusts: String?
    var orifice: Int?
}
