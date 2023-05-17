//
//  HomeCryptoViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 14.05.23.
//

import UIKit

class CryptoHomeViewController: UIViewController {
    
    let cellId = "cellId"
    let cryptoCoins = [Crypto(nameCoin: "Bitcoin", percentage: "+1.6%", priceUsd: "$29,850.15", priceCoin: "2.73 BTC", color: UIColor(hexString: "#FEEDEC")),
                       Crypto(nameCoin: "Ethereum", percentage: "-0.82%", priceUsd: "$10,561.24", priceCoin: "47.61 ETH", color: UIColor(hexString: "#EFF1F9")),
                       Crypto(nameCoin: "Litecoin", percentage: "-2.10", priceUsd: "$3,676.24", priceCoin: "39.27 LTC", color: UIColor(hexString: "#EAFCF6")),
                       Crypto(nameCoin: "Ripple", percentage: "+0.27%", priceUsd: "$5,241.62", priceCoin: "16447,65 XPR", color: UIColor(hexString: "#EFF4FF")),
                       Crypto(nameCoin: "Ripple", percentage: "+0.27%", priceUsd: "$5,241.62", priceCoin: "16447,65 XPR", color: UIColor(hexString: "#EFF4FF")),
                       Crypto(nameCoin: "Ripple", percentage: "+0.27%", priceUsd: "$5,241.62", priceCoin: "16447,65 XPR", color: UIColor(hexString: "#EFF4FF"))]
    
    let portfolioLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Портфолио"
        label.font = UIFont(name: Fonts.segoeUIBold, size: 32)
        return label
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "settings"), for: .normal)
        return button
    }()
    
    let seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("посмотреть все", for: .normal)
        button.tintColor = UIColor(hexString: "#F6543E")
        button.titleLabel?.font = UIFont(name: Fonts.segoeUIRegular, size: 14)
        return button
    }()
    
    lazy var cryptoCollectionView: UICollectionView = {
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
        cryptoCollectionView.register(CryptoCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func setupViews() {
        view.addSubview(portfolioLabel)
        view.addSubview(settingsButton)
        view.addSubview(seeAllButton)
        view.addSubview(cryptoCollectionView)
    }
    
    func setupConstraints() {
        portfolioLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 79))
            make.leading.equalToSuperview().offset(hAdapted(to: 28))
        }
        
        settingsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 84))
            make.trailing.equalToSuperview().offset((hAdapted(to: -28)))
        }
        
        seeAllButton.snp.makeConstraints { make in
            make.top.equalTo(settingsButton.snp.bottom).offset(vAdapted(to: 40))
            make.trailing.equalToSuperview().offset((hAdapted(to: -28)))
        }
        
        cryptoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(seeAllButton.snp.bottom).offset(vAdapted(to: 10))
            make.trailing.equalToSuperview().offset(hAdapted(to: -20))
            make.leading.equalToSuperview().offset(hAdapted(to: 20))
            make.bottom.equalToSuperview().offset(vAdapted(to: -10))
        }
    }
}

extension CryptoHomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cryptoCoins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CryptoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        
        cell.viewColor.backgroundColor = cryptoCoins[indexPath.item].color
        cell.imageCoin.image = UIImage(named: cryptoCoins[indexPath.item].nameCoin)
        cell.nameCoinLabel.text = cryptoCoins[indexPath.item].nameCoin
        cell.percentageLabel.text = cryptoCoins[indexPath.item].percentage
        cell.priceUsdLabel.text = cryptoCoins[indexPath.item].priceUsd
        cell.priceCoinLabel.text = cryptoCoins[indexPath.item].priceCoin
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return resized(width: collectionView.frame.width, height: collectionView.frame.height / 7)
    }
    
    
}
