
import UIKit
import RxRelay
import ASGradientLabel

class XanthinAssociativeViewCell: BaseViewCell {
    
    var model = BehaviorRelay<armyModel?>(value: nil)
    
    lazy var accoucheDesclabel: ASGradientLabel = {
        let accoucheDesclabel = ASGradientLabel()
        accoucheDesclabel.startPoint = CGPoint(x: 0, y: 0.5)
        accoucheDesclabel.endPoint = CGPoint(x: 1, y: 0.5)
        accoucheDesclabel.locations = [0 ,1]
        accoucheDesclabel.colors = [UIColor.init(cssHexStr: "#FF3825")!.cgColor, UIColor.init(cssHexStr: "#FE5255")!.cgColor]
        return accoucheDesclabel
    }()
    
    lazy var architectureView: UIView = {
        let architectureView = UIView()
        architectureView.backgroundColor = .init(cssHexStr: "#FFFAED")
        architectureView.layer.cornerRadius = 10.pix()
        architectureView.layer.masksToBounds = true
        architectureView.layer.shadowColor = UIColor.init(cssHexStr: "#B42400")?.withAlphaComponent(0.27).cgColor
        architectureView.layer.shadowOffset = CGSize(width: 0, height: -3.5)
        architectureView.layer.shadowRadius = 6.5
        architectureView.layer.shadowOpacity = 0.2
        architectureView.layer.masksToBounds = false
        return architectureView
    }()
    
    lazy var contentLabel: UILabel = {
        let contentLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .black, textAlignment: .left)
        return contentLabel
    }()
    
    lazy var fatherlessView: UIView = {
        let fatherlessView = UIView()
        fatherlessView.backgroundColor = .init(cssHexStr: "#FAFAFA")
        fatherlessView.layer.cornerRadius = 10.pix()
        fatherlessView.layer.masksToBounds = true
        return fatherlessView
    }()
    
    lazy var retrieveView: UIImageView = {
        let retrieveView = UIImageView()
        retrieveView.image = UIImage(named: "traverseImageRightimagebal")
        return retrieveView
    }()
    
    lazy var iterationLabel: UILabel = {
        let iterationLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15.pix(), weight: .medium), textColor: .init(cssHexStr: "#E2D38B")!, textAlignment: .left)
        return iterationLabel
    }()
    
    lazy var calendricalLabel: UILabel = {
        let calendricalLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .black, textAlignment: .left)
        return calendricalLabel
    }()
    
    lazy var zaftigView: UIView = {
        let zaftigView = UIView()
        zaftigView.backgroundColor = .init(cssHexStr: "#FAFAFA")
        zaftigView.layer.cornerRadius = 10.pix()
        zaftigView.layer.masksToBounds = true
        return zaftigView
    }()
    
    lazy var messageView: UIImageView = {
        let messageView = UIImageView()
        messageView.image = UIImage(named: "wackeLeftPhoneiconigme")
        return messageView
    }()
    
    lazy var filterLabel: UILabel = {
        let filterLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15.pix(), weight: .medium), textColor: .init(cssHexStr: "#E2D38B")!, textAlignment: .left)
        return filterLabel
    }()
    
    var defineBlock: (() -> Void)?
    var qdaBlock: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(architectureView)
        architectureView.addSubview(accoucheDesclabel)
        architectureView.addSubview(contentLabel)
        architectureView.addSubview(fatherlessView)
        fatherlessView.addSubview(iterationLabel)
        fatherlessView.addSubview(retrieveView)
        architectureView.addSubview(calendricalLabel)
        architectureView.addSubview(zaftigView)
        zaftigView.addSubview(messageView)
        zaftigView.addSubview(filterLabel)
        
        architectureView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.pix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 345.pix(), height: 218.pix()))
        }
        accoucheDesclabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16.pix())
            make.left.equalToSuperview().offset(13.pix())
            make.height.equalTo(21.pix())
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(accoucheDesclabel.snp.bottom).offset(10.pix())
            make.left.equalToSuperview().offset(13.pix())
            make.height.equalTo(21.pix())
        }
        fatherlessView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contentLabel.snp.bottom).offset(5.pix())
            make.left.equalTo(contentLabel.snp.left)
            make.height.equalTo(44.pix())
        }
        retrieveView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-5.pix())
            make.size.equalTo(CGSize(width: 14, height: 14))
        }
        iterationLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15.pix())
            make.right.equalTo(retrieveView.snp.left).offset(-2.pix())
            make.height.equalTo(44.pix())
        }
        
        calendricalLabel.snp.makeConstraints { make in
            make.top.equalTo(fatherlessView.snp.bottom).offset(10.pix())
            make.left.equalToSuperview().offset(13.pix())
            make.height.equalTo(21.pix())
        }
        zaftigView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(calendricalLabel.snp.bottom).offset(5.pix())
            make.left.equalTo(calendricalLabel.snp.left)
            make.height.equalTo(44.pix())
        }
        messageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-5.pix())
            make.size.equalTo(CGSize(width: 14, height: 14))
        }
        filterLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15.pix())
            make.right.equalTo(messageView.snp.left).offset(-2.pix())
            make.height.equalTo(44.pix())
        }
        
        fatherlessView.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.defineBlock?()
        }).disposed(by: identifierBag)
        
        zaftigView.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.qdaBlock?()
        }).disposed(by: identifierBag)
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let videoBacks = NSMutableAttributedString(string: model.videoBacks ?? "")
            let range = NSRange(location: 0, length: videoBacks.length)
            videoBacks.addAttributes([.font: UIFont(name: kafFont, size: 15)!], range: range)
            accoucheDesclabel.attributedText = videoBacks
            contentLabel.text = model.traceLabours ?? ""
            let sabbatarianCommon = model.sabbatarianCommon ?? ""
            let oamPaths = model.oamPaths ?? ""
            if sabbatarianCommon.isEmpty {
                if oamPaths.isEmpty {
                    iterationLabel.text = model.wordAstonished ?? ""
                    iterationLabel.textColor = .init(cssHexStr: "#E2D38B")
                }else {
                    let rpcExtricate = model.rpcExtricate ?? []
                    for model in rpcExtricate {
                        let aachenBajada = model.aachenBajada ?? ""
                        if oamPaths == aachenBajada {
                            iterationLabel.text = model.liberticideParalysed ?? ""
                            iterationLabel.textColor = .init(cssHexStr: "#FF3825")
                        }
                    }
                }
            }else {
                iterationLabel.text = sabbatarianCommon
                iterationLabel.textColor = .init(cssHexStr: "#FF3825")
            }
            
            let phone = model.itemBeaten ?? ""
            let name = model.liberticideParalysed ?? ""
            calendricalLabel.text = model.libertinismExcepted ?? ""
            if phone.isEmpty {
                filterLabel.text = model.labialiseBees ?? ""
                filterLabel.textColor = .init(cssHexStr: "#E2D38B")
            }else {
                filterLabel.text = "\(name) - \(phone)"
                filterLabel.textColor = .init(cssHexStr: "#FF3825")
            }
            
        }).disposed(by: identifierBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

