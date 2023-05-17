//
//  WeatherHomeView.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 09.05.23.
//

import UIKit

class WeatherTodayView: UIView {
    
    let dateLabel: UILabel = {
        let label = UILabel(fontName: Fonts.overpassRegular, fontSize: 18)
        label.textColor = .white
        label.text = "Сегодня, 26 Апрель"
        label.layer.shadowOpacity = 0.3
        label.layer.shadowRadius = 8
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 1, height: 1)
        return label
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel(fontName: Fonts.overpassRegular, fontSize: 100)
        label.textColor = .white
        label.text = "22°"
        label.layer.shadowOpacity = 0.3
        label.layer.shadowRadius = 8
        label.shadowColor = .gray
        label.shadowOffset = CGSize(width: 1, height: 1)
        return label
    }()
    
    let weatherDescriptionLabel: UILabel = {
        let label = UILabel(fontName: Fonts.overpassbold, fontSize: 24)
        label.textColor = .white
        label.text = "Солнечно"
        label.layer.shadowOpacity = 0.3
        label.layer.shadowRadius = 8
        label.shadowColor = .gray
        label.shadowOffset = CGSize(width: 1, height: 1)
        return label
    }()
    
    let windImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wind")
        return imageView
    }()
    
    let windLabel: UILabel = {
        let label = UILabel(fontName: Fonts.overpassRegular, fontSize: 18)
        label.textColor = .white
        label.text = "Ветер"
        label.textAlignment = .left
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 8
        label.shadowColor = .lightGray
        label.shadowOffset = CGSize(width: -3, height: 1)
        return label
    }()
    
    let separatorWindLabel: UILabel = {
        let label = UILabel(fontName: Fonts.ralewayLight, fontSize: 18)
        label.textColor = .white
        label.text = "|"
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 8
        label.shadowColor = .lightGray
        label.shadowOffset = CGSize(width: -3, height: 1)
        return label
    }()
    
    let windSpeedLabel: UILabel = {
        let label = UILabel(fontName: Fonts.overpassRegular, fontSize: 18)
        label.textColor = .white
        label.text = "15 km/h"
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 8
        label.shadowColor = .lightGray
        label.shadowOffset = CGSize(width: -3, height: 1)
        return label
    }()
    
    let rainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "drop")
        return imageView
    }()
    
    let rainLabel: UILabel = {
        let label = UILabel(fontName: Fonts.overpassRegular, fontSize: 18)
        label.textColor = .white
        label.text = "Дождь"
        label.textAlignment = .left
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 8
        label.shadowColor = .lightGray
        label.shadowOffset = CGSize(width: -3, height: 1)
        return label
    }()
    
    let separatorRainLabel: UILabel = {
        let label = UILabel(fontName: Fonts.ralewayLight, fontSize: 18)
        label.textColor = .white
        label.text = "|"
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 8
        label.shadowColor = .lightGray
        label.shadowOffset = CGSize(width: -3, height: 1)
        return label
    }()
    
    let rainProbabilityLabel: UILabel = {
        let label = UILabel(fontName: Fonts.overpassRegular, fontSize: 18)
        label.textColor = .white
        label.text = "26 %"
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 8
        label.shadowColor = .lightGray
        label.shadowOffset = CGSize(width: -3, height: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4).cgColor
        layer.cornerRadius = 20
        layer.borderColor = UIColor(hexString: "#ffffff").cgColor
        setupViews()
        setupConstraints()
    }
    
   
    
    func setupViews() {
       addSubview(dateLabel)
        addSubview(temperatureLabel)
        addSubview(weatherDescriptionLabel)
        addSubview(windImage)
        addSubview(windLabel)
        addSubview(separatorWindLabel)
        addSubview(windSpeedLabel)
        addSubview(rainLabel)
        addSubview(rainImage)
        addSubview(separatorRainLabel)
        addSubview(rainProbabilityLabel)
    }
    
    func setupConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
        }
//
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview().offset(15)
        }
//
        weatherDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).inset(10)
            make.centerX.equalToSuperview()
        }
//
        windImage.snp.makeConstraints { make in
            make.top.equalTo(weatherDescriptionLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(47)
        }
//
        windLabel.snp.makeConstraints { make in
            make.top.equalTo(windImage.snp.top)
            make.leading.equalTo(windImage.snp.trailing).offset(20)
        }
//
        separatorWindLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(windImage.snp.top)
        }
//
        windSpeedLabel.snp.makeConstraints { make in
            make.top.equalTo(windImage.snp.top)
            make.leading.equalTo(separatorWindLabel.snp.trailing).offset(20)
        }

        rainImage.snp.makeConstraints { make in
            make.top.equalTo(windImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(50)
        }
//
        rainLabel.snp.makeConstraints { make in
            make.top.equalTo(rainImage.snp.top)
            make.leading.equalTo(rainImage.snp.trailing).offset(20)
        }
//
        separatorRainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rainImage.snp.top)
        }
        
        rainProbabilityLabel.snp.makeConstraints { make in
            make.top.equalTo(rainImage.snp.top)
            make.leading.equalTo(separatorRainLabel.snp.trailing).offset(20)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
