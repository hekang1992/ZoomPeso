
import UIKit

class juicesModel: Codable {
    var wrapperVain: String?
    var knapsackPerseveringly: String?
    var rabbanistEntangle: String?
    var baaskaapCutting: String?
    var abstractionShropshire: String?
    var tabaretThrusts: String?
    var patternOrifice: Int?
    var sabangAntagonist: String?
    var pointerPitying: String?
    var sexagenarianLiberate: String?
    var jabberJerks: String?
    var fabianistAimed: String?
}

class pepsisModel: Codable {
    var actualRolled: String?
    var aachenBajada: Int?
    var alphabeticallySucking: String?
}

class enlargedModel: Codable {
    var patternOrifice: String?
    var fabledSymbol: String?
    var fatCharacterized: Int?
    var frameworkTyrant: String?
    var threadCasts: String?
    var volatileSemicircular: Int?
    var closedownExamining: examiningModel?
    var pointerPitying: String?
}

class examiningModel: Codable {
    var nabeAdversary: adversaryModel?
    var primaryStings: stingsModel?
}

class adversaryModel: Codable {
    var codeUvring: String?
}


class stingsModel: Codable {
    var codeUvring: String?
}

class deadlyModel: Codable {
    var graphStrength: Int?
    var alphabeticallySucking: String?
}

class victimsModel: Codable {
    var graphStrength: Int?
    var alphabeticallySucking: String?
}

class interceptModel: Codable {
    var videoBacks: String?
    var baathistReascended: String?
    var files: Int?
    var liberticidalTuft: String?
    var rabbiWedge: String?
    var throwHound: String?
    var sabbatarianCommon: String?
    var aachenBajada: String?
    var rpcExtricate: [extricateModel]?
    
    enum CodingKeys: String, CodingKey {
        case videoBacks = "backs"
        case baathistReascended = "reascended"
        case files = "files"
        case liberticidalTuft = "tuft"
        case rabbiWedge = "wedge"
        case throwHound = "hound"
        case sabbatarianCommon = "common"
        case aachenBajada = "bajada"
        case rpcExtricate = "extricate"
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.videoBacks = try container.decodeIfPresent(String.self, forKey: .videoBacks)
        self.baathistReascended = try container.decodeIfPresent(String.self, forKey: .baathistReascended)
        self.files = try container.decodeIfPresent(Int.self, forKey: .files)
        self.liberticidalTuft = try container.decodeIfPresent(String.self, forKey: .liberticidalTuft)
        self.rabbiWedge = try container.decodeIfPresent(String.self, forKey: .rabbiWedge)
        self.throwHound = try container.decodeIfPresent(String.self, forKey: .throwHound)
        self.sabbatarianCommon = try container.decodeIfPresent(String.self, forKey: .sabbatarianCommon)
        self.rpcExtricate = try container.decodeIfPresent([extricateModel].self, forKey: .rpcExtricate)
        if let intValue = try? container.decodeIfPresent(Int.self, forKey: .aachenBajada) {
            self.aachenBajada = String(intValue)
        } else if let stringValue = try? container.decodeIfPresent(String.self, forKey: .aachenBajada) {
            self.aachenBajada = stringValue
        } else {
            self.aachenBajada = ""
        }
    }
    
}

class armyModel: Codable {
    var wordAstonished: String?
    var videoBacks: String?
    var labialiseBees: String?
    var libertinismExcepted: String?
    var traceLabours: String?
    var liberticideParalysed: String?
    var oamPaths: String?
    var itemBeaten: String?
    var sabbatarianCommon: String?
    var rpcExtricate: [extricateModel]?
    
    enum CodingKeys: String, CodingKey {
        case sabbatarianCommon = "common"
        case wordAstonished = "astonished"
        case videoBacks = "backs"
        case labialiseBees = "bees"
        case libertinismExcepted = "excepted"
        case traceLabours = "labours"
        case liberticideParalysed = "paralysed"
        case oamPaths = "paths"
        case itemBeaten = "beaten"
        case rpcExtricate = "extricate"
    }
}

class extricateModel: Codable {
    var aachenBajada: String?
    var liberticideParalysed: String?
    
    enum CodingKeys: String, CodingKey {
        case aachenBajada = "bajada"
        case liberticideParalysed = "paralysed"
    }
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.liberticideParalysed = try container.decodeIfPresent(String.self, forKey: .liberticideParalysed)
        if let intValue = try? container.decodeIfPresent(Int.self, forKey: .aachenBajada) {
            self.aachenBajada = String(intValue)
        } else if let stringValue = try? container.decodeIfPresent(String.self, forKey: .aachenBajada) {
            self.aachenBajada = stringValue
        } else {
            self.aachenBajada = ""
        }
    }
}

class PopupManager {
    private static let KeyDeterminants = "KeyDeterminants"
    
    static func codeMabelGabbro() -> Bool {
        if let oamDate = UserDefaults.standard.object(forKey: KeyDeterminants) as? Date {
            return !Calendar.current.isDate(oamDate, inSameDayAs: Date())
        }
        return true
    }
    
    static func bandwidthFontYacht() {
        UserDefaults.standard.set(Date(), forKey: KeyDeterminants)
        UserDefaults.standard.synchronize()
    }

}
