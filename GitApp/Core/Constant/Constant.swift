//
//  Constant.swift
//  GitApp
//
//  Created by Tiko on 10/30/20.
//

struct Constant {
    
    struct Network {
        static let per_page = 50
        
        // The most starred repositories created last 30 days
        // static let gitUrl = "https://api.github.com/search/repositories?q=created:%3E2020-10-09&sort=stars&per_page=\(per_page)"
        
        // The most starred repositories
        static let gitUrl = "https://api.github.com/search/repositories?q=stars%3A%3E100&s=stars&per_page=\(per_page)"
    }
}
