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
    
    override init() {
        super.init()
        self.backgroundColor = .white
    }
    
    internal override func addSubviews() {
        let subviews = [LocationsTableView]
        subviews.forEach { subview in self.addSubview(subview) }
    }
    
    internal override func anchorSubviews() {
        LocationsTableView.setTopAnchor(to: self.topAnchor, withPadding: EdgePadding)
        LocationsTableView.setBottomAnchor(to: self.bottomAnchor)
        LocationsTableView.setLeadingAnchor(to: self.leadingAnchor, withPadding: EdgePadding)
        LocationsTableView.setTrailingAnchor(to: self.trailingAnchor, withPadding: EdgePadding)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

