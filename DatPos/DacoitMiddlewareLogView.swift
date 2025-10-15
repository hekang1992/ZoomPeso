
import UIKit

class DacoitMiddlewareLogView: BaseView {
    
    var block: ((String) -> Void)?

    lazy var binaryView: UIImageView = {
        let binaryView = UIImageView()
        binaryView.image = UIImage(named: "nondependentImageOutimge")
        binaryView.isUserInteractionEnabled = true
        return binaryView
    }()
    
    lazy var sureBtn: UIButton = {
        let sureBtn = UIButton(type: .custom)
        return sureBtn
    }()
    
    lazy var poolingBtn: UIButton = {
        let poolingBtn = UIButton(type: .custom)
        return poolingBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(binaryView)
        binaryView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 278.bcPix(), height: 313.bcPix()))
        }
        
        
        binaryView.addSubview(sureBtn)
        binaryView.addSubview(poolingBtn)
        
        poolingBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 25, height: 25))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        sureBtn.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(poolingBtn.snp.top).offset(-50.bcPix())
            make.height.equalTo(50)
        }
        
        poolingBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.block?("0")
        }).disposed(by: identifierBag)
        
        sureBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.block?("1")
        }).disposed(by: identifierBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
