
import UIKit
import RxSwift

class BaseViewCell: UITableViewCell {
    let identifierBag = DisposeBag()
}

class BaseView: UIView {
    let identifierBag = DisposeBag()
}

class EmptyView: UIView {
    lazy var operandView: UIImageView = {
        let operandView = UIImageView()
        operandView.image = UIImage(named: "gabardineAddEmputiamge")
        return operandView
    }()
    
    lazy var graphLabel: UILabel = {
        let graphLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12.bcPix(), weight: .medium), textColor: .init(cssStr: "#FFFFFF")!, textAlignment: .center)
        graphLabel.text = "You have no orders"
        return graphLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(operandView)
        addSubview(graphLabel)
        operandView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo((SCREEN_WIDTH - 222.bcPix()) * 0.5)
            make.size.equalTo(CGSize(width: 222.bcPix(), height: 169.bcPix()))
        }
        graphLabel.snp.makeConstraints { make in
            make.top.equalTo(operandView.snp.bottom)
            make.centerX.equalTo(operandView.snp.centerX)
            make.width.equalTo(SCREEN_WIDTH)
            make.height.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
