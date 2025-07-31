
import UIKit
import RxRelay

class UbaVirtualobjMeraView: BaseView {
    
    var cellBlock: ((juicesModel) -> Void)?
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(OperatingRecordMeraCell.self, forCellReuseIdentifier: "OperatingRecordMeraCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    lazy var binaryView: UIImageView = {
        let binaryView = UIImageView()
        binaryView.layer.cornerRadius = 5
        binaryView.layer.masksToBounds = true
        return binaryView
    }()
    
    lazy var linkageNamelabel: UILabel = {
        let linkageNamelabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .black, textAlignment: .left)
        return linkageNamelabel
    }()
    
    var iabBlock: ((juicesModel) -> Void)?
    
    var juices: juicesModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        addSubview(binaryView)
        addSubview(linkageNamelabel)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        binaryView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(2.pix())
            make.left.equalToSuperview().offset(15.pix())
            make.size.equalTo(CGSize(width: 28.pix(), height: 28.pix()))
        }
        linkageNamelabel.snp.makeConstraints { make in
            make.centerY.equalTo(binaryView.snp.centerY)
            make.left.equalTo(binaryView.snp.right).offset(5.pix())
            make.height.equalTo(22.pix())
        }
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UbaVirtualobjMeraView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 254.pix()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let fontView = UIView()
        let tableViewUnchecked = UIImageView()
        tableViewUnchecked.image = UIImage(named: "aachenAddPereimge")
        tableViewUnchecked.isUserInteractionEnabled = true
       
        let gabblementView = UIImageView()
        gabblementView.image = UIImage(named: "packagingNamePereiamgelitt")
      
        let idlBtn = UIButton(type: .custom)
        idlBtn.setBackgroundImage(UIImage(named: "xanthismBackLoiagebtn"), for: .normal)
        idlBtn.setTitle("Go Loan >", for: .normal)
        idlBtn.titleLabel?.font = UIFont(name: kafFont, size: 19.pix())
        
        let nabobshipLeftlabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .init(cssStr: "#F9732C")!, textAlignment: .center)
      
        let screenRightlabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .init(cssStr: "#F9732C")!, textAlignment: .center)
        
        let implementationMtlabel = UILabel.createLabel(font: UIFont.init(name: kafFont, size: 58)!, textColor: .init(cssStr: "#F5B837")!, textAlignment: .center)
        
        fontView.addSubview(tableViewUnchecked)
        tableViewUnchecked.addSubview(gabblementView)
        tableViewUnchecked.addSubview(idlBtn)
        tableViewUnchecked.addSubview(nabobshipLeftlabel)
        tableViewUnchecked.addSubview(screenRightlabel)
        tableViewUnchecked.addSubview(implementationMtlabel)
        tableViewUnchecked.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        gabblementView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(146.pix())
        }
        idlBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(94.pix())
            make.bottom.equalToSuperview()
            make.size.equalTo(CGSize(width: 156.pix(), height: 51.pix()))
        }
        nabobshipLeftlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(56.pix())
            make.right.equalToSuperview().offset(-10.pix())
            make.height.equalTo(53.pix())
            make.width.equalTo(80.pix())
        }
        screenRightlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(56.pix())
            make.right.equalTo(nabobshipLeftlabel.snp.left).offset(-12.pix())
            make.height.equalTo(53.pix())
            make.width.equalTo(128.pix())
        }
        implementationMtlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(55.pix())
            make.bottom.equalTo(idlBtn.snp.top).offset(-5.pix())
        }
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self else { return }
            let ruby = model?.ruby ?? []
            for model in ruby {
                let bajada = model.bajada ?? ""
                if bajada == "South" {
                    self.juices = model.juices?.first
                    nabobshipLeftlabel.text = model.juices?.first?.cutting ?? ""
                    screenRightlabel.text = model.juices?.first?.entangle ?? ""
                    implementationMtlabel.text = model.juices?.first?.vain ?? ""
                    let tyi = model.juices?.first?.thrusts ?? ""
                    idlBtn.setTitle("\(tyi) >", for: .normal)
                    
                    let sabaothUrl = self.juices?.antagonist ?? ""
                    binaryView.af.setImage(withURL: URL(string: sabaothUrl)!)
                    linkageNamelabel.text = self.juices?.pitying ?? ""
                }
            }
        }).disposed(by: identifierBag)
        
        idlBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self, let model = self.juices else { return }
            self.iabBlock?(model)
        }).disposed(by: identifierBag)
        
        return fontView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let ruby = self.model.value?.ruby ?? []
        for model in ruby {
            let bajada = model.bajada ?? ""
            if bajada == "compared" {
                return model.juices?.count ?? 0
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230.pix()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OperatingRecordMeraCell", for: indexPath) as! OperatingRecordMeraCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        let ruby = self.model.value?.ruby ?? []
        for model in ruby {
            let bajada = model.bajada ?? ""
            if bajada == "compared" {
                let liberticideArray = model.juices ?? []
                cell.model.accept(liberticideArray[indexPath.row])
            }
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ruby = self.model.value?.ruby ?? []
        for model in ruby {
            let bajada = model.bajada ?? ""
            if bajada == "compared" {
                let liberticideArray = model.juices ?? []
                self.cellBlock?(liberticideArray[indexPath.row])
            }
        }
    }
    
}
