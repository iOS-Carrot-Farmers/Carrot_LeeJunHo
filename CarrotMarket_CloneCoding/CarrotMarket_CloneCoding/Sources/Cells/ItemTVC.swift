//
//  ItemTVC.swift
//  CarrotMarket_CloneCoding
//
//  Created by Junho Lee on 2021/11/07.
//

import UIKit

class ItemTVC: UITableViewCell {
    static let identifier = "ItemTVC"
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        itemImage.layer.cornerRadius = 10
    }
    
    func setData(appData: ItemTVData) {
        itemLabel.text = appData.item
        locationLabel.text = appData.location + " ・ " + appData.time
        priceLabel.text = appData.price
        itemImage.image = appData.makeImage()
    }
}
