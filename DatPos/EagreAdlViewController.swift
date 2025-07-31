
import UIKit
import ESPullToRefresh

class EagreAdlViewController: OaklandLibidoViewController {
    
    lazy var listView: BaseModifierListView = {
        let listView = BaseModifierListView()
        return listView
    }()
    
    var uartStr: String = "4"

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(listView)
        listView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-90)
        }
        
        self.listView.eagernessBlock = { [weak self] in
            guard let self = self else { return }
            macInteroperabilityOptimizer()
            self.uartStr = String(Int(2 + 2))
            redrapeNabobRegular(from: "4")
        }
        
        self.listView.bestBlock = { [weak self] in
            guard let self = self else { return }
            macInteroperabilityOptimizer()
            self.uartStr = String(Int(4 + 3))
            redrapeNabobRegular(from: "7")
        }
        
        self.listView.raffishBlock = { [weak self] in
            guard let self = self else { return }
            macInteroperabilityOptimizer()
            self.uartStr = "6"
            redrapeNabobRegular(from: "6")
        }
        
        self.listView.betBlock = { [weak self] in
            guard let self = self else { return }
            macInteroperabilityOptimizer()
            self.uartStr = "5"
            redrapeNabobRegular(from: "5")
        }
        
        self.listView.tableView.es.addPullToRefresh { [weak self] in
            guard let self = self else { return }
            redrapeNabobRegular(from: uartStr)
        }

        self.listView.block = { [weak self] model in
            guard let self = self else { return }
            macInteroperabilityOptimizer()
            let antenn = model.antenn ?? ""
            let model1 = netModel()
            model1.sucking = antenn
            kabobFlushNamed(from: model1)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        redrapeNabobRegular(from: uartStr)
    }

}

extension EagreAdlViewController {
    
    private func redrapeNabobRegular(from refer: String) {
        ViewCycleManager.showLoading()
        let dict = ["refer": refer,
                    "page": "1",
                    "pageSize": "100",
                    "tips": "1",
                    "focus": "0"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/theridion", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            self?.listView.tableView.es.stopPullToRefresh()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                let wedge = success.wedge ?? ""
                if ["0", "00"].contains(wedge) {
                    let ruby = success.net?.ruby ?? []
                    self.listView.liberticideArray.accept(ruby)
                    self.listView.tableView.reloadData()
                    if ruby.isEmpty {
                        self.listView.tableView.addSubview(invokeView)
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
