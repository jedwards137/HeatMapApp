//
//  LocationsPageView.swift
//  TravelHeat
//
//  Created by Jake Edwards on 9/25/20.
//

import UIKit

class LocationsPageView : UIPageViewBase {
    private(set) var LocationsTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        return table
    }()
    var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init() {
        super.init()
        self.backgroundColor = .white
    }
    
    internal override func addSubviews() {
        let subviews = [LocationsTableView, button]
        subviews.forEach { subview in self.addSubview(subview) }
    }
    
    internal override func anchorSubviews() {
        LocationsTableView.setTopAnchor(to: self.topAnchor, withPadding: EdgePadding)
        LocationsTableView.setBottomAnchor(to: button.topAnchor)
        LocationsTableView.setLeadingAnchor(to: self.leadingAnchor, withPadding: EdgePadding)
        LocationsTableView.setTrailingAnchor(to: self.trailingAnchor, withPadding: EdgePadding)
        
        button.setHeightAnchor(to: 50)
        button.setBottomAnchor(to: self.bottomAnchor)
        button.setLeadingAnchor(to: self.leadingAnchor)
        button.setTrailingAnchor(to: self.trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

