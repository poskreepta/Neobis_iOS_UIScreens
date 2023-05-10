//
//  CustomUIImageView.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 10.05.23.
//

import UIKit

class CustomImageView: UIImageView {
    var imageName: String? {
        didSet {
            if let imageName = imageName {
                image = UIImage(named: imageName)
            } else {
                image = nil
            }
        }
    }

    init(imageName: String) {
        super.init(frame: .zero)
        self.imageName = imageName
        self.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: imageName) {
            self.image = image
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

