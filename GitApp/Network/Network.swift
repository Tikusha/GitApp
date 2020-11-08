//
//  FetchStar.swift
//  GitApp
//
//  Created by Tiko on 10/30/20.
//

import Foundation
import Alamofire

class Network {
    
    private init(){}
    static let manager = Network()
    
    func fetch(success: @escaping(RepositoryModal?) -> Void, fail: @escaping(Error) -> Void) {
        AF.request(Constant.Network.gitUrl).responseData { (response) in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let repos = try decoder.decode(RepositoryModal.self, from: data)
                    success(repos)
                } catch {
                    fail(error)
                }
            case .failure(let error):
                fail(error)
            }
        }
    }
}
