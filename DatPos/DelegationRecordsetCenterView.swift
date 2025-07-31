
import UIKit
import RxRelay

class DelegationRecordsetCenterView: BaseView {
    
    var patternBlock: ((rubyModel) -> Void)?
    
    var comArry = BehaviorRelay<[rubyModel]?>(value: nil)
    
    let rabbinWidth = SCREEN_WIDTH * 0.25
    
    lazy var architectureView: UIView = {
        let architectureView = UIView()
        architectureView.backgroundColor = .init(cssStr: "#EBF4FF")
        return architectureView
    }()
    
    lazy var nabobessLabel: UILabel = {
        let nabobessLabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 18)!, textColor: .black, textAlignment: .center)
        nabobessLabel.text = "Me"
        return nabobessLabel
    }()
    
    lazy var qbasicView: UIImageView = {
        let qbasicView = UIImageView()
        qbasicView.image = UIImage(named: "domBgCenteriamge")
        return qbasicView
    }()
    
    lazy var logoImageView1: UIImageView = {
        let logoImageView1 = UIImageView()
        logoImageView1.image = UIImage(named: "server_imge_giri")
        return logoImageView1
    }()
    
    lazy var xanthinPhonelabel: UILabel = {
        let xanthinPhonelabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .white, textAlignment: .left)
        let phone = UserDefaults.standard.object(forKey: GabbyAardvarkLoginConfig.Keys.UserPhone) as? String ?? ""
        xanthinPhonelabel.text = formalTabasheerLiberticide(phone)
        return xanthinPhonelabel
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(ResultWindowViewCell.self, forCellReuseIdentifier: "ResultWindowViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(qbasicView)
        qbasicView.addSubview(logoImageView1)
        qbasicView.addSubview(xanthinPhonelabel)
        qbasicView.addSubview(nabobessLabel)
        addSubview(architectureView)
        architectureView.addSubview(tableView)
        
        qbasicView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30.pix())
            make.width.equalTo(311.pix())
            make.centerX.equalToSuperview()
            make.height.equalTo(101.pix())
        }
        logoImageView1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50.pix())
            make.top.equalToSuperview().offset(15.pix())
            make.size.equalTo(CGSize(width: 55.pix(), height: 55.pix()))
        }
        xanthinPhonelabel.snp.makeConstraints { make in
            make.height.equalTo(25.pix())
            make.centerY.equalTo(logoImageView1.snp.centerY)
            make.left.equalTo(logoImageView1.snp.right).offset(25.pix())
        }
        nabobessLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(25)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(5)
        }
        architectureView.snp.makeConstraints { make in
            make.top.equalTo(qbasicView.snp.bottom).offset(30)
            make.left.bottom.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5.pix())
            make.left.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
            make.bottom.equalToSuperview().offset(-90)
        }
        
        tableView.rx.setDelegate(self).disposed(by: identifierBag)

        comArry.compactMap { $0 }.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "ResultWindowViewCell", cellType: ResultWindowViewCell.self)) { row, model, cell in
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            let walckanaer = model.walckanaer ?? ""
            cell.qcbView.af.setImage(withURL: URL(string: walckanaer)!)
            cell.nabobessLabel.text = model.backs ?? ""
        }
            .disposed(by: identifierBag)
        
        tableView.rx.modelSelected(rubyModel.self)
            .subscribe(onNext: { [weak self] model in
            guard let self = self else { return }
            self.patternBlock?(model)
        })
            .disposed(by: identifierBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        architectureView.layer.cornerRadius = 30
        architectureView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        architectureView.layer.masksToBounds = true
    }
    
    func formalTabasheerLiberticide(_ phone: String) -> String {
        guard phone.count >= 10 else { return phone }
        let start = phone.prefix(3)
        let end = phone.suffix(4)
        return "\(start)****\(end)"
    }
    
}

extension DelegationRecordsetCenterView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101.pix()
    }
}
