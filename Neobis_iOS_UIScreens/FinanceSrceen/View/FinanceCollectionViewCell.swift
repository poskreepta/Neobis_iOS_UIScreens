//
//  FinanceCollectionViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 15.05.23.
//

import UIKit

class FinanceCollectionViewCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
   
    let viewColor: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.contentMode = .center
        view.clipsToBounds = true
        return view
    }()

    let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.interMedium, size: 16)
        return label
    }()
    
    let moneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.interBold, size: 14)
        label.textAlignment = .right
        return label
    }()
    
    let spentCategoryLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0.5
        label.textColor = .black
        label.font = UIFont(name: Fonts.interRegular, size: 14)
        label.textAlignment = .right
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        backgroundColor = .clear
        viewColor.addSubview(image)
        addSubview(categoryLabel)
        addSubview(moneyLabel)
        addSubview(spentCategoryLabel)
        addSubview(separatorView)
        addSubview(viewColor)
    }
    
    func setupConstraints() {
        image.snp.makeConstraints { make in
            make.center.equalTo(viewColor.snp.center)
        }
        
        viewColor.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.leading.equalToSuperview().offset(16)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(viewColor.snp.top)
            make.leading.equalTo(viewColor.snp.trailing).offset(15)
        }
        
        moneyLabel.snp.makeConstraints { make in
            make.top.equalTo(viewColor.snp.top)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        spentCategoryLabel.snp.makeConstraints { make in
            make.trailing.equalTo(moneyLabel.snp.trailing)
            make.top.equalTo(moneyLabel.snp.bottom).offset(2)
        }
        
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalTo(categoryLabel.snp.leading)
            make.trailing.equalTo(spentCategoryLabel.snp.trailing)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
