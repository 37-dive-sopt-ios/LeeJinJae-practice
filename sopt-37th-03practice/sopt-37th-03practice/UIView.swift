//
//  UIView.swift
//  sopt-37th-03practice
//
//  Created by JIN on 11/1/25.
//

import UIKit
import Foundation

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
}
