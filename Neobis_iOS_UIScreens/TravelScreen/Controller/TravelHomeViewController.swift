//
//  TravelHomeViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 15.05.23.
//

import UIKit

class TravelHomeViewController: UIViewController {
    
    let cellId = "cellId"
    
    let cities = [TravelModel(image: "abu-Dhabi"), TravelModel(image: "san-Antonio"), TravelModel(image: "abu-Dhabi")]
    
    let firstLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.nanoSansMedium, size: 24)
        label.textAlignment = .center
        label.text = "Путешествуйте"
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.nanoSansMedium, size: 24)
        label.textAlignment = .center
        label.text = "Почувствуйте прилив энергии"
        return label
    }()
    
    let thirdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.nanoSansRegular, size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = "Мы поможем вам исследовать, сравнить и забронировать впечатления - все в одном месте."
        return label
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Куда хотите поехать?"
        searchBar.searchTextField.font = UIFont(name: Fonts.nanoSansRegular, size: 12)
        searchBar.delegate = self
        return searchBar
    }()
    
    lazy var travelCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cvv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cvv.dataSource = self
        cvv.delegate = self
        cvv.translatesAutoresizingMaskIntoConstraints = false
        return cvv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        travelCollectionView.register(TravelCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func setupViews() {
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(thirdLabel)
        view.addSubview(searchBar)
        view.backgroundColor = .white
        view.addSubview(travelCollectionView)
    }
    
    func setupConstraints() {
        firstLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(vAdapted(to: 58))
        }
        
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        thirdLabel.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(vAdapted(to: 12))
            make.leading.equalToSuperview().offset(hAdapted(to: 43))
            make.trailing.equalToSuperview().offset(hAdapted(to: -43))
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(thirdLabel.snp.bottom).offset(vAdapted(to: 10))
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(hAdapted(to: 20))
            make.trailing.equalToSuperview().offset(hAdapted(to: -20))
        }
        
        travelCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(vAdapted(to: 15))
            make.trailing.equalTo(searchBar.snp.trailing)
            make.leading.equalTo(searchBar.snp.leading)
            make.bottom.equalToSuperview().offset(vAdapted(to: -20))
        }
    }
}

extension TravelHomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? TravelCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.cityImage.image = UIImage(named: cities[indexPath.item].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return resized(width: travelCollectionView.frame.width - 10, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 28
    }
}

extension TravelHomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
