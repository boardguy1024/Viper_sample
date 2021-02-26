//
//  UIView+extension.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/26.
//

import UIKit

extension UIView {
    
    static var className: String {
        return String(describing: self)
    }
    
    static func createNib(bundle: Bundle? = nil) -> UINib {
        return UINib(nibName: className, bundle: bundle)
    }
}
