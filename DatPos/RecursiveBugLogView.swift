
import UIKit

class RecursiveBugLogView: BaseView {
    
    var block: ((String) -> Void)?

    lazy var binaryView: UIImageView = {
        let binaryView = UIImageView()
        binaryView.image = UIImage(named: "kadunaImageDegimge")
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
    
    lazy var lateBtn: UIButton = {
        let lateBtn = UIButton(type: .custom)
        lateBtn.setImage(UIImage(named: "recordBgCyclenormail"), for: .normal)
        lateBtn.setImage(UIImage(named: "libraIconCycleselect"), for: .selected)
        return lateBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(binaryView)
        binaryView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 278.bcPix(), height: 518.bcPix()))
        }
        
        binaryView.addSubview(sureBtn)
        binaryView.addSubview(poolingBtn)
        binaryView.addSubview(lateBtn)
        
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
        
        lateBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-140.bcPix())
            make.left.equalToSuperview().offset(20.bcPix())
            make.size.equalTo(CGSize(width: 22.bcPix(), height: 22.bcPix()))
        }
        
        poolingBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.block?("0")
        }).disposed(by: identifierBag)
        
        sureBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            if lateBtn.isSelected == false {
                let infoStr = "Please read and confirm" + " the account cancellation agreement."
                ToastManagerConfig.showToastText(form: self, message: infoStr)
                return
            }
            self.block?("1")
        }).disposed(by: identifierBag)
        
        lateBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            lateBtn.isSelected.toggle()
        }).disposed(by: identifierBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
