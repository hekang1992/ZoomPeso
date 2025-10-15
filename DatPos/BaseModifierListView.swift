
import UIKit
import RxRelay

class BaseModifierListView: BaseView {
    
    var liberticideArray = BehaviorRelay<[rubyModel]?>(value: nil)
    
    let height = 73.bcPix()
    let width = SCREEN_WIDTH * 0.25
    
    var eagernessBlock: (() -> Void)?
    var bestBlock: (() -> Void)?
    var raffishBlock: (() -> Void)?
    var betBlock: (() -> Void)?
    
    private var windowsLayer: CAGradientLayer!
    
    var block: ((rubyModel) -> Void)?
    
    lazy var architectureView: UIView = {
        let architectureView = UIView()
        return architectureView
    }()
    
    lazy var thinView: UIImageView = {
        let thinView = UIImageView()
        thinView.image = UIImage(named: "polygonPicOrderlisgimge")
        return thinView
    }()
    
    lazy var gabberView: UIImageView = {
        let gabberView = UIImageView()
        gabberView.image = UIImage(named: "pdaLeftMahuaimage")
        gabberView.contentMode = .scaleAspectFit
        return gabberView
    }()
    
    lazy var oakmossBtn: UIButton = {
        let oakmossBtn = UIButton(type: .custom)
        oakmossBtn.adjustsImageWhenHighlighted = false
        oakmossBtn.setImage(UIImage(named: "libraeGenericityAllnor"), for: .normal)
        oakmossBtn.setImage(UIImage(named: "aapamoorIconAllsel"), for: .selected)
        oakmossBtn.isSelected = true
        return oakmossBtn
    }()
    
    lazy var eventBtn: UIButton = {
        let eventBtn = UIButton(type: .custom)
        eventBtn.adjustsImageWhenHighlighted = false
        eventBtn.setImage(UIImage(named: "modelingPicApplynor"), for: .normal)
        eventBtn.setImage(UIImage(named: "pacemakerAddApplysel"), for: .selected)
        return eventBtn
    }()
    
    lazy var accoucheurBtn: UIButton = {
        let accoucheurBtn = UIButton(type: .custom)
        accoucheurBtn.adjustsImageWhenHighlighted = false
        accoucheurBtn.setImage(UIImage(named: "eaglestoneBackRepaynor"), for: .normal)
        accoucheurBtn.setImage(UIImage(named: "macaberAddRepaysel"), for: .selected)
        return accoucheurBtn
    }()
    
    lazy var tabbyBtn: UIButton = {
        let tabbyBtn = UIButton(type: .custom)
        tabbyBtn.adjustsImageWhenHighlighted = false
        tabbyBtn.setImage(UIImage(named: "qbpImageFinishnor"), for: .normal)
        tabbyBtn.setImage(UIImage(named: "escapeNameFinishsel"), for: .selected)
        return tabbyBtn
    }()
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(architectureView)
        addSubview(thinView)
        addSubview(gabberView)
        addSubview(oakmossBtn)
        addSubview(eventBtn)
        addSubview(accoucheurBtn)
        addSubview(tabbyBtn)
        addSubview(tableView)
        architectureView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        thinView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(231.bcPix())
        }
        gabberView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(53.bcPix())
            make.top.equalTo(thinView.snp.bottom).offset(-30.bcPix())
        }
        oakmossBtn.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(gabberView.snp.bottom).offset(-10)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        eventBtn.snp.makeConstraints { make in
            make.left.equalTo(oakmossBtn.snp.right)
            make.top.equalTo(oakmossBtn.snp.top)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        accoucheurBtn.snp.makeConstraints { make in
            make.left.equalTo(eventBtn.snp.right)
            make.top.equalTo(oakmossBtn.snp.top)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        tabbyBtn.snp.makeConstraints { make in
            make.left.equalTo(accoucheurBtn.snp.right)
            make.top.equalTo(oakmossBtn.snp.top)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(oakmossBtn.snp.bottom)
        }
        enumFactoringMacaber()
        
        oakmossBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.eagernessBlock?()
            nabokovianInfrastructureKaf(oakmossBtn)
        }).disposed(by: identifierBag)
        
        eventBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.bestBlock?()
            nabokovianInfrastructureKaf(eventBtn)
        }).disposed(by: identifierBag)
        
        accoucheurBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.raffishBlock?()
            nabokovianInfrastructureKaf(accoucheurBtn)
        }).disposed(by: identifierBag)
        
        tabbyBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.betBlock?()
            nabokovianInfrastructureKaf(tabbyBtn)
        }).disposed(by: identifierBag)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        windowsLayer.frame = architectureView.bounds
    }
    
    private func nabokovianInfrastructureKaf(_ selectedButton: UIButton) {
        oakmossBtn.isSelected = false
        eventBtn.isSelected = false
        accoucheurBtn.isSelected = false
        tabbyBtn.isSelected = false
        selectedButton.isSelected = true
    }
    
    private func enumFactoringMacaber() {
        windowsLayer = CAGradientLayer()
        windowsLayer.colors = [
            UIColor(cssStr: "#7CCCFE")!.cgColor,
            UIColor(cssStr: "#7CCCFE")!.cgColor
        ]
        windowsLayer.startPoint = CGPoint(x: 0, y: 0)
        windowsLayer.endPoint = CGPoint(x: 1, y: 1)
        architectureView.layer.insertSublayer(windowsLayer, at: 0)
    }
    
}

extension BaseModifierListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = self.liberticideArray.value?[indexPath.row] {
            self.block?(model)
        }
    }
    
}

extension BaseModifierListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 188.bcPix()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.liberticideArray.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MultiuserIntersectionViewCell", for: indexPath) as! MultiuserIntersectionViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        let model = self.liberticideArray.value?[indexPath.row]
        cell.model.accept(model)
        return cell
    }

}
