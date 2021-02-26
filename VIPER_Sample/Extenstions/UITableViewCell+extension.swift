//
//  UITableViewCell+extension.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/26.
//

import UIKit

protocol Registrable where Self: UIView {
    static var reuseIdentifier: String { get }
}

extension Registrable {
    static var reuseIdentifier: String {
        return self.className
    }
}

protocol ClassRegistrable: Registrable { }

protocol NibRegistrable: Registrable {
    static var nib: UINib { get }
}

extension NibRegistrable {
    static var nib: UINib {
        let nibName = String(describing: self)
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
}
