//
//  extendyBoid.swift
//  literally recreating calculator for some reason
//
//  Created by Gavin Craft on 5/18/21.
//

import UIKit
extension UIView{
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingBottom: CGFloat, paddingLeading: CGFloat, paddingtrailing: CGFloat, width: CGFloat? = nil, height: CGFloat? = nil){
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom{
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let leading = leading{
            self.leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
        if let trailing = trailing{
            self.trailingAnchor.constraint(equalTo: trailing, constant: -paddingtrailing).isActive = true
        }
        if let width = width{
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height{
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

