//
//  CenterViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

import UIKit

class CenterViewController: BaseViewController {
    
    lazy var centerView: CenterView = {
        let centerView = CenterView()
        return centerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(centerView)
        centerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        centerView.aBtn.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
        }).disposed(by: disposeBag)
        
        centerView.bBtn.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
        }).disposed(by: disposeBag)
        
        centerView.cBtn.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let settingVc = SettingViewController()
            self.navigationController?.pushViewController(settingVc, animated: true)
        }).disposed(by: disposeBag)
        
        centerView.dBtn.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
        }).disposed(by: disposeBag)
        
        centerView.eBtn.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
        }).disposed(by: disposeBag)
        
        
        centerView.oneBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let oVc = OrderListViewController()
            oVc.orderType = "4"
            oVc.nameType = "All"
            self.navigationController?.pushViewController(oVc, animated: true)
        }).disposed(by: disposeBag)
        
        centerView.twoBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let oVc = OrderListViewController()
            oVc.orderType = "7"
            oVc.nameType = "Apply"
            self.navigationController?.pushViewController(oVc, animated: true)
        }).disposed(by: disposeBag)
        
        centerView.threeBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let oVc = OrderListViewController()
            oVc.orderType = "6"
            oVc.nameType = "Repayment"
            self.navigationController?.pushViewController(oVc, animated: true)
        }).disposed(by: disposeBag)
        
        centerView.fourBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let oVc = OrderListViewController()
            oVc.orderType = "5"
            oVc.nameType = "Finished"
            self.navigationController?.pushViewController(oVc, animated: true)
        }).disposed(by: disposeBag)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
