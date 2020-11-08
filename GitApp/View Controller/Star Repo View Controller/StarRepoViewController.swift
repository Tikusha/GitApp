//
//  ViewController.swift
//  GitApp
//
//  Created by Tiko on 10/30/20.
//

import UIKit

class StarRepoViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loadingText: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    private var viewModel: RepositoryViewModel?
    private var dataRepository : RepositorySetData<StarRepoCell,Repositories>?
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.activityIndicatorLoading()
    }
    
    private func activityIndicatorLoading() {
        self.view.backgroundColor = .darkGray
        self.view.alpha = 0.2
        self.view.addSubview(self.activityIndicator)
        self.view.addSubview(self.loadingText)
        self.activityIndicator.startAnimating()
    }
    
    private func hidenLoading() {
        self.activityIndicator.hidesWhenStopped = true
        self.loadingText.isHidden = true
        self.view.alpha = 1
        self.view.backgroundColor = .black
        self.activityIndicator.stopAnimating()
        self.tableView.separatorStyle = .singleLine
    }
    
    private func setupData() {
        self.viewModel = RepositoryViewModel()
        guard let viewModel = self.viewModel else { return }
        viewModel.bindRepository = {
            self.updateData()
        }
    }
    
    private func updateData() {
        guard let viewModel = self.viewModel else { return }
        self.dataRepository = RepositorySetData(identifier: "StarRepoCell", repositories: viewModel.repoData.items, configureCell: { (cell, repo) in
            cell.setCell(repo)
        })
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.dataSource = self.dataRepository
            self.tableView.reloadData()
            self.hidenLoading()
        }
    }
}
