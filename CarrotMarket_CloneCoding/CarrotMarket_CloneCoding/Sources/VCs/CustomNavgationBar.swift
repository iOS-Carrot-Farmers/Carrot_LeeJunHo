//
//  CustomNavgationBar.swift
//  CarrotMarket_CloneCoding
//
//  Created by Junho Lee on 2021/11/07.
//

import UIKit

class CustomNavigationBar: UIView {
    
    public var delegate: CustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    func customInit() {
        if let view = Bundle.main.loadNibNamed("CustomNavigationBar", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
    
    @IBAction func tapToShowList(_ sender: Any) {
        self.delegate?.touchUpToGoLogin()
    }
    
}

protocol CustomViewDelegate {
    func touchUpToGoLogin()
}
