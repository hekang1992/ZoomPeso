
import UIKit
import RxRelay

class OperatingRecordMeraCell: BaseViewCell {
    
    var model = BehaviorRelay<juicesModel?>(value: nil)
    
    lazy var dictionariesView: UIImageView = {
        let dictionariesView = UIImageView()
        dictionariesView.isUserInteractionEnabled = true
        dictionariesView.image = UIImage(named: "ubangiIconParamigew")
        return dictionariesView
    }()
    
    lazy var qbasicView: UIImageView = {
        let qbasicView = UIImageView()
        qbasicView.layer.cornerRadius = 2.5.pix()
        qbasicView.layer.masksToBounds = true
        return qbasicView
    }()
    
    lazy var nabobessLabel: UILabel = {
        let nabobessLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .black, textAlignment: .left)
        return nabobessLabel
    }()
    
    lazy var pacesetterLabel: UILabel = {
        let pacesetterLabel = UILabel.createLabel(font: UIFont.init(name: kafFont, size: 42)!, textColor: UIColor.init(cssStr: "#712202")!, textAlignment: .center)
        return pacesetterLabel
    }()
    
    lazy var sequentialLabel: UILabel = {
        let sequentialLabel = UILabel.createLabel(font: UIFont.init(name: kafFont, size: 19)!, textColor: .white, textAlignment: .center)
        return sequentialLabel
    }()
    
    lazy var zahalLabel: UILabel = {
        let zahalLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12, weight: .medium), textColor: UIColor.init(cssStr: "#832F17")!, textAlignment: .right)
        return zahalLabel
    }()
    
    lazy var bottomLabel: UILabel = {
        let bottomLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12, weight: .medium), textColor: UIColor.init(cssStr: "#832F17")!, textAlignment: .right)
        return bottomLabel
    }()
    
    lazy var rabbahLabel: UILabel = {
        let rabbahLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14, weight: .medium), textColor: UIColor.init(cssStr: "#FFFFFF")!, textAlignment: .center)
        rabbahLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-9 * Double.pi / 180))
        return rabbahLabel
    }()
    
    lazy var caballerLabel: UILabel = {
        let caballerLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14, weight: .medium), textColor: UIColor.init(cssStr: "#FFFFFF")!, textAlignment: .center)
        caballerLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-9 * Double.pi / 180))
        return caballerLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dictionariesView)
        dictionariesView.addSubview(qbasicView)
        dictionariesView.addSubview(nabobessLabel)
        dictionariesView.addSubview(sequentialLabel)
        dictionariesView.addSubview(pacesetterLabel)
        dictionariesView.addSubview(zahalLabel)
        dictionariesView.addSubview(bottomLabel)
        dictionariesView.addSubview(rabbahLabel)
        dictionariesView.addSubview(caballerLabel)
        dictionariesView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.pix())
            make.size.equalTo(CGSize(width: 352.pix(), height: 220.pix()))
            make.centerX.equalToSuperview()
        }
        qbasicView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 22.pix(), height: 22.pix()))
            make.top.equalToSuperview().offset(15.pix())
            make.left.equalToSuperview().offset(14.pix())
        }
        nabobessLabel.snp.makeConstraints { make in
            make.height.equalTo(21.pix())
            make.centerY.equalTo(qbasicView.snp.centerY)
            make.left.equalTo(qbasicView.snp.right).offset(5.pix())
        }
        sequentialLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20.pix())
            make.centerY.equalTo(nabobessLabel.snp.centerY)
            make.width.equalTo(150.pix())
        }
        pacesetterLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(48.pix())
            make.height.equalTo(60.pix())
        }
        zahalLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-34.pix())
            make.height.equalTo(29.pix())
            make.top.equalTo(pacesetterLabel.snp.bottom).offset(15.pix())
        }
        bottomLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-34.pix())
            make.height.equalTo(29.pix())
            make.top.equalTo(zahalLabel.snp.bottom).offset(18.pix())
        }
        rabbahLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(17.pix())
            make.top.equalTo(pacesetterLabel.snp.bottom)
            make.height.equalTo(44.pix())
            make.width.equalTo(124.pix())
        }
        caballerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(17.pix())
            make.top.equalTo(rabbahLabel.snp.bottom).offset(4.pix())
            make.height.equalTo(44.pix())
            make.width.equalTo(85.pix())
        }
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let ogo = model.antagonist ?? ""
            qbasicView.af.setImage(withURL: URL(string: ogo)!)
            nabobessLabel.text = model.pitying ?? ""
            let advancedAplt = model.thrusts ?? ""
            sequentialLabel.text = "\(advancedAplt) >"
            pacesetterLabel.text = model.vain ?? ""
            zahalLabel.text = model.perseveringly ?? ""
            bottomLabel.text = model.liberate ?? ""
            rabbahLabel.text = model.entangle ?? ""
            caballerLabel.text = model.jerks ?? ""
        }).disposed(by: identifierBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OperatingRecordMeraCell {
    
   
}
