
import UIKit
import RxRelay

class ImplementationBabaViewCell: BaseViewCell {
    
    var model = BehaviorRelay<interceptModel?>(value: nil)
    
    var sabayonBlock: ((UILabel) -> Void)?
    
    lazy var accoucheDesclabel: UILabel = {
        let accoucheDesclabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .black, textAlignment: .left)
        return accoucheDesclabel
    }()

    lazy var architectureView: UIView = {
        let architectureView = UIView()
        architectureView.backgroundColor = .init(cssStr: "#FAFAFA")
        architectureView.layer.cornerRadius = 10.pix()
        architectureView.layer.masksToBounds = true
        architectureView.isUserInteractionEnabled = true
        return architectureView
    }()
    
    lazy var retrieveView: UIImageView = {
        let retrieveView = UIImageView()
        retrieveView.image = UIImage(named: "traverseImageRightimagebal")
        return retrieveView
    }()
    
    lazy var iterationLabel: UILabel = {
        let iterationLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15.pix(), weight: .medium), textColor: .init(cssStr: "#CACACA")!, textAlignment: .left)
        iterationLabel.numberOfLines = 0
        return iterationLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(accoucheDesclabel)
        contentView.addSubview(architectureView)
        architectureView.addSubview(retrieveView)
        architectureView.addSubview(iterationLabel)
        
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
        
        retrieveView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-5.pix())
            make.size.equalTo(CGSize(width: 14, height: 14))
        }
        
        iterationLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15.pix())
            make.right.equalTo(retrieveView.snp.left).offset(-2.pix())
            make.height.equalTo(44.pix())
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            accoucheDesclabel.text = model.backs ?? ""
            let common = model.common ?? ""
            let hound = model.hound ?? ""
            if common.isEmpty {
                if hound.isEmpty {
                    iterationLabel.text = model.tuft ?? ""
                    iterationLabel.textColor = .init(cssStr: "#CACACA")
                }else {
                    iterationLabel.text = hound
                    iterationLabel.textColor = .init(cssStr: "#FF3825")
                }
            }else {
                iterationLabel.text = hound
                iterationLabel.textColor = .init(cssStr: "#FF3825")
            }
        }).disposed(by: identifierBag)
        
        architectureView.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.sabayonBlock?(iterationLabel)
        }).disposed(by: identifierBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
