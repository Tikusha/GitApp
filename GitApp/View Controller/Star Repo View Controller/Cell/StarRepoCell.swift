//
//  StarRepoCell.swift
//  GitApp
//
//  Created by Tiko on 10/30/20.
//

import UIKit

class StarRepoCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    
    // MARK: - View LifeCyrcle
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    // MARK: - Set Values
    func setCell(_ repository: Repositories?) {
        self.nameLabel.text = repository?.name
        self.descriptionLabel.text = repository?.description?.maxCharacters(length: 360)
        self.starLabel.text = "\(repository?.stargazersCount ?? 0)"
        self.authorLabel.text = repository?.owner?.login
        guard let avatarUrl = repository?.owner?.avatarUrl else { return }
        self.avatar.image = UIImage.setImage(avatarUrl)
    }
}

