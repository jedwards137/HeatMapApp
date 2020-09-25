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
    }
    
    internal override func setupPageView() {
        self.view.addSubview(PageView)
        PageView.setTopAnchor(to: self.view.safeAreaLayoutGuide.topAnchor)
        PageView.setBottomAnchor(to: self.view.bottomAnchor)
        PageView.setLeadingAnchor(to: self.view.leadingAnchor)
        PageView.setTrailingAnchor(to: self.view.trailingAnchor)
    }
    
    internal override func setupPageViewChildren() {
        PageView.LocationsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        PageView.LocationsTableView.dataSource = self
        PageView.LocationsTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let location = LocationsStorage.shared.locations[indexPath.row]
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.text = location.description
        cell.detailTextLabel?.text = location.dateString
        return cell
    }
}

