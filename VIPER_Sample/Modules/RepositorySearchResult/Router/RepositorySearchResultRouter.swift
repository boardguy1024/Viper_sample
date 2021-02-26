//
//  RepositorySearchResultRouter.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/25.
//

import UIKit
 
protocol RepositorySearchResultWireframe: AnyObject {
    func showRepositoryDetail(_ repository: RepositoryEntity)
}

final class RepositorySearchResultRouter {
    
    // 画面遷移のためにViewControllerが必要
    // initで受け取る
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // DI
    static func assembleModules() -> UIViewController {
        let view = RepositorySearchResultViewController()
        let router = RepositorySearchResultRouter(viewController: view)
        let searchRepositoryInteractor = SearchRepositoryInteractor()
        
        // Presenterは View, Interctor, Router それぞれ必要なので
        // 生成し、initの引数で渡す
        let presenter = RepositorySearchResultPresenter(view: view, router: router, interactor: searchRepositoryInteractor)
        view.presenter = presenter
        
        return view
    }
}

// RouterのProtocolに準拠する
// 遷移する各画面ごとにメソッドを定義

extension RepositorySearchResultRouter: RepositorySearchResultWireframe {
    func showRepositoryDetail(_ repository: RepositoryEntity) {
        
        // 詳細画面のRouterに依存関係の解決を依頼
        
    }
}
