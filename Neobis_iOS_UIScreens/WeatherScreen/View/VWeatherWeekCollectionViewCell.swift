//
//  vWeatherWeekCollectionView.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 14.05.23.
//

import UIKit

class VWeatherWeekCollectionViewCell: UICollectionViewCell {
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: Fonts.overpassRegular, size: 18)
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.layer.position = label.center
        label.textColor = .white
        label.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        return label
    }()
    
    let weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cloud")
        return imageView
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: Fonts.overpassbold, size: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(temperatureLabel)
        addSubview(weatherImage)
        addSubview(dateLabel)
    }
    
    func setupConstraints() {
        temperatureLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        weatherImage.snp.makeConstraints { make in
            make.centerY.equalTo(temperatureLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
