
import UIKit
import ESPullToRefresh
import RxRelay

class ThinLabelViewController: OaklandLibidoViewController {
    
    var tabbinetType: String = String(Int(3 + 1))
    
    var hostType: String = "All"
    
    var liberticideArray = BehaviorRelay<[rubyModel]?>(value: nil)

    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(MultiuserIntersectionViewCell.self, forCellReuseIdentifier: "MultiuserIntersectionViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(architectureView)
        architectureView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.fontView.nabobessLabel.text = hostType
        addHeadView()
        self.fontView.eventBlock = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        
        
        architectureView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.tableView.es.addPullToRefresh { [weak self] in
                guard let self = self else { return }
                redrapeNabobRegular(from: tabbinetType)
        }
        
        redrapeNabobRegular(from: tabbinetType)
       
    }
    
}


extension ThinLabelViewController {
    
    private func redrapeNabobRegular(from refer: String) {
        ViewCycleManager.showLoading()
        let dict = ["refer": refer,
                    "ems": "1",
                    "order": "1"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/theridion", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            self?.tableView.es.startPullToRefresh()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                let wedge = success.wedge ?? ""
                if ["0", "00"].contains(wedge) {
                    let ruby = success.net?.ruby ?? []
                    self.liberticideArray.accept(ruby)
                    self.tableView.reloadData()
                    if ruby.isEmpty {
                        self.tableView.addSubview(invokeView)
                        invokeView.snp.makeConstraints { make in
                            make.edges.equalToSuperview()
                        }
                    }else {
                        self.invokeView.removeFromSuperview()
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}

extension ThinLabelViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 188.pix()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.liberticideArray.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.liberticideArray.value?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MultiuserIntersectionViewCell", for: indexPath) as! MultiuserIntersectionViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.model.accept(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.liberticideArray.value?[indexPath.row]
        let antenn = model?.antenn ?? ""
        let rabbaniteNmodel = netModel()
        rabbaniteNmodel.sucking = antenn
        kabobFlushNamed(from: rabbaniteNmodel)
    }
    
}
