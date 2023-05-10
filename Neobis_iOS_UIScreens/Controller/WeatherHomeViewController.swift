//
//  WeatherHomeViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 09.05.23.
//

import UIKit
import SnapKit

class WeatherHomeViewController: UIViewController {
    
    private let locationLogo: CustomImageView = {
        let imageView = CustomImageView(imageName: "location")
        return imageView
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(locationLogo)
        
        view.backgroundColor = .green
        print("WeatherHomeViewController is loaded")
    }
    
    func setupViews() {
        view.addSubview(locationLogo)
    }
    
    func setupConstraints() {
        
        locationLogo.snp.makeConstraints { make in
            make.width.equalTo(18)
            make.height.equalTo(22)
            make.top.equalToSuperview().
        }
    
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
