//
//  WeatherForWeekViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 09.05.23.
//

import UIKit

class WeatherForWeekViewController: UIViewController {
    
    let hCellId = "cellId"
    let vCellId = "cellId1"
    
    var hWeatherHours = [Weather(temperature: "29°C", image: "sunLittle", dateTime: "15.00"),
                 Weather(temperature: "26°C", image: "cloudSuper", dateTime: "16.00"),
                 Weather(temperature: "24°C", image: "cloud", dateTime: "17.00"),
                 Weather(temperature: "23°C", image: "cloudMoon", dateTime: "18.00"),
                 Weather(temperature: "22°C", image: "cloudMoon", dateTime: "19.00"),
                 Weather(temperature: "40°C", image: "sunLittle", dateTime: "20.00")]
    
    var vWeatherDays = [Weather(temperature: "21°C", image: "thunderstorm", dateTime: "Апр,27"),
                 Weather(temperature: "22°C", image: "cloud", dateTime: "Апр,28"),
                 Weather(temperature: "34°C", image: "cloudMoon", dateTime: "Апр,29"),
                 Weather(temperature: "27°C", image: "cloudSuper", dateTime: "Апр,30"),
                 Weather(temperature: "32°C", image: "rain", dateTime: "Май,1"),
                 Weather(temperature: "40°C", image: "sunLittle", dateTime: "Май,2")]
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(hexString: "#4B93FD").cgColor, UIColor(hexString: "#47BBE1").cgColor]
        layer.frame = view.bounds
        return layer
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
    
    var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Назад", for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.overpassbold, size: 24)
        button.tintColor = .white
        return button
    }()
    
    var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "settings"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    var todayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: Fonts.overpassblack, size: 24)
        label.text = "Сегодня"
        return label
    }()
    
    var dateTodayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: Fonts.overpassRegular, size: 18)
        label.text = "Апр, 26"
        return label
    }()
    
    var thisWeekLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: Fonts.overpassblack, size: 24)
        label.text = "На этой неделе"
        return label
    }()
    
    var calendarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")
        return imageView
    }()
    
    lazy var hWeatherTodayCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cvv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cvv.layer.cornerRadius = 20
        cvv.dataSource = self
        cvv.delegate = self
        cvv.translatesAutoresizingMaskIntoConstraints = false
        return cvv
    }()
    
    lazy var vWeatherWeekCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cvv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cvv.layer.cornerRadius = 20
        cvv.dataSource = self
        cvv.delegate = self
        cvv.translatesAutoresizingMaskIntoConstraints = false
        return cvv
    }()
    
    var appNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.text = "AccuWeather"
        return label
    }()
    
    var appLogoImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        hWeatherTodayCollectionView.backgroundColor = .clear
        vWeatherWeekCollectionView.backgroundColor = .clear
        hWeatherTodayCollectionView.register(HWeatherTodayCollectionViewCell.self, forCellWithReuseIdentifier: hCellId)
        vWeatherWeekCollectionView.register(VWeatherWeekCollectionViewCell.self, forCellWithReuseIdentifier: vCellId)
    }
    
    func setupViews() {
        view.layer.addSublayer(gradientLayer)
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.addSubview(vectorLeftImage)
        view.addSubview(vectorRightImage)
        view.addSubview(backButton)
        view.addSubview(settingsButton)
        view.addSubview(todayLabel)
        view.addSubview(dateTodayLabel)
        view.addSubview(thisWeekLabel)
        view.addSubview(calendarImage)
        view.addSubview(appLogoImage)
        view.addSubview(appNameLabel)
        view.addSubview(hWeatherTodayCollectionView)
        view.addSubview(vWeatherWeekCollectionView)
    }
    
    func setupConstraints() {
        vectorLeftImage.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(hAdapted(to: 90))
        }
        
        vectorRightImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 70))
            make.leading.equalToSuperview().offset(hAdapted(to: 20))
        }
        
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top).offset(2)
            make.trailing.equalToSuperview().offset((hAdapted(to: -20)))
        }
        
        todayLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(vAdapted(to: 50))
            make.leading.equalTo(backButton.snp.leading)
        }
        
        dateTodayLabel.snp.makeConstraints { make in
            make.trailing.equalTo(settingsButton.snp.trailing)
            make.bottom.equalTo(todayLabel.snp.bottom)
        }
        
        thisWeekLabel.snp.makeConstraints { make in
            make.top.equalTo(hWeatherTodayCollectionView.snp.bottom).offset(vAdapted(to: 20))
            make.leading.equalTo(todayLabel.snp.leading)
        }
        
        calendarImage.snp.makeConstraints { make in
            make.top.equalTo(thisWeekLabel.snp.top)
            make.trailing.equalTo(settingsButton.snp.trailing)
        }
        
        hWeatherTodayCollectionView.snp.makeConstraints { make in
            make.top.equalTo(todayLabel.snp.bottom).offset(vAdapted(to: 20))
            make.width.equalToSuperview()
            make.height.equalTo(155)
        }

        vWeatherWeekCollectionView.snp.makeConstraints { make in
            make.top.equalTo(thisWeekLabel.snp.bottom).offset(vAdapted(to: 20))
            make.width.equalToSuperview()
            make.height.equalTo(294)
        }
        appNameLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-25)
            make.trailing.equalToSuperview().offset(-130)
        }
        appLogoImage.snp.makeConstraints { make in
            make.bottom.equalTo(appNameLabel.snp.bottom).offset(-3)
            make.trailing.equalTo(appNameLabel.snp.leading).offset(-10)
        }
    }

    
}

extension WeatherForWeekViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.hWeatherTodayCollectionView {
            return hWeatherHours.count
        } else if collectionView == self.vWeatherWeekCollectionView {
            return vWeatherDays.count
          }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.hWeatherTodayCollectionView {
            guard let cell = hWeatherTodayCollectionView.dequeueReusableCell(withReuseIdentifier: hCellId, for: indexPath) as? HWeatherTodayCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.temperatureLabel.text = hWeatherHours[indexPath.item].temperature
            cell.weatherImage.image = UIImage(named: hWeatherHours[indexPath.item].image)
            cell.dateLabel.text = hWeatherHours[indexPath.item].dateTime
            return cell
        } else if collectionView == vWeatherWeekCollectionView {
            guard let cell = vWeatherWeekCollectionView.dequeueReusableCell(withReuseIdentifier: vCellId, for: indexPath) as? VWeatherWeekCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.temperatureLabel.text = vWeatherDays[indexPath.item].temperature
            cell.weatherImage.image = UIImage(named: vWeatherDays[indexPath.item].image)
            cell.dateLabel.text = vWeatherDays[indexPath.item].dateTime
            return cell
        }
        return UICollectionViewCell()

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == hWeatherTodayCollectionView {
            return resized(width: 70, height: 150)
              } else if collectionView == vWeatherWeekCollectionView {
                  // return the size for hWeatherWeekCollectionView
                  return resized(width: collectionView.frame.width, height: collectionView.frame.height / 6)
              }
        return CGSize.zero
    }
     
}
