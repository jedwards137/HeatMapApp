//
//  UIViewBase.swift
//  HeatmapApp
//
//  Created by Jake Edwards on 2/24/20.
//  Copyright © 2020 Big Ahi Software. All rights reserved.
//

import Foundation
import UIKit

fileprivate protocol UIViewProtocol : UIView {
    func addSubviews()
    func anchorSubviews()
}

public class UIViewBase : UIView, UIViewProtocol {
    internal let EdgePadding : CGFloat = 10
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews()
        anchorSubviews()
    }
    
    func addSubviews() {
        fatalError("addSubviews not implemented")
    }
    
    func anchorSubviews() {
        fatalError("anchorSubviews not implemented")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
