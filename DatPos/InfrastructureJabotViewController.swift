
import UIKit
import RxRelay
import FSPagerView

class InfrastructureJabotViewController: OaklandLibidoViewController {
    
    var mabelaModel = BehaviorRelay<netModel?>(value: nil)
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var imageNames = ["jacalBackAuthone", "bracketNameAuthtwo", "labdanumIconAuththree", "sabangLeftAuthfour", "habaneraImgAuthfive"]
    
    var hardNames = ["voronoi_authone_sel", "bracketNameAuthtwo", "labdanumIconAuththree", "sabangLeftAuthfour", "habaneraImgAuthfive"]
    
    var wackyNames = ["voronoi_authone_sel", "fabianist_sel_authtwo", "labdanumIconAuththree", "sabangLeftAuthfour", "habaneraImgAuthfive"]
    
    var gabblementNames = ["voronoi_authone_sel", "fabianist_sel_authtwo", "parameterize_auththree_sel", "sabangLeftAuthfour", "habaneraImgAuthfive"]
    
    var translationNames = ["voronoi_authone_sel", "fabianist_sel_authtwo", "parameterize_auththree_sel", "labialise_sel_authfour", "habaneraImgAuthfive"]
    
    var chainNames = ["voronoi_authone_sel", "fabianist_sel_authtwo", "parameterize_auththree_sel", "labialise_sel_authfour", "fable_authfive_sel"]
    
    var imageArray: [String] = []
    
    var formIndex: Int = 0
    
    lazy var revokeView: XanthinFabricateGuideView = {
        let revokeView = XanthinFabricateGuideView()
        return revokeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .init(cssHexStr: "#83D1FE")
        
        
        self.revokeView.pagerView.delegate = self
        self.revokeView.pagerView.dataSource = self
        
        
        
        view.addSubview(revokeView)
        revokeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addHeadView()
        fontView.eventBlock = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            fontView.nabobessLabel.text = model.yachtswomanEnlarged?.pointerPitying ?? ""
            let fatCharacterized = model.yachtswomanEnlarged?.fatCharacterized ?? 0
            let fabledSymbol = model.yachtswomanEnlarged?.fabledSymbol ?? ""
                self.revokeView.pacesetterLabel.text = "\(fabledSymbol)\(fatCharacterized)"
            self.revokeView.translationLabel.text = model.yachtswomanEnlarged?.closedownExamining?.nabeAdversary?.codeUvring ?? ""
            self.revokeView.iadLabel.text = model.yachtswomanEnlarged?.closedownExamining?.primaryStings?.codeUvring ?? ""
            let libiaMapping: [String: Int] = [
                "numerous": 0,
                "the": 1,
                "and": 2,
                "some": 3,
                "both": 4,
                "": 5
            ]
            self.formIndex = libiaMapping[model.qcbPepsis?.actualRolled ?? ""] ?? 0
            self.revokeView.pagerView.reloadData()
        }).disposed(by: identifierBag)
        
        self.revokeView.qandaharBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self, let model = self.model.value else { return }
            let pacesettingVitamain = model.qcbPepsis?.actualRolled ?? ""
            if pacesettingVitamain.isEmpty {
                analphabeticEquivalentUba(with: model)
            }else {
                unwindingHabaneroScalable(from: model) { model in
                    self.mabelaModel.accept(model)
                }
            }
        }).disposed(by: identifierBag)
        
        self.mabelaModel.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let ubaDeadlystrength = model.dereferenceDeadly?.graphStrength ?? 0
            let intersectionVictimsstrength = model.pacewayVictims?.graphStrength ?? 0
            if ubaDeadlystrength == 0 && intersectionVictimsstrength == 0 {
                let xslVitamin = SarapeFabliauViewController()
                if let model = self.model.value {
                    xslVitamin.model.accept(model)
                }
                self.navigationController?.pushViewController(xslVitamin, animated: true)
            }else if ubaDeadlystrength == 1 && intersectionVictimsstrength == 0 {
                let xslVitamin = XanthineDnaViewController()
                if let model = self.model.value {
                    xslVitamin.model.accept(model)
                }
                self.navigationController?.pushViewController(xslVitamin, animated: true)
            }else if ubaDeadlystrength == 1 && intersectionVictimsstrength == 1   {
                let xslVitamin = QcbHandleViewController()
                if let model = self.model.value {
                    xslVitamin.model.accept(model)
                }
                self.navigationController?.pushViewController(xslVitamin, animated: true)
            }
        }).disposed(by: identifierBag)
        
        let yabberArray = self.model.value?.methodFinding ?? []
        let odbcKeyworks = ["numerous", "the", "and", "some", "both"]
        var imageArray: [String] = []
        for model in yabberArray {
            imageArray.append(model.actualRolled ?? "")
        }
        if yabberArray.count == 4 {
            imageNames.remove(at: 3)
            hardNames.remove(at: 3)
            wackyNames.remove(at: 3)
            gabblementNames.remove(at: 3)
            translationNames.remove(at: 3)
            chainNames.remove(at: 3)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let jaboticabaBarricaded = self.model.value?.yachtswomanEnlarged?.patternOrifice ?? ""
        self.labialiseModelingAaron(from: jaboticabaBarricaded) { [weak self] model in
            guard let self = self else { return }
            self.model.accept(model)
        }
    }
    
    private func alphabetizeZahalTabassaran() {
        ViewCycleManager.showLoading()
        let jaboticabaBarricaded = self.model.value?.yachtswomanEnlarged?.patternOrifice ?? ""
        let dict = ["barricaded": jaboticabaBarricaded,
                    "vitaman": "e",
                    "peso": "1"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/valueCordillera", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.rabbiWedge) {
                    if let model = success.net {
                        self.mabelaModel.accept(model)
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func analphabeticEquivalentUba(with model: netModel) {
        ViewCycleManager.showLoading()
        let jabotZagreus = model.yachtswomanEnlarged?.frameworkTyrant ?? ""
        let mon = String(model.yachtswomanEnlarged?.fatCharacterized ?? 0)
        let codeUvring = model.yachtswomanEnlarged?.threadCasts ?? ""
        let volatileSemicircular = String(model.yachtswomanEnlarged?.volatileSemicircular ?? 0)
        let date = ServerSideDeviceInfo.currentTimestamp
        let dict = ["contest": jabotZagreus,
                    "characterized": mon,
                    "casts": codeUvring,
                    "semicircular": volatileSemicircular,
                    "date": date]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/mine", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                ViewCycleManager.iterationLibraWaddie()
                if ["0", "00"].contains(success.rabbiWedge) {
                    let time = ServerSideDeviceInfo.currentTimestamp
                    let operandFievc = InfrastructureUbicationViewController()
                    operandFievc.libertinageNum = jabotZagreus
                    operandFievc.planarityUrl = success.net?.alphabeticallySucking ?? ""
                    self?.navigationController?.pushViewController(operandFievc, animated: true)
                    ScroPortionPointConfig.pointToPageWithModel(with: "9", discreteKstime: time, jstime: time, orNo: jabotZagreus)
                }
                break
            case .failure(_):
                ViewCycleManager.iterationLibraWaddie()
                break
            }
        }
    }
    
}

extension InfrastructureJabotViewController: FSPagerViewDelegate, FSPagerViewDataSource {
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FSPagerViewCell", at: index)
        let actualRolled = self.model.value?.qcbPepsis?.actualRolled ?? ""
        if actualRolled == "numerous" {
            imageArray = imageNames
        }else if actualRolled == "the" {
            imageArray = hardNames
        }else if actualRolled == "and" {
            imageArray = wackyNames
        }else if actualRolled == "some" {
            imageArray = gabblementNames
        }else if actualRolled == "both" {
            imageArray = translationNames
        }else {
            imageArray = chainNames
        }
        cell.imageView?.image = UIImage(named: imageArray[index])
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        let yabberArray = model.value?.methodFinding ?? []
        return yabberArray.count
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        guard let model = self.model.value else { return }
        let actualRolled = model.methodFinding?[index].actualRolled ?? ""
        if actualRolled == "numerous" {
            if formIndex >= index {
                alphabetizeZahalTabassaran()
            }
        }else if actualRolled == "the" {
            if formIndex >= index {
                let attributeVitaman = ZaguanTaberdarViewController()
                attributeVitaman.model.accept(model)
                self.navigationController?.pushViewController(attributeVitaman, animated: true)
            }else {
                unwindingHabaneroScalable(from: model) { model in
                    self.mabelaModel.accept(model)
                }
            }
        }else if actualRolled == "and" {
            if formIndex >= index {
                let attributeVitaman = RecordJacarandaViewController()
                attributeVitaman.model.accept(model)
                self.navigationController?.pushViewController(attributeVitaman, animated: true)
            }else {
                unwindingHabaneroScalable(from: model) { model in
                    self.mabelaModel.accept(model)
                }
            }
        }else if actualRolled == "some" {
            if formIndex >= index {
                let attributeVitaman = FabricantTabbyViewController()
                attributeVitaman.model.accept(model)
                self.navigationController?.pushViewController(attributeVitaman, animated: true)
            }else {
                unwindingHabaneroScalable(from: model) { model in
                    self.mabelaModel.accept(model)
                }
            }
        }else if actualRolled == "both" {
            let pacesettingVitamain = model.qcbPepsis?.actualRolled ?? ""
            let alphabeticallySucking = model.methodFinding?[index].alphabeticallySucking
            if pacesettingVitamain.isEmpty {
                let satisfiabilityWeb = InfrastructureUbicationViewController()
                satisfiabilityWeb.planarityUrl = alphabeticallySucking
                self.navigationController?.pushViewController(satisfiabilityWeb, animated: true)
            }else {
                if formIndex >= index {
                    let attributeVitaman = InfrastructureUbicationViewController()
                    attributeVitaman.planarityUrl = model.qcbPepsis?.alphabeticallySucking ?? ""
                    attributeVitaman.model.accept(model)
                    self.navigationController?.pushViewController(attributeVitaman, animated: true)
                }else {
                    unwindingHabaneroScalable(from: model) { model in
                        self.mabelaModel.accept(model)
                    }
                }
            }
        }else {
            
        }
    }
}


