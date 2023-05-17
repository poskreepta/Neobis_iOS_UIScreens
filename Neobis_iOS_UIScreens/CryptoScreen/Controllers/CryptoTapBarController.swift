//
//  CryptoTapBarController.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 14.05.23.
//

import UIKit

class CryptoTapBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTapBar()
        view.backgroundColor = .white
        tabBar.frame.size.height = 75
        tabBar.backgroundColor = .white

    }
    
    private func generateTapBar() {
        viewControllers = [generateVC(viewController: CryptoHomeViewController(), title: "", image: "mainTapBarItem"), generateVC(viewController: UIViewController(), title: "", image: "middleTapBarItem"), generateVC(viewController: UIViewController(), title: "", image: "profileTapBarItem")]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: String) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: image)
        return viewController
    }
    
}
