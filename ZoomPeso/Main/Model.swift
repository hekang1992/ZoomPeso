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
    var sucking: String?
    var pepsis: pepsisModel?
    var enlarged: enlargedModel?
    var ruby: [rubyModel]?
    var horrid: [String]?
    var larvae: [String]?
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

struct pepsisModel: Codable {
    var rolled: String?
    var bajada: Int?
    var sucking: String?
}

struct enlargedModel: Codable {
    var orifice: String?
    var symbol: String?
    var characterized: Int?
    var examining: examiningModel?
}

struct examiningModel: Codable {
    var adversary: adversaryModel?
    var stings: stingsModel?
}

struct adversaryModel: Codable {
    var uvring: String?
}


struct stingsModel: Codable {
    var uvring: String?
}
