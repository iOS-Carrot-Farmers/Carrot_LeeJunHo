//
//  CustomBottomBar.swift
//  CarrotMarket_CloneCoding
//
//  Created by Junho Lee on 2021/11/08.
//

import UIKit

class CustomBottomBar: UIView {

    public var delegate: CustomBottomBarDelegate?
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    func customInit() {
        if let view = Bundle.main.loadNibNamed("CustomBottomBar", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
    
    @IBAction func tapToGoChat(_ sender: Any) {
        self.delegate?.touchUpToGoChat()
    }
}

protocol CustomBottomBarDelegate {
    func touchUpToGoChat()
}
