//
//  RepositoryDetailViewController.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/26.
//

import UIKit
import WebKit

protocol RepositoryDetailView: class {
    func load(request urlRequest: URLRequest)
}

final class RepositoryDetailViewController: UIViewController {
    
    var presenter: RepositoryDetailViewPresentation!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RepositoryDetailViewController: RepositoryDetailView {
    func load(request urlRequest: URLRequest) {
        webView.load(urlRequest)
    }
}
