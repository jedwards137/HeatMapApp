//
//  LocationsViewController.swift
//  Travel Heat
//
//  Created by Jake Edwards on 9/30/20.
//

import UIKit
import CoreLocation

class LocationsViewController: UIViewControllerBase, UITableViewDelegate, UITableViewDataSource {
    private var PageView = LocationsPageView()
    private let CellId = "cell"

    override func setupNavBar() {
        super.setupNavBar()
        self.title = "Travel Heat"
        
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateLocations(_:)), name: .didUpdateLocations, object: nil)
    }
    
    internal override func setupPageView() {
        self.view.addSubview(self.PageView)
        self.PageView.setTopAnchor(to: self.view.safeAreaLayoutGuide.topAnchor)
        self.PageView.setBottomAnchor(to: self.view.bottomAnchor)
        self.PageView.setLeadingAnchor(to: self.view.leadingAnchor)
        self.PageView.setTrailingAnchor(to: self.view.trailingAnchor)
    }
    
    internal override func setupPageViewChildren() {
        self.PageView.LocationsTableView.register(UITableViewCell.self, forCellReuseIdentifier: self.CellId)
        self.PageView.LocationsTableView.dataSource = self
        self.PageView.LocationsTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfLocations = LocationsStore.shared.Locations.count
        return numberOfLocations
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: self.CellId)
        let location = LocationsStore.shared.Locations[indexPath.row]
        cell.textLabel?.numberOfLines = 1
        cell.textLabel?.text = location.Description.getShortDescription()
        cell.detailTextLabel?.text = location.Date.toString()
        return cell
    }
    
    @objc func didUpdateLocations(_ notification: Notification) {
        self.PageView.LocationsTableView.reloadData()
    }
}
