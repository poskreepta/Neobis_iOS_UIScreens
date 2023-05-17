//
//  CryptoCollectionViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 14.05.23.
//

import UIKit

class CryptoCollectionViewCell: UICollectionViewCell {
    
    let imageCoin: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let viewColor: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.contentMode = .center
        view.clipsToBounds = true
        view.sendSubviewToBack(view)
        return view
    }()
    
    let nameCoinLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.segoeUISemibold, size: 24)
        return label
    }()
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#AEB6CE")
        label.font = UIFont(name: Fonts.segoeUIRegular, size: 12)
        return label
    }()
    
    let priceUsdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.segoeUISemibold, size: 16)
        label.textAlignment = .right
        return label
    }()
    
    let priceCoinLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#AEB6CE")
        label.font = UIFont(name: Fonts.segoeUIRegular, size: 12)
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        backgroundColor = .clear
        viewColor.addSubview(imageCoin)
        addSubview(nameCoinLabel)
        addSubview(percentageLabel)
        addSubview(priceUsdLabel)
        addSubview(priceCoinLabel)
        addSubview(viewColor)
    }
    
    func setupConstraints() {
        imageCoin.snp.makeConstraints { make in
            make.center.equalTo(viewColor.snp.center)
        }
        
        viewColor.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.size.equalTo(CGSize(width: 57, height: 57))
            make.leading.equalToSuperview()
        }
        
        nameCoinLabel.snp.makeConstraints { make in
            make.top.equalTo(viewColor.snp.top)
            make.leading.equalTo(viewColor.snp.trailing).offset(12)
        }
        
        percentageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameCoinLabel.snp.bottom).offset(3)
            make.leading.equalTo(viewColor.snp.trailing).offset(12)
        }
        
        priceUsdLabel.snp.makeConstraints { make in
            make.bottom.equalTo(nameCoinLabel.snp.bottom)
            make.trailing.equalToSuperview()
        }
        
        priceCoinLabel.snp.makeConstraints { make in
            make.bottom.equalTo(percentageLabel.snp.bottom)
            make.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
