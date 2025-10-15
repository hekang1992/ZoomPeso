
import UIKit

class QanonNabobshipViewCell: BaseViewCell {
    
    lazy var architectureView: UIView = {
        let architectureView = UIView()
        architectureView.backgroundColor = .init(cssStr: "#FAFAFB")
        architectureView.layer.cornerRadius = 10
        return architectureView
    }()
    
    lazy var nabobessLabel: UILabel = {
        let nabobessLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .medium), textColor: .init(cssStr: "#E2D38B")!, textAlignment: .left)
        return nabobessLabel
    }()
    
    lazy var yachtyView: UIImageView = {
        let yachtyView = UIImageView()
        yachtyView.image = UIImage(named: "traverseImageRightimagebal")
        return yachtyView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(architectureView)
        contentView.addSubview(nabobessLabel)
        contentView.addSubview(yachtyView)
        
        architectureView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
        }
        
        nabobessLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11.5)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(200.bcPix())
            make.height.equalTo(21)
            make.bottom.equalToSuperview().offset(-16.5)
        }
        
        yachtyView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-30)
            make.centerY.equalTo(nabobessLabel.snp.centerY)
            make.size.equalTo(CGSize(width: 14, height: 14))
        }
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
