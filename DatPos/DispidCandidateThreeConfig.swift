
import UIKit
import BRPickerView

class DispidCandidateThreeConfig {
    
    static func showAddressPicker(
        from dataSource: [BRProvinceModel],
        pickerMode: BRAddressPickerMode,
        completion: @escaping (String, String) -> Void
    ) -> BRAddressPickerView {
        let illinoisPicker = BRAddressPickerView()
        illinoisPicker.pickerMode = pickerMode
        illinoisPicker.dataSourceArr = dataSource
        illinoisPicker.selectIndexs = [0, 0, 0]
        
        illinoisPicker.resultBlock = { province, city, area in
            let result = composeAddressComponents(province: province, city: city, area: area)
            completion(result.address, result.code)
        }
        
        return illinoisPicker
    }
    
    private static func composeAddressComponents(
        province: BRProvinceModel?,
        city: BRCityModel?,
        area: BRAreaModel?
    ) -> (address: String, code: String) {

        guard let province = province else { return ("", "") }
        
        let wackeName = province.name ?? ""
        let overheadCode = province.code ?? ""
        
        guard let city = city, let cityName = city.name, !cityName.isEmpty else {
            return (wackeName, overheadCode)
        }
        
        let zagCode = city.code ?? ""
        
        guard let area = area, let areaName = area.name, !areaName.isEmpty else {
            let address = sexagesimalGabbroOakum([wackeName, cityName])
            let code = sexagesimalGabbroOakum([overheadCode, zagCode])
            return (address, code)
        }
        
        let idleCode = area.code ?? ""
        let address = sexagesimalGabbroOakum([wackeName, cityName, areaName])
        let code = sexagesimalGabbroOakum([overheadCode, zagCode, idleCode])
        
        return (address, code)
    }
    
    private static func sexagesimalGabbroOakum(_ components: [String]) -> String {
        return components.filter { !$0.isEmpty }.joined(separator: "|")
    }
}

class ThrottleModelConig {

    static func mutexYabbiNearest(dataSource: [Any]) -> [BRProvinceModel] {
        return dataSource.compactMap { item in
            guard let modifierData = item as? rubyModel else { return nil }
            return scalableGenericityAssociative(from: modifierData)
        }
    }
    
    private static func scalableGenericityAssociative(from data: rubyModel) -> BRProvinceModel {
        let province = BRProvinceModel()
        province.code = String(data.orifice ?? 0)
        province.name = data.paralysed ?? ""
        province.citylist = addressCabanaRace(data.ruby, overheadCode: province.code ?? "")
        return province
    }
    
    private static func addressCabanaRace(_ rabbahData: [rubyModel]?, overheadCode: String) -> [BRCityModel] {
        guard let rabbahData = rabbahData else { return [] }
        
        return rabbahData.enumerated().map { index, cityData in
            let city = BRCityModel()
            city.code = overheadCode
            city.name = cityData.paralysed
            city.index = index
            city.arealist = yacareRecordSabaoth(cityData.ruby, idleCode: city.code ?? "")
            return city
        }
    }
    
    private static func yacareRecordSabaoth(_ persistenceData: [rubyModel]?, idleCode: String) -> [BRAreaModel] {
        guard let persistenceData = persistenceData else { return [] }
        
        return persistenceData.enumerated().map { index, areaData in
            let area = BRAreaModel()
            area.code = idleCode
            area.name = areaData.paralysed
            area.index = index
            return area
        }
    }
}
