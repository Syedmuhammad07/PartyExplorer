//
//  ViewController.swift
//  PartyExplorer
//
//  Created by Syed Muhammad on 04/12/2023.
//

import UIKit

class PartyViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var partyTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - Properties
    var filteredParties: [Party] = []
    var isFiltering: Bool {
        return !(searchBar.text?.isEmpty ?? true)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PartyDataManager.initializeAppData()
        
        partyTableView.delegate = self
        partyTableView.dataSource = self
        partyTableView.register(UINib(nibName: "PartyCell", bundle: nil), forCellReuseIdentifier: "PartyCell")
        searchBar.placeholder = "Search by party name"
        searchBar.delegate = self
    }
    
    //MARK: - Actions
    @IBAction func createNewParty(_ sender: Any) {
        PartyDataManager.appendNewParty()
        partyTableView.reloadData()
    }
    
    
}

extension PartyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredParties.count
        }
        return PartyDataManager.allParties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = 
        tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as! PartyCell
        
        let party: Party
        if isFiltering {
            party = filteredParties[indexPath.row]
        } else {
            party = PartyDataManager.allParties[indexPath.row]
        }
        
        cell.partyCellVM = party
        
        return cell
    }
    
}

extension PartyViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredParties = PartyDataManager.allParties.filter { party in
            return party.name.lowercased().contains(searchText.lowercased())
        }
        
        partyTableView.reloadData()
    }
    
}


