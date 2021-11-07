//
//  HomeItemVC.swift
//  CarrotMarket_CloneCoding
//
//  Created by Junho Lee on 2021/11/07.
//

import UIKit

class HomeItemVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var itemImageSV: UIScrollView!
    @IBOutlet weak var itemPageControl: UIPageControl!
    
    var itemIndex : Int = 0
    var itemTVContentList : [ItemTVData] = []
    
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addContentScrollView()
        itemImageSV.delegate = self
        setPageControl()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SetNavigationBar()
    }
    
    func SetNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated:true)
    }
    
    func makeImage(imageName : String) -> UIImage? {
        return UIImage(named: imageName)
    }
    
    private func addContentScrollView() {
        for i in 0..<itemTVContentList[itemIndex].imageName.count {
            let imageView = UIImageView()
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: itemImageSV.bounds.width, height: itemImageSV.bounds.height)
            imageView.image = makeImage(imageName: itemTVContentList[itemIndex].imageName[i])
            itemImageSV.addSubview(imageView)
            itemImageSV.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
    }
    
    private func setPageControl() {
        itemPageControl.numberOfPages = itemTVContentList[itemIndex].imageName.count
    }
    private func setPageControlSelectedPage(currentPage:Int) {
        itemPageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = itemImageSV.contentOffset.x/itemImageSV.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
}
