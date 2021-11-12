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
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    @IBOutlet weak var customBottomBar: CustomBottomBar!
    @IBOutlet weak var customTopBar: CustomTopBar!
    
    @IBOutlet weak var bigSV: UIScrollView!
    
    var itemIndex : Int = 0
    var itemTVContentList : [ItemTVData] = []
    
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemImageSV.delegate = self
        customBottomBar.delegate = self
        customTopBar.delegate = self
        bigSV.delegate = self
        addContentScrollView()
        setPageControl()
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SetNavigationBar()
        itemPageControl.frame = CGRect(x: 50, y: 345,width: itemPageControl.bounds.width, height: itemPageControl.bounds.height)
        itemPageControl.center = CGPoint(x: self.view.frame.size.width/2, y:355)
        
    }
    
    func SetNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated:true)
        self.view.bringSubviewToFront(customBottomBar)
        customBottomBar.priceLabel.text = itemTVContentList[itemIndex].price
        self.tabBarController?.tabBar.isHidden = true
        self.view.bringSubviewToFront(customTopBar)
    }
    
    func setData() {
        itemLabel.text = itemTVContentList[itemIndex].item
        categoryLabel.text = itemTVContentList[itemIndex].category + " ・ " + itemTVContentList[itemIndex].time
        contentLabel.text = itemTVContentList[itemIndex].content
        viewsLabel.text = "조회 " + String(itemTVContentList[itemIndex].views)
        usernameLabel.text = "킹받아요"
        locationLabel.text = itemTVContentList[itemIndex].location
    }
    
    //스크롤뷰, 페이지컨트롤 부분
    
    func makeImage(imageName : String) -> UIImage? {
        return UIImage(named: imageName)
    }
    
    private func addContentScrollView() {
        for i in 0..<itemTVContentList[itemIndex].imageName.count {
            let imageView = UIImageView()
            let xPos = (self.view.frame.width) * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: self.view.frame.width, height: itemImageSV.bounds.height)
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
        
        if bigSV.panGestureRecognizer.velocity(in: bigSV).y < 0 {
            UIView.animate(withDuration: 1, animations: {
                if self.customTopBar.alpha < 1 {
                    self.customTopBar.alpha += 0.02
                }
            }, completion: nil)
        } else if bigSV.panGestureRecognizer.velocity(in: bigSV).y > 0 {
            UIView.animate(withDuration: 1, animations: {
                if self.customTopBar.alpha > 0  {
                    self.customTopBar.alpha -= 0.02
                }
            }, completion: nil)
        } else {
            print("stay")
        }
    }
}


