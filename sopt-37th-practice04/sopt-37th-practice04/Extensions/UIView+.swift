//
//  UIView+.swift
//  sopt-37th-practice04
//
//  Created by JIN on 11/21/25.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
