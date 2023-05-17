//
//  ViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 08.05.23.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let screens: [String: UIViewController] = ["Weather App": WeatherHomeViewController(), "Crypto App": CryptoTapBarController(), "Finance App": FinanceTapBarController(),"Travel App": TravelHomeViewController(), "Singles App": SinglesTapBarController()]
    
//    "Crypto App", "Finance App", "Travel App", "Singles App"
    private let cellId = "cellId"

    lazy var viewControllersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cvv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cvv.layer.cornerRadius = 20
        cvv.dataSource = self
        cvv.delegate = self
        cvv.translatesAutoresizingMaskIntoConstraints = false
        return cvv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllersCollectionView.register(HomeViewControllerCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        screens.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = viewControllersCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? HomeViewControllerCell else {
            return UICollectionViewCell()
        }
        let screensLabels = Array(screens.keys)
//        let selectedScreen = screens[selectedScreenKey]
        cell.screenLabel.text = screensLabels[indexPath.item]
        
        return cell
    }
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: view.frame.height / 5)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let screenViewControllers = Array(screens.values)
        let selectedViewController = screenViewControllers[indexPath.item]
        navigationController?.pushViewController(selectedViewController, animated: true)
//        selectedViewController.modalPresentationStyle = .fullScreen
//        present(selectedViewController, animated: true)
    }
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

