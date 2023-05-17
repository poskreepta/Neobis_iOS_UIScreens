//
//  SinglesTapBarController.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 16.05.23.
//

import UIKit

class SinglesTapBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTapBar()
        view.backgroundColor = .white
        tabBar.frame.size.height = 75
        tabBar.backgroundColor = UIColor(hexString: "#F2F2F2")
    }
    
    private func generateTapBar() {
        viewControllers = [generateVC(viewController: SinglesHomeViewController(), title: "Series", image: "series"), generateVC(viewController: UIViewController(), title: "Headspace", image: "headphones"), generateVC(viewController: UIViewController(), title: "Profile", image: "profile")]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: String) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: image)
        return viewController
    }

}
