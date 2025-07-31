
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
        let nabobessLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 13.pix(), weight: .semibold), textColor: .white, textAlignment: .left)
        return nabobessLabel
    }()
    
    lazy var vacancyLabel: UILabel = {
        let vacancyLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 13.pix(), weight: .bold), textColor: .init(cssHexStr: "#FF2726")!, textAlignment: .right)
        return vacancyLabel
    }()
    
    lazy var pacesetterLabel: UILabel = {
        let pacesetterLabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 42.pix())!, textColor: .init(cssHexStr: "#712202")!, textAlignment: .center)
        return pacesetterLabel
    }()
    
    lazy var architectureView: UIView = {
        let architectureView = UIView()
        architectureView.backgroundColor = UIColor.init(cssHexStr: "#FFE4B6")
        architectureView.layer.cornerRadius = 5
        return architectureView
    }()
    
    lazy var transactionalLabel: UILabel = {
        let transactionalLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .bold), textColor: .white, textAlignment: .center)
        transactionalLabel.layer.cornerRadius = 5
        transactionalLabel.layer.masksToBounds = true
        transactionalLabel.text = "Ch" + "eck"
        transactionalLabel.backgroundColor = .init(cssHexStr: "#FF3825")
        return transactionalLabel
    }()
    
    lazy var partLabel: UILabel = {
        let partLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 11.pix(), weight: .medium), textColor: .init(cssHexStr: "#BF9B0E")!, textAlignment: .left)
        return partLabel
    }()
    
    lazy var habaneroLabel: UILabel = {
        let habaneroLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 11.pix(), weight: .medium), textColor: .init(cssHexStr: "#BF9B0E")!, textAlignment: .left)
        return habaneroLabel
    }()
    
    lazy var xanthineLabel: UILabel = {
        let xanthineLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: .init(cssHexStr: "#712202")!, textAlignment: .right)
        return xanthineLabel
    }()
    
    lazy var jabezLabel: UILabel = {
        let jabezLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: .init(cssHexStr: "#712202")!, textAlignment: .right)
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
            make.size.equalTo(CGSize(width: 372.pix(), height: 183.pix()))
        }
        qbasicView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(47.pix())
            make.top.equalToSuperview().offset(10.pix())
            make.size.equalTo(CGSize(width: 25.pix(), height: 25.pix()))
        }
        nabobessLabel.snp.makeConstraints { make in
            make.centerY.equalTo(qbasicView.snp.centerY)
            make.left.equalTo(qbasicView.snp.right).offset(6.pix())
            make.height.equalTo(25.pix())
        }
        vacancyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.pix())
            make.right.equalToSuperview().offset(-25.pix())
            make.height.equalTo(16.pix())
        }
        pacesetterLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(vacancyLabel.snp.bottom).offset(2)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH, height: 60.pix()))
        }
        architectureView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(23.pix())
            make.bottom.equalToSuperview().offset(-22.pix())
            make.height.equalTo(58.pix())
            make.width.equalTo(255.pix())
        }
        transactionalLabel.snp.makeConstraints { make in
            make.centerY.equalTo(architectureView.snp.centerY)
            make.size.equalTo(CGSize(width: 65.pix(), height: 59.pix()))
            make.right.equalToSuperview().offset(-25.pix())
        }
        partLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9.pix())
            make.left.equalToSuperview().offset(11.pix())
            make.height.equalTo(15.pix())
        }
        habaneroLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8.pix())
            make.left.equalToSuperview().offset(11.pix())
            make.height.equalTo(15.pix())
        }
        xanthineLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6.pix())
            make.right.equalToSuperview().offset(-9.pix())
            make.height.equalTo(20.pix())
        }
        jabezLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-6.pix())
            make.right.equalToSuperview().offset(-9.pix())
            make.height.equalTo(20.pix())
        }
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let wsdlUrl = model.sabangAntagonist ?? ""
            qbasicView.af.setImage(withURL: URL(string: wsdlUrl)!)
            nabobessLabel.text = model.pointerPitying ?? ""
            vacancyLabel.text = model.tabaretThrusts ?? ""
            pacesetterLabel.text = model.constrainedCarrion ?? ""
            partLabel.text = model.assignmentRapacious ?? ""
            habaneroLabel.text = model.labeDont ?? ""
            xanthineLabel.text = model.threadCasts ?? ""
            jabezLabel.text = model.pacesetterHarpalid ?? ""
        }).disposed(by: identifierBag)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
