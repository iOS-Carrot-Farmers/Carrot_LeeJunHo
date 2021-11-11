//
//  CustomTopBar.swift
//  CarrotMarket_CloneCoding
//
//  Created by Junho Lee on 2021/11/10.
//

import UIKit

class CustomTopBar: UIView {
    
    public var delegate: CustomTopBarDelegate?
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    func customInit() {
        if let view = Bundle.main.loadNibNamed("CustomTopBar", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.delegate?.touchUpToGoBack()
    }
}

protocol CustomTopBarDelegate {
    func touchUpToGoBack()
}

