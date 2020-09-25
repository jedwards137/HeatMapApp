//
//  UIPageViewBase.swift
//  TravelHeat
//
//  Created by Jake Edwards on 9/25/20.
//

import Foundation
import UIKit

fileprivate protocol UIPageViewProtocol : UIView {
    func addSubviews()
    func anchorSubviews()
}

public class UIPageViewBase : UIView, UIPageViewProtocol {
    internal let EdgePadding : CGFloat = 10
    internal let FieldHeight : CGFloat = 60
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false;
        
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
