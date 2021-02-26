//
//  RepositorySearchResultPresenter.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/25.
//

import Foundation

protocol RepositorySearchResultPresentation: AnyObject {
    func searchButtonDidPush(searchText: String)
    func didSelect(repository: RepositoryEntity)
}

final class RepositorySearchResultPresenter {
    
    // View, Interactor, Routerへのアクセスは Protocolを介して行う
    // Viewは循環参照にならないよう'weak'プロパティ
    
    private weak var view: RepositorySearchResultView?
    private let router: RepositorySearchResultWireframe
    private let searchRepositoryInteractor: SearchRepositoryUsecase
    
    init(view: RepositorySearchResultView, router: RepositorySearchResultWireframe, interactor: SearchRepositoryUsecase) {
        self.view = view
        self.router = router
        self.searchRepositoryInteractor = interactor
    }
}

// Presenterのプロトコルに準拠する
extension RepositorySearchResultPresenter: RepositorySearchResultPresentation {
    func searchButtonDidPush(searchText: String) {
        guard !searchText.isEmpty else { return }
        
        // Interactorにデータ取得処理を依頼
        // @escaping がついているクロージャの場合は循環参照にならないよう｀[weak self]｀でキャプチャ
        searchRepositoryInteractor.fetdhRepositories(keyword: searchText) { [weak self] (result) in
            switch result {
            case .success(let repositories):
                self?.view?.updateRepositories(repositories)
            case .failure(_):
                self?.view?.showErrorAlert()
            }
        }
    }
    
    func didSelect(repository: RepositoryEntity) {
        router.showRepositoryDetail(repository)
    }
}
