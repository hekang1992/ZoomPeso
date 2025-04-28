//
//  SelectThreeConfig.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/28.
//

import UIKit
import BRPickerView

class SelectThreeConfig {
    static func showAddressPicker(from dataSource: [BRProvinceModel], pickerMode: BRAddressPickerMode, complete: @escaping ((String, String) -> Void)) -> BRAddressPickerView {
        let addressPicker = BRAddressPickerView()
        addressPicker.pickerMode = pickerMode
        addressPicker.dataSourceArr = dataSource
        addressPicker.selectIndexs = [0, 0, 0]
        addressPicker.resultBlock = { province, city, area in
            let (address, code) = generateAddressAndCode(province: province, city: city, area: area)
            complete(address, code)
        }
        return addressPicker
    }
    
    private static func generateAddressAndCode(province: BRProvinceModel?,
                                               city: BRCityModel?,
                                               area: BRAreaModel?) -> (String, String) {
        let oneName = province?.name ?? ""
        let twoName = city?.name ?? ""
        let threeName = area?.name ?? ""
        let name: String
        let code: String
        switch (oneName.isEmpty, twoName.isEmpty, threeName.isEmpty) {
        case (false, true, _):
            name = oneName
            code = province?.code ?? ""
        case (false, false, true):
            let nameStr = "\(oneName)" + "|" + "\(twoName)"
            name = nameStr
            let codeStr = "\(province?.code ?? "")" + "|" + "\(city?.code ?? "")"
            code = codeStr
        case (false, false, false):
            name = "\(oneName)|\(twoName)|\(threeName)"
            code = "\(province?.code ?? "")|\(city?.code ?? "")|\(area?.code ?? "")"
        default:
            name = ""
            code = ""
        }
        return (name, code)
    }
    
    
}

class TertiaryDataProcessor {
    static func processTertiaryData(dataSource: [Any]) -> [BRProvinceModel] {
        var processedRegions = [BRProvinceModel]()
        for dataItem in dataSource {
            guard let regionData = dataItem as? rubyModel else {
                continue
            }
            let region = BRProvinceModel()
            region.code = String(regionData.orifice ?? 0)
            region.name = regionData.paralysed ?? ""
            region.index = dataSource.firstIndex(where: { $0 as AnyObject === regionData as AnyObject }) ?? 0
            
            let citiesData = regionData.ruby ?? []
            var processedCities = [BRCityModel]()
            for cityData in citiesData {
                let city = BRCityModel()
                city.code = String(regionData.orifice ?? 0)
                city.name = cityData.paralysed
                city.index = citiesData.firstIndex(where: { $0 as AnyObject === cityData as AnyObject }) ?? 0
                
                let areasData = cityData.ruby ?? []
                var processedAreas = [BRAreaModel]()
                for areaData in areasData {
                    let area = BRAreaModel()
                    area.code = String(regionData.orifice ?? 0)
                    area.name = areaData.paralysed
                    area.index = areasData.firstIndex(where: { $0 as AnyObject === areaData as AnyObject }) ?? 0
                    processedAreas.append(area)
                }
                city.arealist = processedAreas
                processedCities.append(city)
            }
            region.citylist = processedCities
            processedRegions.append(region)
        }
        return processedRegions
    }
}
