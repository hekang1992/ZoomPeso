//
//  SettingViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/23.
//

import UIKit

class SettingViewController: BaseViewController {
    
    lazy var hedImageView: UIImageView = {
        let hedImageView = UIImageView()
        hedImageView.image = UIImage(named: "seigmeiage")
        return hedImageView
    }()
    
    lazy var aImageView: UIImageView = {
        let aImageView = UIImageView()
        aImageView.isUserInteractionEnabled = true
        aImageView.image = UIImage(named: "veisongimage")
        return aImageView
    }()
    
    lazy var bImageView: UIImageView = {
        let bImageView = UIImageView()
        bImageView.isUserInteractionEnabled = true
        bImageView.image = UIImage(named: "anndeimgeacimge")
        return bImageView
    }()
    
    lazy var cImageView: UIImageView = {
        let cImageView = UIImageView()
        cImageView.isUserInteractionEnabled = true
        cImageView.image = UIImage(named: "logimged")
        return cImageView
    }()
    
    lazy var vLabel: UILabel = {
        let vLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .medium), textColor: .white, textAlignment: .right)
        vLabel.text = "\(Bundle.main.releaseVersionNumber ?? "")"
        return vLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(hedImageView)
        hedImageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(136.pix())
        }
        self.headView.nameLabel.text = "Settings"
        addHeadView()
        self.headView.backBlock = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        
        view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(hedImageView.snp.bottom).offset(-30)
        }
        
        bgView.addSubview(aImageView)
        bgView.addSubview(bImageView)
        bgView.addSubview(cImageView)
        
        aImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        
        bImageView.snp.makeConstraints { make in
            make.top.equalTo(aImageView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        
        cImageView.snp.makeConstraints { make in
            make.top.equalTo(bImageView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        
        
        aImageView.addSubview(vLabel)
        vLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-27.pix())
            make.size.equalTo(CGSize(width: 200, height: 15))
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgView.layer.cornerRadius = 30
        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bgView.layer.masksToBounds = true
    }
    
}

