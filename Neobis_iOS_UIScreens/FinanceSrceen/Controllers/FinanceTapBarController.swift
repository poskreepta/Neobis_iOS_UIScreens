//
//  FinanceTapBarController.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 15.05.23.
//

import UIKit

class FinanceTapBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTapBar()
        view.backgroundColor = .white
        tabBar.frame.size.height = 75
        tabBar.backgroundColor = UIColor(hexString: "#F2F2F2")
    }
    
    private func generateTapBar() {
        viewControllers = [generateVC(viewController: FinanceHomeViewController(), title: "", image: "mainTapBarItemFinance"), generateVC(viewController: UIViewController(), title: "", image: "middleTapBarItemFinance"), generateVC(viewController: UIViewController(), title: "", image: "profileTapBarItemFinance")]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: String) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: image)
        return viewController
    }
    

}
