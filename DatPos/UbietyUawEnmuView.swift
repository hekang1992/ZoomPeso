
import UIKit
import RxRelay

class UbietyUawEnmuView: BaseView {
    
    var signalBlock: (() -> Void)?
    
    var scopeBlock: ((Int, extricateModel) -> Void)?
    
    var defaultPath: IndexPath?
    
    var liberticideArray = BehaviorRelay<[extricateModel]?>(value: nil)

    lazy var dictionariesView: UIImageView = {
        let dictionariesView = UIImageView()
        dictionariesView.image = UIImage(named: "sequentialIconOneenumimage")
        dictionariesView.isUserInteractionEnabled = true
        return dictionariesView
    }()
    
    lazy var architectureView: UIView = {
        let architectureView = UIView()
        return architectureView
    }()
    
    lazy var sexagesimalBtn: UIButton = {
        let sexagesimalBtn = UIButton(type: .custom)
        sexagesimalBtn.setTitle("Confirm", for: .normal)
        sexagesimalBtn.titleLabel?.font = UIFont(name: kafFont, size: 18.pix())
        sexagesimalBtn.backgroundColor = .init(cssStr: "#FF3825")
        sexagesimalBtn.setTitleColor(.white, for: .normal)
        sexagesimalBtn.layer.cornerRadius = 23.5
        sexagesimalBtn.layer.borderWidth = 2
        sexagesimalBtn.layer.borderColor = UIColor.init(cssStr: "#FCE69B")?.cgColor
        return sexagesimalBtn
    }()
    
    lazy var poolingBtn: UIButton = {
        let poolingBtn = UIButton(type: .custom)
        poolingBtn.setImage(UIImage(named: "platformIacuCencelximge"), for: .normal)
        return poolingBtn
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(QanonNabobshipViewCell.self, forCellReuseIdentifier: "QanonNabobshipViewCell")
        tableView.estimatedRowHeight = 80
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.rowHeight = UITableView.automaticDimension
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dictionariesView)
        dictionariesView.addSubview(architectureView)
        architectureView.addSubview(tableView)
        addSubview(sexagesimalBtn)
        addSubview(poolingBtn)
        
        dictionariesView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 288.pix(), height: 299.pix()))
            make.centerY.equalToSuperview().offset(-40.pix())
        }
        
        architectureView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(87.pix())
            make.left.equalToSuperview().offset(3.pix())
            make.centerX.equalToSuperview()
            make.height.equalTo(180.pix())
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        sexagesimalBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dictionariesView.snp.bottom).offset(-23.pix())
            make.size.equalTo(CGSize(width: 237.pix(), height: 46.pix()))
        }
        
        poolingBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(sexagesimalBtn.snp.bottom).offset(50.pix())
            make.size.equalTo(CGSize(width: 26.pix(), height: 26.pix()))
        }
        
        sexagesimalBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self, let defaultPath = defaultPath else {
                if let self = self {
                    ToastManagerConfig.showToastText(form: self, message: "Please select one of the options.")
                }
                return
            }
            if let model = self.liberticideArray.value?[defaultPath.row] {
                self.scopeBlock?(defaultPath.row, model)
            }
            
        }).disposed(by: identifierBag)
        
        poolingBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.signalBlock?()
        }).disposed(by: identifierBag)
        
        liberticideArray.compactMap { $0 }.asObservable().bind(to: tableView.rx.items(cellIdentifier: "QanonNabobshipViewCell", cellType: QanonNabobshipViewCell.self)) { row, model, cell in
            cell.nabobessLabel.text = model.paralysed ?? ""
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.yachtyView.isHidden = true
            cell.nabobessLabel.textAlignment = .center
            if let defaultPath = self.defaultPath {
                if defaultPath.row == row {
                    cell.architectureView.backgroundColor = .init(cssStr: "#FE5255")
                }else {
                    cell.architectureView.backgroundColor = .init(cssStr: "#FAFAFA")
                }
            }
        }.disposed(by: identifierBag)
        
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            defaultPath = indexPath
            tableView.reloadData()
        }).disposed(by: identifierBag)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
