
import UIKit

class KaffeeklatschFiniteHeadView: BaseView {
    
    var eventBlock: (() -> Void)?

    lazy var partialBtn: UIButton = {
        let partialBtn = UIButton(type: .custom)
        partialBtn.setImage(UIImage(named: "fabianistRightBackimage"), for: .normal)
        return partialBtn
    }()
    
    lazy var nabobessLabel: UILabel = {
        let nabobessLabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 18.pix())!, textColor: .black, textAlignment: .center)
        return nabobessLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(partialBtn)
        addSubview(nabobessLabel)
        partialBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(7.pix())
            make.size.equalTo(CGSize(width: 40.pix(), height: 40.pix()))
        }
        nabobessLabel.snp.makeConstraints { make in
            make.centerY.equalTo(partialBtn.snp.centerY)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 300.pix(), height: 40.pix()))
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
