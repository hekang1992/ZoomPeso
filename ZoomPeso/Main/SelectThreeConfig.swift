//
//  SelectThreeConfig.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/28.
//

import UIKit
import BRPickerView

class SelectThreeConfig {
    
    static func showAddressPicker(
        from dataSource: [BRProvinceModel],
        pickerMode: BRAddressPickerMode,
        completion: @escaping (String, String) -> Void
    ) -> BRAddressPickerView {
        let picker = BRAddressPickerView()
        picker.pickerMode = pickerMode
        picker.dataSourceArr = dataSource
        picker.selectIndexs = [0, 0, 0]
        
        picker.resultBlock = { province, city, area in
            let result = composeAddressComponents(province: province, city: city, area: area)
            completion(result.address, result.code)
        }
        
        return picker
    }
    
    private static func composeAddressComponents(
        province: BRProvinceModel?,
        city: BRCityModel?,
        area: BRAreaModel?
    ) -> (address: String, code: String) {

        guard let province = province else { return ("", "") }
        
        let provinceName = province.name ?? ""
        let provinceCode = province.code ?? ""
        
        guard let city = city, let cityName = city.name, !cityName.isEmpty else {
            return (provinceName, provinceCode)
        }
        
        let cityCode = city.code ?? ""
        
        guard let area = area, let areaName = area.name, !areaName.isEmpty else {
            let address = joinComponents([provinceName, cityName])
            let code = joinComponents([provinceCode, cityCode])
            return (address, code)
        }
        
        let areaCode = area.code ?? ""
        let address = joinComponents([provinceName, cityName, areaName])
        let code = joinComponents([provinceCode, cityCode, areaCode])
        
        return (address, code)
    }
    
    private static func joinComponents(_ components: [String]) -> String {
        return components.filter { !$0.isEmpty }.joined(separator: "|")
    }
}

class ThrottleModelConig {

    static func processThroData(dataSource: [Any]) -> [BRProvinceModel] {
        return dataSource.compactMap { item in
            guard let regionData = item as? rubyModel else { return nil }
            return createProvince(from: regionData)
        }
    }
    
    private static func createProvince(from data: rubyModel) -> BRProvinceModel {
        let province = BRProvinceModel()
        province.code = String(data.orifice ?? 0)
        province.name = data.paralysed ?? ""
        province.citylist = processCities(data.ruby, provinceCode: province.code ?? "")
        return province
    }
    
    private static func processCities(_ citiesData: [rubyModel]?, provinceCode: String) -> [BRCityModel] {
        guard let citiesData = citiesData else { return [] }
        
        return citiesData.enumerated().map { index, cityData in
            let city = BRCityModel()
            city.code = provinceCode // 注意：这里使用省份编码作为城市编码
            city.name = cityData.paralysed
            city.index = index
            city.arealist = processAreas(cityData.ruby, areaCode: city.code ?? "")
            return city
        }
    }
    
    private static func processAreas(_ areasData: [rubyModel]?, areaCode: String) -> [BRAreaModel] {
        guard let areasData = areasData else { return [] }
        
        return areasData.enumerated().map { index, areaData in
            let area = BRAreaModel()
            area.code = areaCode
            area.name = areaData.paralysed
            area.index = index
            return area
        }
    }
}
