//
//  AppPresenter.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/26.
//

import Foundation

protocol AppPresentation: AnyObject {
    func didFinishLaunch()
}
final class AppPresenter {
    private let router: AppWireframe
    
    init(router: AppWireframe) {
        self.router = router
    }
}

extension AppPresenter: AppPresentation {
    func didFinishLaunch() {
        router.showRepositorySearchResultView()
    }
}
