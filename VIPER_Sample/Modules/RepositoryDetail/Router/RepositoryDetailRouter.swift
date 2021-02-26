//
//  RepositoryDetailRouter.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/26.
//

import UIKit

protocol RepositoryDetailWireframe: class {
    
}

final class RepositoryDetailRouter {
    
    private unowned let viewController: UIViewController

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules(repository: RepositoryEntity) -> UIViewController {
        let view = RepositoryDetailViewController()
        let router = RepositoryDetailRouter(viewController: view)
        let presenter = RepositoryDetailViewPresenter(view: view, router: router, repository: repository)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryDetailRouter: RepositoryDetailWireframe { }
