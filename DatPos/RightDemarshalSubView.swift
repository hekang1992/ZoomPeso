
import UIKit
import RxRelay

class RightDemarshalSubView: BaseView {
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var block: (() -> Void)?
    
    var cliBlock: (() -> Void)?
    
    lazy var oamView: UIImageView = {
        let oamView = UIImageView()
        oamView.image = UIImage(named: "microPicAseuthigmeasge")
        oamView.isUserInteractionEnabled = true
        return oamView
    }()
    
    lazy var gabelleMlabel: UILabel = {
        let gabelleMlabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 18)!, textColor: .black, textAlignment: .center)
        gabelleMlabel.text = "Please confirm"
        return gabelleMlabel
    }()
    
    lazy var qandaharBtn: UIButton = {
        let qandaharBtn = UIButton(type: .custom)
        qandaharBtn.setTitle("Confirm", for: .normal)
        qandaharBtn.titleLabel?.font = UIFont(name: kafFont, size: 18.pix())
        qandaharBtn.backgroundColor = .init(cssHexStr: "#FF3825")
        qandaharBtn.setTitleColor(.white, for: .normal)
        qandaharBtn.layer.cornerRadius = 23.5
        return qandaharBtn
    }()
    
    lazy var linkageNamelabel: UILabel = {
        let linkageNamelabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 15)!, textColor: .black, textAlignment: .center)
        linkageNamelabel.text = "Full " + "Name"
        return linkageNamelabel
    }()
    
    lazy var jacanaName: UITextField = {
        let jacanaName = UITextField()
        jacanaName.placeholder = "Name"
        jacanaName.textColor = .black
        jacanaName.backgroundColor = .white
        jacanaName.layer.cornerRadius = 10.pix()
        jacanaName.textAlignment = .center
        jacanaName.layer.borderWidth = 1.pix()
        jacanaName.layer.borderColor = UIColor.black.cgColor
        return jacanaName
    }()
    
    lazy var nabeshimaIdlabel: UILabel = {
        let nabeshimaIdlabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 15)!, textColor: .black, textAlignment: .center)
        nabeshimaIdlabel.text = "Number"
        return nabeshimaIdlabel
    }()
    
    lazy var yachtswomanFor: UITextField = {
        let yachtswomanFor = UITextField()
        yachtswomanFor.placeholder = "ID No."
        yachtswomanFor.textColor = .black
        yachtswomanFor.backgroundColor = .white
        yachtswomanFor.layer.cornerRadius = 10.pix()
        yachtswomanFor.textAlignment = .center
        yachtswomanFor.layer.borderWidth = 1.pix()
        yachtswomanFor.layer.borderColor = UIColor.black.cgColor
        return yachtswomanFor
    }()
    
    lazy var caballoTimelabel: UILabel = {
        let caballoTimelabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 15)!, textColor: .black, textAlignment: .center)
        caballoTimelabel.text = "Date Birth"
        return caballoTimelabel
    }()
    
    lazy var randomBtn: UIButton = {
        let randomBtn = UIButton(type: .custom)
        randomBtn.backgroundColor = .white
        randomBtn.layer.cornerRadius = 10.pix()
        randomBtn.setTitleColor(.black, for: .normal)
        randomBtn.contentHorizontalAlignment = .center
        randomBtn.layer.borderWidth = 1.pix()
        randomBtn.layer.borderColor = UIColor.black.cgColor
        return randomBtn
    }()
    
    lazy var accoucheDesclabel: UILabel = {
        let accoucheDesclabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12.pix(), weight: .semibold), textColor: UIColor.init(cssHexStr: "#FEA124")!, textAlignment: .center)
        accoucheDesclabel.numberOfLines = 0
        accoucheDesclabel.text = "Please carefully check the information, it cannot be changed after uploading."
        return accoucheDesclabel
    }()
    
    lazy var poolingBtn: UIButton = {
        let poolingBtn = UIButton(type: .custom)
        poolingBtn.setImage(UIImage(named: "platformIacuCencelximge"), for: .normal)
        return poolingBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(oamView)
        oamView.addSubview(gabelleMlabel)
        oamView.addSubview(linkageNamelabel)
        oamView.addSubview(jacanaName)
        oamView.addSubview(nabeshimaIdlabel)
        oamView.addSubview(yachtswomanFor)
        oamView.addSubview(caballoTimelabel)
        oamView.addSubview(randomBtn)
        oamView.addSubview(accoucheDesclabel)
        addSubview(qandaharBtn)
        addSubview(poolingBtn)
        
        oamView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50.pix())
            make.size.equalTo(CGSize(width: 288.pix(), height: 461.pix()))
        }
        gabelleMlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44.pix())
            make.height.equalTo(25.pix())
            make.left.equalToSuperview()
        }
        
        linkageNamelabel.snp.makeConstraints { make in
            make.top.equalTo(gabelleMlabel.snp.bottom).offset(28.pix())
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(21)
        }
        
        jacanaName.snp.makeConstraints { make in
            make.top.equalTo(linkageNamelabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 210.pix(), height: 40.pix()))
        }
        
        nabeshimaIdlabel.snp.makeConstraints { make in
            make.top.equalTo(jacanaName.snp.bottom).offset(12.pix())
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(21)
        }
        
        yachtswomanFor.snp.makeConstraints { make in
            make.top.equalTo(nabeshimaIdlabel.snp.bottom).offset(10.pix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 210.pix(), height: 40.pix()))
        }
        
        caballoTimelabel.snp.makeConstraints { make in
            make.top.equalTo(yachtswomanFor.snp.bottom).offset(12.pix())
            make.left.equalToSuperview().offset(15.pix())
            make.centerX.equalToSuperview()
            make.height.equalTo(21)
        }
        
        randomBtn.snp.makeConstraints { make in
            make.top.equalTo(caballoTimelabel.snp.bottom).offset(10.pix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 210.pix(), height: 40.pix()))
        }
        
        accoucheDesclabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(randomBtn.snp.bottom).offset(55.pix())
            make.left.equalToSuperview().offset(16.5)
        }
        
        qandaharBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.top.equalTo(oamView.snp.bottom).offset(-30.pix())
        }
        
        poolingBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(qandaharBtn.snp.bottom).offset(55.pix())
            make.size.equalTo(CGSize(width: 25.pix(), height: 25.pix()))
        }
        
        poolingBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.block?()
        }).disposed(by: identifierBag)
        
        randomBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.cliBlock?()
        }).disposed(by: identifierBag)
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            jacanaName.text = model.liberticideParalysed ?? ""
            yachtswomanFor.text = model.sideSting ?? ""
            
            let aapssFormatter = DateFormatter()
            aapssFormatter.dateFormat = "yyyy-MM-dd"

            let multidimensionalFormatter = DateFormatter()
            multidimensionalFormatter.dateFormat = "yyyy/MM/dd"
            
            var time = model.sequentialStuff ?? ""
            
            if time.isEmpty {
                time = "1999/12/12"
            }else {
                time = model.sequentialStuff ?? ""
            }
            
            if let date = aapssFormatter.date(from: time) {
                randomBtn.setTitle(multidimensionalFormatter.string(from: date), for: .normal)
            }
            
        }).disposed(by: identifierBag)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
