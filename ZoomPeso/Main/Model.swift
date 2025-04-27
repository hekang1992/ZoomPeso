//
//  Model.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
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
    
    enum CodingKeys: String, CodingKey {
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
    }
    
}

class juicesModel: Codable {
    var vain: String?
    var perseveringly: String?
    var entangle: String?
    var cutting: String?
    var shropshire: String?
    var thrusts: String?
    var orifice: Int?
}

class pepsisModel: Codable {
    var rolled: String?
    var bajada: Int?
    var sucking: String?
}

class enlargedModel: Codable {
    var orifice: String?
    var symbol: String?
    var characterized: Int?
    var examining: examiningModel?
}

class examiningModel: Codable {
    var adversary: adversaryModel?
    var stings: stingsModel?
}

class adversaryModel: Codable {
    var uvring: String?
}


class stingsModel: Codable {
    var uvring: String?
}

class deadlyModel: Codable {
    var strength: Int?
    var sucking: String?
}

class victimsModel: Codable {
    var strength: Int?
    var sucking: String?
}

class interceptModel: Codable {
    var backs: String?
    var reascended: String?
    var files: Int?
    var tuft: String?
    var wedge: String?//key
    var hound: String?//value
    var common: String?
    var extricate: [extricateModel]?
}

class armyModel: Codable {
    var astonished: String?
    var backs: String?
    var bees: String?
    var excepted: String?
    var labours: String?
    var paralysed: String?
    var paths: String?
    var beaten: String?
    var common: String?
    var extricate: [extricateModel]?
    
    enum CodingKeys: String, CodingKey {
        case common = "common"
        case astonished = "astonished"
        case backs = "backs"
        case bees = "bees"
        case excepted = "excepted"
        case labours = "labours"
        case paralysed = "paralysed"
        case paths = "paths"
        case beaten = "beaten"
        case extricate = "extricate"
    }
}

class extricateModel: Codable {
    var bajada: String?
    var paralysed: String?
    
    enum CodingKeys: String, CodingKey {
        case bajada = "bajada"
        case paralysed = "paralysed"
    }
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.paralysed = try container.decodeIfPresent(String.self, forKey: .paralysed)
        if let intValue = try? container.decodeIfPresent(Int.self, forKey: .bajada) {
            self.bajada = String(intValue)
        } else if let stringValue = try? container.decodeIfPresent(String.self, forKey: .bajada) {
            self.bajada = stringValue
        } else {
            self.bajada = ""
        }
    }
}
