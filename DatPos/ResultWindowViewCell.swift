
import UIKit

class ResultWindowViewCell: BaseViewCell {
    
    lazy var dictionariesView: UIImageView = {
        let dictionariesView = UIImageView()
        dictionariesView.image = UIImage(named: "immutable_f_cell")
        return dictionariesView
    }()
    
    lazy var qcbView: UIImageView = {
        let qcbView = UIImageView()
        return qcbView
    }()
    
    lazy var nabobessLabel: UILabel = {
        let nabobessLabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 17)!, textColor: UIColor.init(cssStr: "#000001")!, textAlignment: .left)
        return nabobessLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dictionariesView)
        dictionariesView.addSubview(qcbView)
        dictionariesView.addSubview(nabobessLabel)
        
        
        dictionariesView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 345.bcPix(), height: 95.bcPix()))
        }
       
        qcbView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16.bcPix())
            make.left.equalToSuperview().offset(14.bcPix())
            make.size.equalTo(CGSize(width: 30.bcPix(), height: 30.bcPix()))
        }
        
        nabobessLabel.snp.makeConstraints { make in
            make.centerY.equalTo(qcbView.snp.centerY)
            make.height.equalTo(21.bcPix())
            make.left.equalTo(qcbView.snp.right).offset(35.bcPix())
        }
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
