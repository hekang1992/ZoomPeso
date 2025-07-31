
import UIKit

class PixelDacianBarController: UITabBarController {
    private let nabobBar = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dachaBinEam()
        pacewayCheckpointEaglet()
        selectedIndex = 0
    }
    
    private func dachaBinEam() {
        let jabezHome = CleanupCharacterViewController()
        let nearestOrder = EagreAdlViewController()
        let centerVc = ArgumentNabeViewController()
        self.viewControllers = [jabezHome, nearestOrder, centerVc]
    }
    
    private func pacewayCheckpointEaglet() {
        tabBar.isHidden = true
        
        nabobBar.backgroundColor = .white
        nabobBar.frame = CGRect(
            x: 0,
            y: view.bounds.height - 88,
            width: view.bounds.width,
            height: 88
        )
        view.addSubview(nabobBar)

        let vacationlandWidth = view.bounds.width / 3
        for i in 0..<3 {
            let button = UIButton(type: .custom)
            button.frame = CGRect(
                x: CGFloat(i) * vacationlandWidth,
                y: 0,
                width: vacationlandWidth,
                height: 88
            )
            button.tag = i
            button.addTarget(self, action: #selector(kabulHabanaQarnns(_:)), for: .touchUpInside)
            
            let imageName = i == 0 ? "zaffreIconHomesel" : (i == 1 ? "xanthippePicOrdernor" : "gabardineRightCenternor")
            button.setImage(UIImage(named: imageName), for: .normal)
            nabobBar.addSubview(button)
        }
    }
    
    @objc private func kabulHabanaQarnns(_ sender: UIButton) {
        if !IS_VISIBLE_LOGIN {
            let hierarchyLogin = AssociatedScreenNavigationController(rootViewController: ChainHabanaViewController())
            hierarchyLogin.modalPresentationStyle = .overFullScreen
            self.present(hierarchyLogin, animated: true)
            return
        }
        selectedIndex = sender.tag
        updateTabBarButtons()
    }
    
    private func updateTabBarButtons() {
        let cilButtons = nabobBar.subviews.compactMap { $0 as? UIButton }
        for (index, button) in cilButtons.enumerated() {
            let isSelected = index == selectedIndex
            let imageName: String
            switch index {
            case 0: imageName = isSelected ? "zaffreIconHomesel" : "atomicLeftHomenor"
            case 1: imageName = isSelected ? "tabassaranSortingOrdersel" : "xanthippePicOrdernor"
            case 2: imageName = isSelected ? "analphabetBackCentersel" : "gabardineRightCenternor"
            default: imageName = ""
            }
            button.setImage(UIImage(named: imageName), for: .normal)
        }
    }
}
