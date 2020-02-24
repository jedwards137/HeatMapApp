//
//  LocationListView.swift
//  HeatmapApp
//
//  Created by Jake Edwards on 2/24/20.
//  Copyright © 2020 Big Ahi Software. All rights reserved.
//

import UIKit

class LocationListView: UIViewBase {
    private(set) var LocationsTable: UITableView = {
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
        let subviews = [LocationsTable]
        subviews.forEach { subview in self.addSubview(subview) }
    }
    
    internal override func anchorSubviews() {
        LocationsTable.setTopAnchor(to: self.topAnchor, withPadding: self.EdgePadding)
        LocationsTable.setBottomAnchor(to: self.bottomAnchor)
        LocationsTable.setLeadingAnchor(to: self.leadingAnchor, withPadding: self.EdgePadding)
        LocationsTable.setTrailingAnchor(to: self.trailingAnchor, withPadding: -self.EdgePadding)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
