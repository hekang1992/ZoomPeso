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
}
