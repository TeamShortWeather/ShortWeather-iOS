//
//  UICollectionView +.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/03.
//

import UIKit

extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(_ type: T.Type) {
        let className = type.className
        self.register(type.self, forCellWithReuseIdentifier: className)
    }

    func registerCells<T: UICollectionViewCell>(_ types: T.Type...) {
        types.forEach {
            registerCell($0)
        }
    }
    /*
    func registerReusableView<T: UICollectionReusableView>(type: T.Type, kind: String = UICollectionElementKindSectionHeader) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        registerNib(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }

    func registerReusableViews<T: UICollectionReusableView>(types: [T.Type], kind: String = UICollectionElementKindSectionHeader) {
        types.forEach { registerReusableView($0, kind: kind) }
    }
*/
    func dequeueCell<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }

//    func dequeueReusableView<T: UICollectionReusableView>(type: T.Type, indexPath: NSIndexPath, kind: String = UICollectionElementKindSectionHeader) -> T {
//        return dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: type.className, forIndexPath: indexPath) as! T
//    }
}
