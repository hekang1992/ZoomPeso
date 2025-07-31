
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
        architectureView.backgroundColor = .init(cssHexStr: "#FAFAFA")
        architectureView.layer.cornerRadius = 10.pix()
        architectureView.layer.masksToBounds = true
        return architectureView
    }()
    
    lazy var aaronInput: UITextField = {
        let aaronInput = UITextField()
        aaronInput.textColor = .init(cssHexStr: "#FF3825")
        let motionAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 15.pix(), weight: .medium)
        ]
        aaronInput.attributedPlaceholder = NSAttributedString(
            string: "",
            attributes: motionAttributes
        )
        return aaronInput
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(accoucheDesclabel)
        contentView.addSubview(architectureView)
        architectureView.addSubview(aaronInput)
        
        accoucheDesclabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.pix())
            make.left.equalToSuperview().offset(12.pix())
            make.height.equalTo(21.pix())
            make.bottom.equalToSuperview().offset(-50.pix())
        }
        
        architectureView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(accoucheDesclabel.snp.bottom).offset(5.pix())
            make.left.equalTo(accoucheDesclabel.snp.left)
            make.height.equalTo(44.pix())
        }
        
        aaronInput.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15.pix())
            make.right.equalToSuperview().offset(-2.pix())
            make.height.equalTo(44.pix())
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            accoucheDesclabel.text = model.videoBacks ?? ""
            let sabbatarianCommon = model.sabbatarianCommon ?? ""
            let throwHound = model.throwHound ?? ""
            if sabbatarianCommon.isEmpty {
                if throwHound.isEmpty {
                    aaronInput.text = ""
                }else {
                    aaronInput.text = throwHound
                }
            }else {
                aaronInput.text = sabbatarianCommon
            }
            aaronInput.attributedPlaceholder = NSAttributedString(string: model.liberticidalTuft ?? "")
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
