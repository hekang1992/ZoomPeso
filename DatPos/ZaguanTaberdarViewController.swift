
import UIKit
import RxRelay
import AVFoundation
import Photos
import TYAlertController
import AlamofireImage
import Combine

class ZaguanTaberdarViewController: OaklandLibidoViewController {
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var intersectionCancellables = Set<AnyCancellable>()
    
    var caballineModel = BehaviorRelay<netModel?>(value: nil)
    
    var discreteKstime: String = ""
    
    lazy var oamView: UIImageView = {
        let oamView = UIImageView()
        oamView.image = UIImage(named: "fabledAddAseuthigme")
        return oamView
    }()
    
    lazy var gabelleMlabel: UILabel = {
        let gabelleMlabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 18)!, textColor: .white, textAlignment: .center)
        gabelleMlabel.text = "Step 1"
        return gabelleMlabel
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
    
    lazy var sharedView: UIView = {
        let sharedView = UIView()
        sharedView.backgroundColor = .init(cssStr: "#FFFAED")
        return sharedView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(ImplementationBabaViewCell.self, forCellReuseIdentifier: "ImplementationBabaViewCell")
        tableView.register(TupleJacamarViewCell.self, forCellReuseIdentifier: "TupleJacamarViewCell")
        tableView.estimatedRowHeight = 100
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        discreteKstime = ServerSideDeviceInfo.currentTimestamp
        
        view.addSubview(architectureView)
        architectureView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
       
        self.fontView.nabobessLabel.text = "Basic information"
        addHeadView()
        self.fontView.eventBlock = { [weak self] in
            self?.lateScalableGabe()
        }
        
        view.addSubview(oamView)
        oamView.addSubview(gabelleMlabel)
        oamView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(fontView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 358.pix(), height: 448.pix()))
        }
        gabelleMlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44.pix())
            make.height.equalTo(25.pix())
        }
        
        view.addSubview(qandaharBtn)
        qandaharBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.bottom.equalToSuperview().offset(-30.pix())
        }
        
        view.addSubview(sharedView)
        sharedView.snp.makeConstraints { make in
            make.top.equalTo(oamView.snp.top).offset(82.pix())
            make.left.equalTo(oamView.snp.left).offset(6.5.pix())
            make.centerX.equalToSuperview()
            make.bottom.equalTo(qandaharBtn.snp.top).offset(-15.pix())
        }
        
        sharedView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        qandaharBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self,
                  let model = self.model.value,
                  let caballineModel = self.caballineModel.value,
                  let liberticideArray = caballineModel.intercept else { return }
            let dict = liberticideArray.reduce(into: ["barricaded": model.enlarged?.orifice ?? ""]) { result, model in
                guard let key = model.wedge else { return }
                let reascended = model.reascended ?? ""
                if reascended == "Some" || reascended == "feeble" {
                    result[key] = model.hound ?? ""
                }else {
                    result[key] = model.bajada ?? ""
                }
            }
            vacationlandCheckSab(with: dict)
        }).disposed(by: identifierBag)
        
        babInteroperabilityWadding()
    }
    
}

extension ZaguanTaberdarViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sharedView.layer.cornerRadius = 15
        sharedView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        sharedView.layer.masksToBounds = true
    }
    
    private func babInteroperabilityWadding() {
        ViewCycleManager.showLoading()
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        let checkedVitamin = String(format: "%@", barricaded)
        let dict = ["barricaded": barricaded,
                    "vitamin": checkedVitamin,
                    "bear": "1",
                    "cotton": "0"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/bloodthirsty", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    if let model = success.net {
                        self.caballineModel.accept(model)
                        self.tableView.reloadData()
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func vacationlandCheckSab(with dict: [String: String]) {
        ViewCycleManager.showLoading()
        let barricaded = dict["barricaded"] ?? ""
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/typical", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    labialiseModelingAaron(from: barricaded) { model in
                        self.model.accept(model)
                        self.unwindingHabaneroScalable(from: model) { model in
                            
                        }
                    }
                    ScroPortionPointConfig.pointToPageWithModel(with: "5", discreteKstime: discreteKstime, jstime: ServerSideDeviceInfo.currentTimestamp)
                }else {
                    ToastManagerConfig.showToastText(form: view, message: success.circular ?? "")
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}

extension ZaguanTaberdarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = self.caballineModel.value
        return model?.intercept?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.caballineModel.value?.intercept?[indexPath.row]
        let reascended = model?.reascended ?? ""
        if reascended == "inflicted" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImplementationBabaViewCell", for: indexPath) as! ImplementationBabaViewCell
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.model.accept(model)
            cell.sabayonBlock = { [weak self] label in
                guard let self = self, let model = model else { return }
                iaafRaceDacquoise(from: model, label: label)
            }
            return cell
        }else if reascended == "feeble" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImplementationBabaViewCell", for: indexPath) as! ImplementationBabaViewCell
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.model.accept(model)
            cell.sabayonBlock = { [weak self] label in
                guard let self = self, let model = model else { return }
                loadAbstractWacko(tin: model, label: label)
            }
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TupleJacamarViewCell", for: indexPath) as! TupleJacamarViewCell
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.model.accept(model)
            cell.aaronInput.publisher(for: \.text)
                .compactMap { $0 }
                .filter { !$0.isEmpty }
                .sink { text in
                    model?.hound = text
                }
                .store(in: &intersectionCancellables)
            return cell
        }
    }
    
}

extension ZaguanTaberdarViewController {
    
    private func iaafRaceDacquoise(from model: interceptModel, label: UILabel) {
        let planarityView = UbietyUawEnmuView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        planarityView.liberticideArray.accept(model.extricate ?? [])
        let cabaneAlert = TYAlertController(alert: planarityView, preferredStyle: .alert)!
        self.present(cabaneAlert, animated: true)
        
        planarityView.signalBlock = { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }
        
        planarityView.scopeBlock = { [weak self] index, enumModel in
            guard let self = self else { return }
            self.dismiss(animated: true) {
                label.text = enumModel.paralysed ?? ""
                label.textColor = .init(cssStr: "#FF3825")
                model.bajada = enumModel.bajada ?? ""
                model.hound = enumModel.paralysed ?? ""
                model.common = enumModel.paralysed ?? ""
            }
        }
    }
    
    private func loadAbstractWacko(tin model: interceptModel, label: UILabel) {
        if let liberticideArray = DataAddressManager.shared.currentModel?.ruby {
            let yabberArray = ThrottleModelConig.mutexYabbiNearest(dataSource: liberticideArray)
            let pickerView = DispidCandidateThreeConfig.showAddressPicker(from: yabberArray, pickerMode: .area) { address, code in
                label.text = address
                label.textColor = .init(cssStr: "#FF3825")
                model.hound = address
                model.common = code
            }
            pickerView.show()
        }
        
    }
    
}
