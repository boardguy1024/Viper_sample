//
//  RepositorySearchResultViewController.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/25.
//

import UIKit

protocol RepositorySearchResultView: AnyObject {
    func updateRepositories(_ repositories: [RepositoryEntity])
    func showErrorAlert()
}

final class RepositorySearchResultViewController: UITableViewController {
    
    // Presenterへのアクセスはprotocolを介して行う
    var presenter: RepositorySearchResultPresentation!
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "リポジトリ名を入力..."
        searchBar.delegate = self
        return searchBar
    }()
    
    private var repositories: [RepositoryEntity] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData() // 画面の更新
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = searchBar
        tableView.register(RepositoryCell.self)
        clearsSelectionOnViewWillAppear = true
    }
}

// ViewのProtocolに準拠する
extension RepositorySearchResultViewController: RepositorySearchResultView {
    func updateRepositories(_ repositories: [RepositoryEntity]) {
        self.repositories = repositories
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "ネットワークエラー", message: "しばらく時間を置いてから再度お試しください", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension RepositorySearchResultViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setRepository(repositories[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Presenterにイベント通知
        presenter.didSelect(repository: repositories[indexPath.row])
    }
}

extension RepositorySearchResultViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        // Presenterにイベント通知
        presenter.searchButtonDidPush(searchText: text)
        
        searchBar.resignFirstResponder()
    }
}
