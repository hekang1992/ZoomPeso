
import UIKit
import RxRelay

class MultiuserIntersectionViewCell: BaseViewCell {
    
    var model = BehaviorRelay<rubyModel?>(value: nil)

    lazy var cellImageView: UIImageView = {
        let cellImageView = UIImageView()
        cellImageView.image = UIImage(named: "caballerNameCelliamge")
        cellImageView.isUserInteractionEnabled = true
        return cellImageView
    }()
    
    lazy var qbasicView: UIImageView = {
        let qbasicView = UIImageView()
        qbasicView.layer.cornerRadius = 5
        qbasicView.layer.masksToBounds = true
        return qbasicView
    }()
    
    lazy var nabobessLabel: UILabel = {
        let nabobessLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 13.bcPix(), weight: .semibold), textColor: .white, textAlignment: .left)
        return nabobessLabel
    }()
    
    lazy var architectureView: UIView = {
        let architectureView = UIView()
        architectureView.backgroundColor = UIColor.init(cssStr: "#FFE4B6")
        architectureView.layer.cornerRadius = 5
        return architectureView
    }()
    
    lazy var vacancyLabel: UILabel = {
        let vacancyLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 13.bcPix(), weight: .bold), textColor: .init(cssStr: "#FF2726")!, textAlignment: .right)
        return vacancyLabel
    }()
    
    lazy var pacesetterLabel: UILabel = {
        let pacesetterLabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 42.bcPix())!, textColor: .init(cssStr: "#712202")!, textAlignment: .center)
        return pacesetterLabel
    }()
    
    lazy var transactionalLabel: UILabel = {
        let transactionalLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.bcPix(), weight: .bold), textColor: .white, textAlignment: .center)
        transactionalLabel.layer.cornerRadius = 5
        transactionalLabel.layer.masksToBounds = true
        transactionalLabel.text = "Ch" + "eck"
        transactionalLabel.backgroundColor = .init(cssStr: "#FF3825")
        return transactionalLabel
    }()
    
    lazy var partLabel: UILabel = {
        let partLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 11.bcPix(), weight: .medium), textColor: .init(cssStr: "#BF9B0E")!, textAlignment: .left)
        return partLabel
    }()
    
    lazy var habaneroLabel: UILabel = {
        let habaneroLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 11.bcPix(), weight: .medium), textColor: .init(cssStr: "#BF9B0E")!, textAlignment: .left)
        return habaneroLabel
    }()
    
    lazy var xanthineLabel: UILabel = {
        let xanthineLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.bcPix(), weight: .semibold), textColor: .init(cssStr: "#712202")!, textAlignment: .right)
        return xanthineLabel
    }()
    
    lazy var jabezLabel: UILabel = {
        let jabezLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.bcPix(), weight: .semibold), textColor: .init(cssStr: "#712202")!, textAlignment: .right)
        return jabezLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellImageView)
        cellImageView.addSubview(qbasicView)
        cellImageView.addSubview(nabobessLabel)
        cellImageView.addSubview(vacancyLabel)
        cellImageView.addSubview(pacesetterLabel)
        cellImageView.addSubview(architectureView)
        cellImageView.addSubview(transactionalLabel)
        architectureView.addSubview(partLabel)
        architectureView.addSubview(habaneroLabel)
        architectureView.addSubview(xanthineLabel)
        architectureView.addSubview(jabezLabel)
        cellImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 372.bcPix(), height: 183.bcPix()))
        }
        qbasicView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(47.bcPix())
            make.top.equalToSuperview().offset(10.bcPix())
            make.size.equalTo(CGSize(width: 25.bcPix(), height: 25.bcPix()))
        }
        nabobessLabel.snp.makeConstraints { make in
            make.centerY.equalTo(qbasicView.snp.centerY)
            make.left.equalTo(qbasicView.snp.right).offset(6.bcPix())
            make.height.equalTo(25.bcPix())
        }
        vacancyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.bcPix())
            make.right.equalToSuperview().offset(-25.bcPix())
            make.height.equalTo(16.bcPix())
        }
        pacesetterLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(vacancyLabel.snp.bottom).offset(2)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH, height: 60.bcPix()))
        }
        architectureView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(23.bcPix())
            make.bottom.equalToSuperview().offset(-22.bcPix())
            make.height.equalTo(58.bcPix())
            make.width.equalTo(255.bcPix())
        }
        transactionalLabel.snp.makeConstraints { make in
            make.centerY.equalTo(architectureView.snp.centerY)
            make.size.equalTo(CGSize(width: 65.bcPix(), height: 59.bcPix()))
            make.right.equalToSuperview().offset(-25.bcPix())
        }
        partLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9.bcPix())
            make.left.equalToSuperview().offset(11.bcPix())
            make.height.equalTo(15.bcPix())
        }
        habaneroLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8.bcPix())
            make.left.equalToSuperview().offset(11.bcPix())
            make.height.equalTo(15.bcPix())
        }
        xanthineLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6.bcPix())
            make.right.equalToSuperview().offset(-9.bcPix())
            make.height.equalTo(20.bcPix())
        }
        jabezLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-6.bcPix())
            make.right.equalToSuperview().offset(-9.bcPix())
            make.height.equalTo(20.bcPix())
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let wsdlUrl = model.antagonist ?? ""
            qbasicView.af.setImage(withURL: URL(string: wsdlUrl)!)
            nabobessLabel.text = model.pitying ?? ""
            vacancyLabel.text = model.thrusts ?? ""
            pacesetterLabel.text = model.carrion ?? ""
            partLabel.text = model.rapacious ?? ""
            habaneroLabel.text = model.dont ?? ""
            xanthineLabel.text = model.casts ?? ""
            jabezLabel.text = model.harpalid ?? ""
        }).disposed(by: identifierBag)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
