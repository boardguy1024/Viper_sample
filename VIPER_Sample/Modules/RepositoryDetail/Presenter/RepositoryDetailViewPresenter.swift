//
//  RepositoryDetailViewPresenter.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/26.
//

import Foundation

protocol RepositoryDetailViewPresentation: class {
    func viewDidLoad()
}

final class RepositoryDetailViewPresenter {
    
    private weak var view: RepositoryDetailView?
    private let router: RepositoryDetailWireframe
    private let repository: RepositoryEntity
    
    init(view: RepositoryDetailView, router: RepositoryDetailWireframe, repository: RepositoryEntity) {
        self.view = view
        self.router = router
        self.repository = repository
    }
}

extension RepositoryDetailViewPresenter: RepositoryDetailViewPresentation {
    func viewDidLoad() {
        view?.load(request: URLRequest(url: repository.htmlURL))
    }
}
