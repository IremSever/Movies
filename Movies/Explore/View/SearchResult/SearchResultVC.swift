//
//  SearchResultVC.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//


import UIKit

class SearchResultVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableViewSearchResult: UITableView!
    
    
    var filteredExplores = [ExploreDataClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSearchResult.delegate = self
        tableViewSearchResult.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredExplores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreNewsViewCell", for: indexPath) as! ExploreNewsViewCell
        let explore = filteredExplores[indexPath.row]
        
        
        cell.setExploreNewsWithValuesOf(explore)
        
        return cell
    }
}
