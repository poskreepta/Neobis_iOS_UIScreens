//
//  CustomUILabel.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 10.05.23.
//

import UIKit

extension UILabel {
    
    convenience init(frame: CGRect, fontName: String, fontSize: CGFloat) {
        self.init()
        self.frame = frame
        self.font = UIFont(name: fontName, size: fontSize)
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleToFill

        
        configure()
    }
    
    private func configure() {
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

