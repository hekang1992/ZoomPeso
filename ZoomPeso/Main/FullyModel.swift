//
//  Model.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

class BaseModel: Codable {
    var wedge: String?
    var circular: String?
    var net: netModel?
}

class netModel: Codable {
    var recollect: String?
    var attachment: String?
    var sucking: String?
    var pepsis: pepsisModel?
    var enlarged: enlargedModel?
    var ruby: [rubyModel]?
    var horrid: [String]?
    var larvae: [String]?
    var paralysed: String?
    var sting: String?
    var stuff: String?
    var deadly: deadlyModel?
    var victims: victimsModel?
    var intercept: [interceptModel]?
    var army: [armyModel]?
    var cordillera: Int?
    var sexes: sexesModel?
    var walckanaer: walckanaerModel?
    var pocket_private_url: String?
    var finding: [findingModel]?
}

class findingModel: Codable {
    var sucking: String?
    var rolled: String?
}

class walckanaerModel: Codable {
    var azara: String?
}

class sexesModel: Codable {
    var bloodthirsty: String?
    var die: String?
    var says: String?
    var typical: String?
}

class rubyModel: Codable {
    var bajada: String?
    var antagonist: String?
    var pitying: String?
    var hymenoptera: String?
    var thrusts: String?
    var carrion: String?
    var rapacious: String?
    var dont: String?
    var casts: String?
    var harpalid: String?
    var antenn: String?
    var juices: [juicesModel]?
    var paralysed: String?
    var ruby: [rubyModel]?
    var walckanaer: String?
    var sucking: String?
    var orifice: Int?
    var backs: String?
    
    enum CodingKeys: String, CodingKey {
        case orifice
        case walckanaer
        case sucking
        case ruby
        case paralysed
        case bajada
        case antagonist
        case pitying
        case hymenoptera
        case thrusts
        case carrion
        case rapacious
        case dont = "do"
        case juices
        case casts
        case harpalid
        case antenn
        case backs
    }
    
}

