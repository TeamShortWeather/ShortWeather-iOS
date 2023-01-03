//
//  UITableView +.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/03.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_ type: T.Type) {
        let className = type.className
        self.register(type.self, forCellReuseIdentifier: className)
    }
    
    func registerCells<T: UITableViewCell>(_ types: T.Type...) {
        types.forEach {
            registerCell($0)
        }
    }

    func dequeueCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}
