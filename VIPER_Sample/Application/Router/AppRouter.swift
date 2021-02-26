//
//  AppRouter.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/26.
//

import UIKit

protocol AppWireframe: AnyObject {
    func showRepositorySearchResultView()
}

final class AppRouter {
    
    private let window: UIWindow
    
    private init(window: UIWindow) {
        self.window = window
    }
    
    static func assambleModules(window: UIWindow) -> AppPresentation {
        let router = AppRouter(window: window)
        let presenter = AppPresenter(router: router)
        
        return presenter
    }
}

extension AppRouter: AppWireframe {
    func showRepositorySearchResultView() {
        
    }
}

