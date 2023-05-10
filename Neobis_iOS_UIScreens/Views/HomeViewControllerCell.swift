//
//  HomeViewControllerCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 09.05.23.
//

import UIKit
import SnapKit

class HomeViewControllerCell: UICollectionViewCell {
        
    // MARK: Creating UI ELements Programmatically
    lazy var screenLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Setup Views
    func setupView() {
        addSubview(screenLabel)
        
    }
    
    
    // MARK: Setup Contstraints
    func setupConstraints() {
        
        screenLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading).offset(40)
        }
        
    }
    
}
