
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
        accoucheDesclabel.colors = [UIColor.init(cssStr: "#FF3825")!.cgColor, UIColor.init(cssStr: "#FE5255")!.cgColor]
        return accoucheDesclabel
    }()
    
    lazy var architectureView: UIView = {
        let architectureView = UIView()
        architectureView.backgroundColor = .init(cssStr: "#FFFAED")
        architectureView.layer.cornerRadius = 10.bcPix()
        architectureView.layer.masksToBounds = true
        architectureView.layer.shadowColor = UIColor.init(cssStr: "#B42400")?.withAlphaComponent(0.27).cgColor
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
        fatherlessView.backgroundColor = .init(cssStr: "#FAFAFB")
        fatherlessView.layer.cornerRadius = 10.bcPix()
        fatherlessView.layer.masksToBounds = true
        return fatherlessView
    }()
    
    lazy var retrieveView: UIImageView = {
        let retrieveView = UIImageView()
        retrieveView.image = UIImage(named: "traverseImageRightimagebal")
        return retrieveView
    }()
    
    lazy var iterationLabel: UILabel = {
        let iterationLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15.bcPix(), weight: .medium), textColor: .init(cssStr: "#E2D38B")!, textAlignment: .left)
        return iterationLabel
    }()
    
    lazy var calendricalLabel: UILabel = {
        let calendricalLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .black, textAlignment: .left)
        return calendricalLabel
    }()
    
    lazy var zaftigView: UIView = {
        let zaftigView = UIView()
        zaftigView.backgroundColor = .init(cssStr: "#FAFAFB")
        zaftigView.layer.cornerRadius = 10.bcPix()
        zaftigView.layer.masksToBounds = true
        return zaftigView
    }()
    
    lazy var messageView: UIImageView = {
        let messageView = UIImageView()
        messageView.image = UIImage(named: "wackeLeftPhoneiconigme")
        return messageView
    }()
    
    lazy var filterLabel: UILabel = {
        let filterLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15.bcPix(), weight: .medium), textColor: .init(cssStr: "#E2D38B")!, textAlignment: .left)
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
            make.top.equalToSuperview().offset(10.bcPix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 345.bcPix(), height: 218.bcPix()))
        }
        accoucheDesclabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16.bcPix())
            make.left.equalToSuperview().offset(13.bcPix())
            make.height.equalTo(21.bcPix())
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(accoucheDesclabel.snp.bottom).offset(10.bcPix())
            make.left.equalToSuperview().offset(13.bcPix())
            make.height.equalTo(21.bcPix())
        }
        fatherlessView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contentLabel.snp.bottom).offset(5.bcPix())
            make.left.equalTo(contentLabel.snp.left)
            make.height.equalTo(44.bcPix())
        }
        retrieveView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-5.bcPix())
            make.size.equalTo(CGSize(width: 14, height: 14))
        }
        iterationLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15.bcPix())
            make.right.equalTo(retrieveView.snp.left).offset(-2.bcPix())
            make.height.equalTo(44.bcPix())
        }
        
        calendricalLabel.snp.makeConstraints { make in
            make.top.equalTo(fatherlessView.snp.bottom).offset(10.bcPix())
            make.left.equalToSuperview().offset(13.bcPix())
            make.height.equalTo(21.bcPix())
        }
        zaftigView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(calendricalLabel.snp.bottom).offset(5.bcPix())
            make.left.equalTo(calendricalLabel.snp.left)
            make.height.equalTo(44.bcPix())
        }
        messageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-5.bcPix())
            make.size.equalTo(CGSize(width: 14, height: 14))
        }
        filterLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15.bcPix())
            make.right.equalTo(messageView.snp.left).offset(-2.bcPix())
            make.height.equalTo(44.bcPix())
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
            let backs = NSMutableAttributedString(string: model.backs ?? "")
            let range = NSRange(location: 0, length: backs.length)
            backs.addAttributes([.font: UIFont(name: kafFont, size: 15)!], range: range)
            accoucheDesclabel.attributedText = backs
            contentLabel.text = model.labours ?? ""
            let common = model.common ?? ""
            let paths = model.paths ?? ""
            if common.isEmpty {
                if paths.isEmpty {
                    iterationLabel.text = model.astonished ?? ""
                    iterationLabel.textColor = .init(cssStr: "#E2D38B")
                }else {
                    let extricate = model.extricate ?? []
                    for model in extricate {
                        let bajada = model.bajada ?? ""
                        if paths == bajada {
                            iterationLabel.text = model.paralysed ?? ""
                            iterationLabel.textColor = .init(cssStr: "#FF3825")
                        }
                    }
                }
            }else {
                iterationLabel.text = common
                iterationLabel.textColor = .init(cssStr: "#FF3825")
            }
            
            let phone = model.beaten ?? ""
            let name = model.paralysed ?? ""
            calendricalLabel.text = model.excepted ?? ""
            if phone.isEmpty {
                filterLabel.text = model.bees ?? ""
                filterLabel.textColor = .init(cssStr: "#E2D38B")
            }else {
                filterLabel.text = "\(name) - \(phone)"
                filterLabel.textColor = .init(cssStr: "#FF3825")
            }
            
        }).disposed(by: identifierBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

