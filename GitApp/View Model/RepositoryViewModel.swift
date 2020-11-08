//
//  RepositoryViewModel.swift
//  GitApp
//
//  Created by Tiko on 10/31/20.
//

import Foundation

class RepositoryViewModel: NSObject {
    
    // MARK: - Properties
    var repoData: RepositoryModal! {
        didSet {
            self.bindRepository()
        }
    }
    
    override init() {
        super.init()
        self.loadData()
    }
    
    var bindRepository : (() -> Void) = {}
    
    func loadData() {
        Network.manager.fetch { (data) in
            self.repoData = data
        } fail: { (error) in
            print(error)
        }
    }
}
