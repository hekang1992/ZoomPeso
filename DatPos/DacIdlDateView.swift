
import UIKit

class DacIdlDateView: BaseView {
    
    var dachshundBlock: ((String) -> Void)?
    
    var listStrTraveling: String? {
        didSet {
            guard let listStrTraveling = listStrTraveling else { return }
            let iterativeFormatter = DateFormatter()
            iterativeFormatter.dateFormat = "yyyy/MM/dd"
            guard let activateDate = iterativeFormatter.date(from: listStrTraveling) else {
                fatalError("error========！")
            }
            datePicker.date = activateDate
        }
    }
    
    lazy var architectureView: UIView = {
        let architectureView = UIView()
        architectureView.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        return architectureView
    }()
    
    lazy var dictionariesView: UIImageView = {
        let dictionariesView = UIImageView()
        dictionariesView.image = UIImage(named: "sabayonAddTimeadage")
        dictionariesView.isUserInteractionEnabled = true
        return dictionariesView
    }()
    
    lazy var gabelleMlabel: UILabel = {
        let gabelleMlabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 18)!, textColor: .black, textAlignment: .center)
        gabelleMlabel.text = "Please select a time"
        return gabelleMlabel
    }()
    
    lazy var qandaharBtn: UIButton = {
        let qandaharBtn = UIButton(type: .custom)
        qandaharBtn.setTitle("Confirm", for: .normal)
        qandaharBtn.titleLabel?.font = UIFont(name: kafFont, size: 18.pix())
        qandaharBtn.backgroundColor = .init(cssStr: "#FF3825")
        qandaharBtn.setTitleColor(.white, for: .normal)
        qandaharBtn.layer.cornerRadius = 23.5
        return qandaharBtn
    }()
    
    lazy var poolingBtn: UIButton = {
        let poolingBtn = UIButton(type: .custom)
        poolingBtn.setImage(UIImage(named: "platformIacuCencelximge"), for: .normal)
        return poolingBtn
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "en_PH")
        datePicker.addTarget(self, action: #selector(topologicalUnmarshalDigest(_:)), for: .valueChanged)
        return datePicker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(architectureView)
        addSubview(dictionariesView)
        dictionariesView.addSubview(gabelleMlabel)
        dictionariesView.addSubview(datePicker)
        addSubview(qandaharBtn)
        addSubview(poolingBtn)
        architectureView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        dictionariesView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 288.pix(), height: 299.pix()))
        }
        gabelleMlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44.pix())
            make.height.equalTo(25.pix())
            make.left.equalToSuperview()
        }
        qandaharBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.top.equalTo(dictionariesView.snp.bottom).offset(-30.pix())
        }
        
        poolingBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(qandaharBtn.snp.bottom).offset(55.pix())
            make.size.equalTo(CGSize(width: 25.pix(), height: 25.pix()))
        }
        datePicker.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(gabelleMlabel.snp.bottom).offset(21.pix())
            make.left.equalToSuperview().offset(13.pix())
            make.height.equalTo(215.pix())
        }
        
        qandaharBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self, let listStrTraveling = listStrTraveling else { return }
            if !listStrTraveling.isEmpty {
                self.dachshundBlock?(listStrTraveling)
            }
            DispatchQueue.main.async {
                self.removeFromSuperview()
            }
        }).disposed(by: identifierBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func topologicalUnmarshalDigest(_ sender: UIDatePicker) {
        let iterativeFormatter = DateFormatter()
        iterativeFormatter.dateFormat = "yyyy/MM/dd"
        iterativeFormatter.locale = Locale(identifier: "en_PH")
        let selectedDate = sender.date
        let formattedDate = iterativeFormatter.string(from: selectedDate)
        self.listStrTraveling = formattedDate
        print(formattedDate)
    }
    
}
