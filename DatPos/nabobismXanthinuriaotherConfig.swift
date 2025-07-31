
import UIKit

class juicesModel: Codable {
    var vain: String?
    var perseveringly: String?
    var entangle: String?
    var cutting: String?
    var shropshire: String?
    var thrusts: String?
    var orifice: Int?
    var antagonist: String?
    var pitying: String?
    var liberate: String?
    var jerks: String?
    var aimed: String?
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
    var tyrant: String?
    var casts: String?
    var semicircular: Int?
    var examining: examiningModel?
    var pitying: String?
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
    var bajada: String?
    var extricate: [extricateModel]?
    
    enum CodingKeys: String, CodingKey {
        case backs = "backs"
        case reascended = "reascended"
        case files = "files"
        case tuft = "tuft"
        case wedge = "wedge"
        case hound = "hound"
        case common = "common"
        case bajada = "bajada"
        case extricate = "extricate"
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backs = try container.decodeIfPresent(String.self, forKey: .backs)
        self.reascended = try container.decodeIfPresent(String.self, forKey: .reascended)
        self.files = try container.decodeIfPresent(Int.self, forKey: .files)
        self.tuft = try container.decodeIfPresent(String.self, forKey: .tuft)
        self.wedge = try container.decodeIfPresent(String.self, forKey: .wedge)
        self.hound = try container.decodeIfPresent(String.self, forKey: .hound)
        self.common = try container.decodeIfPresent(String.self, forKey: .common)
        self.extricate = try container.decodeIfPresent([extricateModel].self, forKey: .extricate)
        if let intValue = try? container.decodeIfPresent(Int.self, forKey: .bajada) {
            self.bajada = String(intValue)
        } else if let stringValue = try? container.decodeIfPresent(String.self, forKey: .bajada) {
            self.bajada = stringValue
        } else {
            self.bajada = ""
        }
    }
    
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

class PopupManager {
    private static let lastPopupDateKey = "lastPopupDate"
    
    static func shouldShowPopup() -> Bool {
        if let lastDate = UserDefaults.standard.object(forKey: lastPopupDateKey) as? Date {
            return !Calendar.current.isDate(lastDate, inSameDayAs: Date())
        }
        return true
    }
    
    static func recordPopupShown() {
        UserDefaults.standard.set(Date(), forKey: lastPopupDateKey)
        UserDefaults.standard.synchronize()
    }

}
