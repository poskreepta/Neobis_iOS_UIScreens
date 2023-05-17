//
//  WeatherHomeViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 09.05.23.
//

import UIKit
import SnapKit

class WeatherHomeViewController: UIViewController {
    
    let locationLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        return imageView
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel(fontName: Fonts.overpassblack, fontSize: 24)
        label.text = "Бишкек"
        label.textColor = .white
        label.layer.shadowOpacity = 0.2
        label.layer.shadowRadius = 1
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: -2, height: 1)
        return label
    }()
    
    let downArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "downArrow"), for: .normal)
        return button
    }()
    
    let aleartBellButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "aleartBell"), for: .normal)
        return button
    }()
    
    let vectorLeftImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vectorLeft")
        return imageView
    }()
    
    let vectorRightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vectorRight")
        return imageView
    }()
    
    let sunImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sunImage")
        return imageView
    }()
    
    lazy var weekWeatherButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Прогноз на неделю", for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.overpassRegular, size: 16)
        button.setImage(UIImage(named: "upArrow"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.semanticContentAttribute = .forceRightToLeft
        button.addTarget(self, action: #selector(weekWeatherButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(hexString: "#4B93FD").cgColor, UIColor(hexString: "#47BBE1").cgColor]
        layer.frame = view.bounds
        return layer
    }()
    
    let weatherTodayView = WeatherTodayView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        print("WeatherHomeViewController is loaded")
    }
    
    // MARK: Setup Views
    func setupViews() {
        view.addSubview(locationLogo)
        view.addSubview(cityLabel)
        view.addSubview(downArrowButton)
        view.addSubview(aleartBellButton)
        view.addSubview(vectorLeftImage)
        view.addSubview(vectorRightImage)
        view.addSubview(sunImage)
        view.addSubview(weekWeatherButton)
        view.layer.addSublayer(gradientLayer)
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.addSubview(weatherTodayView)
    }
    
    @objc func weekWeatherButtonTapped() {
        let weatherForWeekViewController = WeatherForWeekViewController()
        navigationController?.pushViewController(weatherForWeekViewController, animated: true)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        locationLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 61))
            make.leading.equalToSuperview().offset(hAdapted(to: 34))
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLogo.snp.top)
            make.leading.equalTo(locationLogo.snp.trailing).offset(hAdapted(to: 20))
        }
        
        downArrowButton.snp.makeConstraints { make in
            make.leading.equalTo(cityLabel.snp.trailing).offset(hAdapted(to: 20))
            make.centerY.equalTo(cityLabel.snp.centerY)
        }
        
        aleartBellButton.snp.makeConstraints { make in
            make.top.equalTo(locationLogo.snp.top)
            make.trailing.equalToSuperview().offset(-25)
        }
        
        vectorLeftImage.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(hAdapted(to: 90))
        }
        
        vectorRightImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        sunImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(vAdapted(to: 100))
        }
        
        weatherTodayView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(sunImage.snp.bottom).offset(vAdapted(to: 18))
            make.size.equalTo(resized(width: 330, height: 320))
        }
        
        weekWeatherButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(resized(width: 260, height: 64))
            make.top.equalTo(weatherTodayView.snp.bottom).offset(vAdapted(to: 36))
        }
    }
}
