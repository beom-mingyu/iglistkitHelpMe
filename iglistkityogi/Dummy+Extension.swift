//
//  Dummy+Extension.swift
//  iglistkityogi
//
//  Created by mingyu beom on 2020/12/01.
//

import Foundation
import UIKit

extension UIView{
    func fillWith(_ view: UIView, usingConstraints: Bool = true) {
        addSubview(view)
        if usingConstraints {
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: view.topAnchor),
                leftAnchor.constraint(equalTo: view.leftAnchor),
                rightAnchor.constraint(equalTo: view.rightAnchor),
                bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        } else {
            view.frame = bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
}
