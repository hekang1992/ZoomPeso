
import UIKit

class KaffeeklatschFiniteHeadView: BaseView {
    
    var eventBlock: (() -> Void)?

    lazy var partialBtn: UIButton = {
        let partialBtn = UIButton(type: .custom)
        partialBtn.setImage(UIImage(named: "fabianistRightBackimage"), for: .normal)
        return partialBtn
    }()
    
    lazy var nabobessLabel: UILabel = {
        let nabobessLabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 18.bcPix())!, textColor: .black, textAlignment: .center)
        return nabobessLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(partialBtn)
        addSubview(nabobessLabel)
        partialBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(7.bcPix())
            make.size.equalTo(CGSize(width: 40.bcPix(), height: 40.bcPix()))
        }
        nabobessLabel.snp.makeConstraints { make in
            make.centerY.equalTo(partialBtn.snp.centerY)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 300.bcPix(), height: 40.bcPix()))
        }
        
        partialBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.eventBlock?()
        }).disposed(by: identifierBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
