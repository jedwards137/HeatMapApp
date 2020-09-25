//
//  LocationsViewController.swift
//  TravelHeat
//
//  Created by Jake Edwards on 9/25/20.
//

import UIKit

class LocationsViewController: UIViewControllerBase, UITableViewDelegate, UITableViewDataSource {
    private var PageView = LocationsPageView()

    override func setupNavBar() {
        super.setupNavBar()
        self.title = "Travel Heat"
        
        NotificationCenter.default.addObserver(self, selector: #selector(newLocationAdded(_:)), name: .newLocationSaved, object: nil)
    }
    
    internal override func setupPageView() {
        self.view.addSubview(self.PageView)
        self.PageView.setTopAnchor(to: self.view.safeAreaLayoutGuide.topAnchor)
        self.PageView.setBottomAnchor(to: self.view.bottomAnchor)
        self.PageView.setLeadingAnchor(to: self.view.leadingAnchor)
        self.PageView.setTrailingAnchor(to: self.view.trailingAnchor)
    }
    
    internal override func setupPageViewChildren() {
        self.PageView.LocationsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.PageView.LocationsTableView.dataSource = self
        self.PageView.LocationsTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let location = LocationsStore.shared.Locations[indexPath.row]
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.text = location.description
        cell.detailTextLabel?.text = location.dateString
        return cell
    }
    
    @objc func newLocationAdded(_ notification: Notification) {
        self.PageView.LocationsTableView.reloadData()
    }
}

