//
//  TownVC.swift
//  CarrotMarket_CloneCoding
//
//  Created by Junho Lee on 2021/11/07.
//

import UIKit

class TownVC: UIViewController {


    @IBOutlet weak var customNavigationBar: CustomNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customNavigationBar.delegate = self
        SetNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func SetNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated:true)
    }
}
