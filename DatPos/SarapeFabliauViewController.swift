
import UIKit
import RxRelay

class SarapeFabliauViewController: OaklandLibidoViewController {
        
    var horrid = BehaviorRelay<[String]?>(value: nil)
    
    var larvae = BehaviorRelay<[String]?>(value: nil)
    
    var time: String = ""
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    lazy var oamView: UIImageView = {
        let oamView = UIImageView()
        oamView.image = UIImage(named: "fabledAddAseuthigme")
        oamView.isUserInteractionEnabled = true
        return oamView
    }()
    
    lazy var gabelleMlabel: UILabel = {
        let gabelleMlabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 18)!, textColor: .white, textAlignment: .center)
        gabelleMlabel.text = "Step 1"
        return gabelleMlabel
    }()
    
    lazy var m1label: UILabel = {
        let m1label = UILabel.createLabel(font: UIFont(name: kafFont, size: 15)!, textColor: .init(cssStr: "#FE5255")!, textAlignment: .left)
        m1label.text = "Select An ID To Validate Your Identity"
        return m1label
    }()
    
    lazy var m2label: UILabel = {
        let m2label = UILabel.createLabel(font: UIFont(name: kafFont, size: 15)!, textColor: .black, textAlignment: .left)
        m2label.text = "Recommended ID Type"
        return m2label
    }()
    
    lazy var bugView: UIView = {
        let bugView = UIView()
        bugView.backgroundColor = .init(cssStr: "#FFFAED")
        bugView.layer.cornerRadius = 15
        return bugView
    }()
    
    lazy var m3label: UILabel = {
        let m3label = UILabel.createLabel(font: UIFont(name: kafFont, size: 15)!, textColor: .init(cssStr: "#FE5255")!, textAlignment: .left)
        m3label.text = "Other" + " " + "Options"
        return m3label
    }()
    
    lazy var m4label: UILabel = {
        let m4label = UILabel.createLabel(font: UIFont(name: kafFont, size: 15)!, textColor: .black, textAlignment: .left)
        m4label.text = "Recommended ID Type"
        return m4label
    }()
    
    lazy var labeScro: UIScrollView = {
        let labeScro = UIScrollView()
        labeScro.backgroundColor = .init(cssStr: "#83D1FE")
        labeScro.showsHorizontalScrollIndicator = false
        labeScro.showsVerticalScrollIndicator = false
        labeScro.contentInsetAdjustmentBehavior = .never
        return labeScro
    }()
    
    lazy var qandaharBtn: UIButton = {
        let qandaharBtn = UIButton(type: .custom)
        qandaharBtn.setTitle("Next", for: .normal)
        qandaharBtn.titleLabel?.font = UIFont(name: kafFont, size: 18.pix())
        qandaharBtn.backgroundColor = .init(cssStr: "#FF3825")
        qandaharBtn.setTitleColor(.white, for: .normal)
        qandaharBtn.layer.cornerRadius = 23.5
        return qandaharBtn
    }()
    
    lazy var table1View: UITableView = {
        let table1View = UITableView(frame: .zero, style: .plain)
        table1View.separatorStyle = .none
        table1View.backgroundColor = .white
        table1View.register(QanonNabobshipViewCell.self, forCellReuseIdentifier: "QanonNabobshipViewCell")
        table1View.estimatedRowHeight = 80
        table1View.showsVerticalScrollIndicator = false
        table1View.contentInsetAdjustmentBehavior = .never
        table1View.rowHeight = UITableView.automaticDimension
        if #available(iOS 15.0, *) {
            table1View.sectionHeaderTopPadding = 0
        }
        return table1View
    }()
    
    lazy var table2View: UITableView = {
        let table2View = UITableView(frame: .zero, style: .plain)
        table2View.separatorStyle = .none
        table2View.backgroundColor = .white
        table2View.register(QanonNabobshipViewCell.self, forCellReuseIdentifier: "QanonNabobshipViewCell")
        table2View.estimatedRowHeight = 80
        table2View.showsVerticalScrollIndicator = false
        table2View.contentInsetAdjustmentBehavior = .never
        table2View.rowHeight = UITableView.automaticDimension
        if #available(iOS 15.0, *) {
            table2View.sectionHeaderTopPadding = 0
        }
        return table2View
    }()
    
    var select1IndexPath: IndexPath?
    var select2IndexPath: IndexPath?
    
    var oakenGrand: Bool = false
    var sessionGrand: Bool = false
    
    var eamStr: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(architectureView)
        architectureView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        self.fontView.nabobessLabel.text = "Select Identity Document"
        addHeadView()
        self.fontView.eventBlock = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
       
        view.addSubview(labeScro)
        labeScro.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(fontView.snp.bottom).offset(5)
        }
        
        labeScro.addSubview(oamView)
        labeScro.addSubview(bugView)
        bugView.addSubview(m3label)
        bugView.addSubview(m4label)
        view.addSubview(qandaharBtn)
        oamView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.size.equalTo(CGSize(width: 358.pix(), height: 417.pix()))
        }
        oamView.addSubview(gabelleMlabel)
        oamView.addSubview(m1label)
        oamView.addSubview(m2label)
        gabelleMlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44.pix())
            make.height.equalTo(25.pix())
        }
        m1label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview()
            make.top.equalTo(gabelleMlabel.snp.bottom).offset(28.pix())
        }
        m2label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview()
            make.top.equalTo(m1label.snp.bottom).offset(10.pix())
        }
        
        bugView.snp.makeConstraints { make in
            make.top.equalTo(oamView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 345.pix(), height: 333.pix()))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-70.pix())
        }
        qandaharBtn.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
        }
        
        oamView.addSubview(table1View)
        table1View.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10.pix())
            make.right.equalToSuperview().offset(-10.pix())
            make.top.equalTo(m2label.snp.bottom).offset(1)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        bugView.addSubview(table2View)
        
        m3label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(16.pix())
        }
        m4label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview()
            make.top.equalTo(m3label.snp.bottom).offset(10.pix())
        }
        
        table2View.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5.pix())
            make.right.equalToSuperview().offset(-5.pix())
            make.bottom.equalToSuperview().offset(-5)
            make.top.equalTo(m4label.snp.bottom).offset(1)
        }
        
        horrid.compactMap { $0 }.asObservable().bind(to: table1View.rx.items(cellIdentifier: "QanonNabobshipViewCell", cellType: QanonNabobshipViewCell.self)) { row, model, cell in
            cell.nabobessLabel.text = model
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            if self.oakenGrand && self.select1IndexPath?.row == row {
                cell.architectureView.backgroundColor = .init(cssStr: "#FE5255")
            }else {
                cell.architectureView.backgroundColor = .init(cssStr: "#FAFAFA")
            }
        }.disposed(by: identifierBag)
        
        larvae.compactMap { $0 }.asObservable().bind(to: table2View.rx.items(cellIdentifier: "QanonNabobshipViewCell", cellType: QanonNabobshipViewCell.self)) { row, model, cell in
            cell.nabobessLabel.text = model
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            if self.sessionGrand && self.select2IndexPath?.row == row {
                cell.architectureView.backgroundColor = .init(cssStr: "#FE5255")
            }else {
                cell.architectureView.backgroundColor = .init(cssStr: "#FAFAFA")
            }
        }.disposed(by: identifierBag)
        
        table1View.rx.setDelegate(self).disposed(by: identifierBag)
        table2View.rx.setDelegate(self).disposed(by: identifierBag)
        
        
        table1View.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            time = ServerSideDeviceInfo.currentTimestamp
            self.eamStr = horrid.value?[indexPath.row] ?? ""
            oakenGrand = true
            sessionGrand = false
            table2View.reloadData()
            if let iteratorPath = select1IndexPath {
                if let uniqueCell = self.table1View.cellForRow(at: iteratorPath) as? QanonNabobshipViewCell {
                    uniqueCell.architectureView.backgroundColor = .init(cssStr: "#FAFAFA")
                }
            }
            if let cell = self.table1View.cellForRow(at: indexPath) as? QanonNabobshipViewCell {
                cell.architectureView.backgroundColor = .init(cssStr: "#FE5255")
            }
            select1IndexPath = indexPath
        }).disposed(by: identifierBag)
        
        table2View.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            time = ServerSideDeviceInfo.currentTimestamp
            self.eamStr = larvae.value?[indexPath.row] ?? ""
            oakenGrand = false
            sessionGrand = true
            table1View.reloadData()
            if let iteratorPath = select2IndexPath {
                if let uniqueCell = self.table2View.cellForRow(at: iteratorPath) as? QanonNabobshipViewCell {
                    uniqueCell.architectureView.backgroundColor = .init(cssStr: "#FAFAFA")
                }
            }
            if let cell = self.table2View.cellForRow(at: indexPath) as? QanonNabobshipViewCell {
                cell.architectureView.backgroundColor = .init(cssStr: "#FE5255")
            }
            select2IndexPath = indexPath
        }).disposed(by: identifierBag)
        
        qandaharBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self, let model = self.model.value else { return }
            if self.eamStr.isEmpty {
                ToastManagerConfig.showToastText(form: view, message: "Please select an authentication method")
                return
            }
            let imageVc = QcbHandleViewController()
            imageVc.model.accept(model)
            imageVc.labeEnthusiastic = eamStr
            self.navigationController?.pushViewController(imageVc, animated: true)
            print("auth=====\(self.eamStr)")
            ScroPortionPointConfig.pointToPageWithModel(with: "2", discreteKstime: time, jstime: ServerSideDeviceInfo.currentTimestamp)
        }).disposed(by: identifierBag)
        
        alphabetizeZahalTabassaran()
        
    }
    
}

extension SarapeFabliauViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let fontView = UIView()
        return fontView
    }
    
    private func alphabetizeZahalTabassaran() {
        ViewCycleManager.showLoading()
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        let dict = ["barricaded": barricaded,
                    "vitaman": "q",
                    "zoom": "video"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/cordillera", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    self.horrid.accept(success.net?.horrid ?? [])
                    self.larvae.accept(success.net?.larvae ?? [])
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}
