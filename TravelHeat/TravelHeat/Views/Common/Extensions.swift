//
//  Extensions.swift
//  TravelHeat
//
//  Created by Jake Edwards on 9/25/20.
//  Copyright © 2020 Big Ahi Software. All rights reserved.
//
import Foundation
import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

extension UIView {
    func setTopAnchor(to anchor: NSLayoutYAxisAnchor, withPadding padding: CGFloat = 0) {
        topAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
    }
    
    func setBottomAnchor(to anchor: NSLayoutYAxisAnchor, withPadding padding: CGFloat = 0) {
        bottomAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
    }
    
    func setLeadingAnchor(to anchor: NSLayoutXAxisAnchor, withPadding padding: CGFloat = 0) {
        leadingAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
    }
    
    func setTrailingAnchor(to anchor: NSLayoutXAxisAnchor, withPadding padding: CGFloat = 0) {
        trailingAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
    }
    
    func setCenterXAnchor(to anchor: NSLayoutXAxisAnchor) {
        centerXAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    func setCenterYAnchor(to anchor: NSLayoutYAxisAnchor) {
        centerYAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    func setWidthAnchor(to width: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeightAnchor(to height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
