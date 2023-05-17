//
//  TravelCollectionViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 16.05.23.
//

import UIKit

class TravelCollectionViewCell: UICollectionViewCell {
    
    let cityImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(cityImage)
    }
    
    func setupConstraints() {
        cityImage.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
