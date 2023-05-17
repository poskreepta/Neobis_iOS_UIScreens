//
//  SinglesHomeViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 16.05.23.
//

import UIKit

class SinglesHomeViewController: UIViewController {
    
    var singles = [SinglesModel(name: "SOS", description: "Mini meltdown? Get some\nHeadspace in a hurry", image: "book"),
                   SinglesModel(name: "One-the-Go", description: "Mindful living? Get your \nHeadspace to go", image: "bookshelf"),
                   SinglesModel(name: "Classic", description: "Like it simple? Get some \nextra Headspace", image: "diploma"),
                   SinglesModel(name: "SOS", description: "Mini meltdown? Get some\nHeadspace in a hurry", image: "globus")]
    
    let cellIdRight = "cellIdRight"
    let cellIdLeft = "cellIdLeft"

    let singlesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.segoeUIRegular, size: 22)
        label.text = "Singles"
        return label
    }()
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        return button
    }()
    
    lazy var singlesCollectionView: UICollectionView = {
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
    }
    
    func setupViews() {
        view.addSubview(singlesLabel)
        view.addSubview(menuButton)
        view.addSubview(searchButton)
        view.addSubview(singlesCollectionView)
        singlesCollectionView.register(RightImageCollectionViewCell.self, forCellWithReuseIdentifier: cellIdRight)
        singlesCollectionView.register(LeftImageCollectionViewCell.self, forCellWithReuseIdentifier: cellIdLeft)
    }
    
    func setupConstraints() {
        singlesLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(vAdapted(to: 60))
        }
        
        menuButton.snp.makeConstraints { make in
            make.centerY.equalTo(singlesLabel.snp.centerY)
            make.leading.equalToSuperview().offset(28)
        }
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalTo(singlesLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-28)
        }
        
        singlesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(singlesLabel.snp.bottom).offset(vAdapted(to: 25))
            make.trailing.equalToSuperview().offset(hAdapted(to: -10))
            make.leading.equalToSuperview().offset(hAdapted(to: 10))
            make.bottom.equalToSuperview()
        }
    }
}

extension SinglesHomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        singles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item % 2 == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdRight, for: indexPath) as? RightImageCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.namelabel.text = singles[indexPath.item].name
            cell.descriptionLabel.text = singles[indexPath.item].description
            cell.image.image = UIImage(named: singles[indexPath.item].image)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdLeft, for: indexPath) as? LeftImageCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.namelabel.text = singles[indexPath.item].name
            cell.descriptionLabel.text = singles[indexPath.item].description
            cell.image.image = UIImage(named: singles[indexPath.item].image)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return resized(width: view.frame.width, height: vAdapted(to: 170))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
