//
//  RepositoryTableViewData.swift
//  GitApp
//
//  Created by Tiko on 10/31/20.
//

import Foundation
import UIKit

class RepositorySetData<cellRepo: UITableViewCell, T>: NSObject, UITableViewDataSource {
    
    private var identifier : String?
    private var repositories : [T]?
    var configCell : (cellRepo,T) -> Void = {_,_ in }
    
    
    init(identifier : String, repositories : [T], configureCell : @escaping (cellRepo, T) -> Void) {
        self.identifier = identifier
        self.repositories =  repositories
        self.configCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.repositories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier ?? "", for: indexPath) as? cellRepo
        let repo = self.repositories?[indexPath.row]
        if let repo = repo, let cell = cell {
            self.configCell(cell, repo)
        }
        return cell!
    }
}


