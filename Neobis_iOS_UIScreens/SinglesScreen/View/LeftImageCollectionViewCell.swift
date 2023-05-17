//
//  LeftImageCollectionViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 17.05.23.
//

import UIKit

class LeftImageCollectionViewCell: UICollectionViewCell {
    
    let namelabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.segoeUIRegular, size: 25)
        label.textAlignment = .center
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.segoeUIRegular, size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let nextArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(named: "right"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(namelabel)
        addSubview(descriptionLabel)
        addSubview(image)
        addSubview(nextArrowButton)
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(hexString: "#D3D3D3").cgColor
    }
    
    func setupConstraints() {
        nextArrowButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-26)
        }
        
        image.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
        }
        
        namelabel.snp.makeConstraints { make in
            make.bottom.equalTo(image.snp.centerY)
            make.leading.equalTo(image.snp.trailing).offset(36)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(namelabel.snp.bottom).offset(5)
            make.leading.equalTo(namelabel.snp.leading)
            make.trailing.equalTo(nextArrowButton.snp.leading).offset(-26)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
