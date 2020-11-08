//
//  Repo.swift
//  GitApp
//
//  Created by Tiko on 10/31/20.
//

struct RepositoryModal: Codable {
    let items: [Repositories]
}

struct Repositories:Codable {
    let name: String?
    let fullName: String?
    let owner: Owner?
    let description: String?
    let stargazersCount: Int?
}

struct Owner: Codable {
    let login: String?
    let avatarUrl: String?
}

