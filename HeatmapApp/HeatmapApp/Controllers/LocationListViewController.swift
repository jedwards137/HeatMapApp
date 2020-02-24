//
//  LocationListViewController.swift
//  HeatmapApp
//
//  Created by Jake Edwards on 2/24/20.
//  Copyright © 2020 Big Ahi Software. All rights reserved.
//

import UIKit

class LocationListViewController: UIViewControllerBase, UITableViewDelegate, UITableViewDataSource {
    private var PageView = LocationListView()
    
    override func setupNavBar() {
        super.setupNavBar()
        self.title = "My Locations"
    }
        
    override func setupPageView() {
        self.view.addSubview(PageView)
        PageView.setTopAnchor(to: self.view.safeAreaLayoutGuide.topAnchor)
        PageView.setBottomAnchor(to: self.view.bottomAnchor)
        PageView.setLeadingAnchor(to: self.view.leadingAnchor)
        PageView.setTrailingAnchor(to: self.view.trailingAnchor)
    }
    
    internal override func setupPageViewChildren() {
        PageView.LocationsTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        PageView.LocationsTable.dataSource = self
        PageView.LocationsTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(indexPath.row)"
        return cell
    }
}
