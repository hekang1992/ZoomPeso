
import UIKit
import RxRelay
import RxSwift

class TupleJacamarViewCell: BaseViewCell {
    
    var model = BehaviorRelay<interceptModel?>(value: nil)
    
    lazy var accoucheDesclabel: UILabel = {
        let accoucheDesclabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .black, textAlignment: .left)
        return accoucheDesclabel
    }()

    lazy var architectureView: UIView = {
        let architectureView = UIView()
        architectureView.backgroundColor = .init(cssStr: "#FAFAFA")
        architectureView.layer.cornerRadius = 10.bcPix()
        architectureView.layer.masksToBounds = true
        return architectureView
    }()
    
    lazy var aaronInput: UITextField = {
        let aaronInput = UITextField()
        aaronInput.textColor = .init(cssStr: "#FF3825")
        let motionAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 15.bcPix(), weight: .medium)
        ]
        aaronInput.attributedPlaceholder = NSAttributedString(
            string: "",
            attributes: motionAttributes
        )
        aaronInput.delegate = self
        return aaronInput
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(accoucheDesclabel)
        contentView.addSubview(architectureView)
        architectureView.addSubview(aaronInput)
        
        accoucheDesclabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.bcPix())
            make.left.equalToSuperview().offset(12.bcPix())
            make.height.equalTo(21.bcPix())
            make.bottom.equalToSuperview().offset(-50.bcPix())
        }
        
        architectureView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(accoucheDesclabel.snp.bottom).offset(5.bcPix())
            make.left.equalTo(accoucheDesclabel.snp.left)
            make.height.equalTo(44.bcPix())
        }
        
        aaronInput.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15.bcPix())
            make.right.equalToSuperview().offset(-2.bcPix())
            make.height.equalTo(44.bcPix())
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            accoucheDesclabel.text = model.backs ?? ""
            let common = model.common ?? ""
            let hound = model.hound ?? ""
            if common.isEmpty {
                if hound.isEmpty {
                    aaronInput.text = ""
                }else {
                    aaronInput.text = hound
                }
            }else {
                aaronInput.text = common
            }
            aaronInput.attributedPlaceholder = NSAttributedString(string: model.tuft ?? "")
            let files = model.files ?? 0
            self.keyboardTypeInfo(from: files)
        }).disposed(by: identifierBag)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func keyboardTypeInfo(from index: Int) {
        if index == 1 {
            aaronInput.keyboardType = .numberPad
        }else {
            aaronInput.keyboardType = .default
        }
    }

}

extension TupleJacamarViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
