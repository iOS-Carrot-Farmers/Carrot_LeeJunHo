//
//  UIViewController + Extension.swift
//  CarrotMarket_CloneCoding
//
//  Created by Junho Lee on 2021/11/07.
//

import UIKit

extension UIViewController: CustomViewDelegate {
    func touchUpToGoLogin() {
        print("3")
    }
}

extension UIViewController: CustomBottomBarDelegate {
    func touchUpToGoChat() {
        print("3")
    }
}

extension UIViewController: CustomTopBarDelegate {
    func touchUpToGoBack() {
        self.navigationController?.popViewController(animated: false)
    }
}
