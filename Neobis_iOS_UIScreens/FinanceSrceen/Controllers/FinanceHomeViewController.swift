//
//  HomeFinanceViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 15.05.23.
//

import UIKit

class FinanceHomeViewController: UIViewController {
    
    let cellId = "cellId"
    
    let financeSpendings = [Finance(image: "home", category: "Дом", spendings: "$321", purpose: "Продукты", color: UIColor(hexString: "#FFC328")),
                            Finance(image: "tag", category: "Покупки", spendings: "$574", purpose: "Одежда", color: UIColor(hexString: "#3C009E")),
                            Finance(image: "happy", category: "Транспорт", spendings: "$124", purpose: "Такси", color: UIColor(hexString: "#9CC741")),
                            Finance(image: "heart", category: "Здоровье", spendings: "$765", purpose: "Лечение", color: UIColor(hexString: "#C141CC")),
                            Finance(image: "cookie", category: "Фитнес", spendings: "$324", purpose: "Тренировки", color: UIColor(hexString: "#1F86FF")),
                            Finance(image: "mail", category: "Счета", spendings: "$726", purpose: "Комунальные", color: UIColor(hexString: "#21C0E3")),
                            Finance(image: "heart", category: "Ресторан", spendings: "$325", purpose: "Ужин", color: UIColor(hexString: "#C141CC"))]
    
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.interSemibold, size: 16)
        label.textAlignment = .center
        label.text = "Баланс"
        return label
    }()
    
    let amountBalanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.interMedium, size: 36)
        label.textAlignment = .center
        label.text = "$1200.89"
        return label
    }()
    
    let monthYearLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.interLight, size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.92
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "Апрель 2020", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    let rightArrowButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(named: "rightArrow"), for: .normal)
        return button
    }()
    
    let leftArrowButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(named: "rightArrow"), for: .normal)
        button.transform = CGAffineTransform(scaleX: -1, y: 1)
        return button
    }()
    
    let seeMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("См. Еще", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: Fonts.interRegular, size: 16)
        return button
    }()
    
    lazy var financeCollectionView: UICollectionView = {
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
        financeCollectionView.register(FinanceCollectionViewCell.self, forCellWithReuseIdentifier: cellId)

    }
    
    func setupViews() {
        view.addSubview(balanceLabel)
        view.addSubview(amountBalanceLabel)
        view.addSubview(monthYearLabel)
        view.addSubview(rightArrowButton)
        view.addSubview(leftArrowButton)
        view.addSubview(seeMoreButton)
        view.addSubview(financeCollectionView)
    }
    
    func setupConstraints() {
        balanceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(vAdapted(to: 66))
        }
        
        amountBalanceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(balanceLabel.snp.bottom).offset(7)
        }
        
        monthYearLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(amountBalanceLabel.snp.bottom).offset(vAdapted(to: 30))
        }
        
        rightArrowButton.snp.makeConstraints { make in
            make.top.equalTo(monthYearLabel.snp.top)
            make.trailing.equalToSuperview().offset(-(hAdapted(to: 45)))
        }
        
        leftArrowButton.snp.makeConstraints { make in
            make.top.equalTo(monthYearLabel.snp.top)
            make.leading.equalToSuperview().offset(hAdapted(to: 45))
        }
        
        financeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(monthYearLabel.snp.bottom).offset(vAdapted(to: 50))
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalTo(seeMoreButton.snp.top).offset(vAdapted(to: -10))
        }
        
        seeMoreButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(vAdapted(to: -120))
            make.centerX.equalToSuperview()
        }
    }
}

extension FinanceHomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return financeSpendings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? FinanceCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.viewColor.backgroundColor = financeSpendings[indexPath.item].color
        cell.image.image = UIImage(named: financeSpendings[indexPath.item].image)
        cell.categoryLabel.text = financeSpendings[indexPath.item].category
        cell.moneyLabel.text = financeSpendings[indexPath.item].spendings
        cell.spentCategoryLabel.text = financeSpendings[indexPath.item].purpose
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return resized(width: collectionView.frame.width - 10, height: 55)
    }
}

