//
//  SearchRepositoryInteractor.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/25.
//

import Foundation

protocol SearchRepositoryUsecase: AnyObject {
    
    func fetdhRepositories(keyword: String, completion: @escaping (Result<[RepositoryEntity], Error>) -> ())
}
final class SearchRepositoryInteractor {
    
    // GitHubに問い合わせるためのAPIクライアント
    // Interactorのテスト時にAPIクライアントをMOCKに差し替えて任意のレスポンスを返すようにするため
    private let client: GitHubRequestable
    
    init(client: GitHubRequestable = GitHubClient()) {
        self.client = client
    }
}

extension SearchRepositoryInteractor: SearchRepositoryUsecase {
    
    func fetdhRepositories(keyword: String, completion: @escaping (Result<[RepositoryEntity], Error>) -> ()) {
        let request = GitHubApi.SearchRepositories(keyword: keyword)
        client.send(request: request) { (result) in
            completion(result.map { $0.items })
        }
    }
    
    
}
