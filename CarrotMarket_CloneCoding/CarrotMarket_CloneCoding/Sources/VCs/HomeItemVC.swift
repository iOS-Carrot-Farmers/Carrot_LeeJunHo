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
        self.customTopBar.alphaV.alpha = 0.01
        self.customTopBar.motherView.backgroundColor = UIColor.clear
        self.customTopBar.backgroundColor = UIColor.clear
        self.bigSV.contentInsetAdjustmentBehavior = .never
    }
    
    func setData() {
        itemLabel.text = itemTVContentList[itemIndex].item
        categoryLabel.text = itemTVContentList[itemIndex].category + " ??? " + itemTVContentList[itemIndex].time
        contentLabel.text = itemTVContentList[itemIndex].content
        viewsLabel.text = "?????? " + String(itemTVContentList[itemIndex].views)
        usernameLabel.text = "????????????"
        locationLabel.text = itemTVContentList[itemIndex].location
    }
    
    //????????????, ?????????????????? ??????
    
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
            UIView.animate(withDuration: 0.01, animations: {
                self.customTopBar.alphaV.alpha = self.bigSV.contentOffset.y*0.004
                for i in 1...50 {
                    let time = i * 50
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(time)) {
                        self.customTopBar.alphaV.alpha = self.bigSV.contentOffset.y*0.004
                    }
                }
            }, completion: nil)
        } else if bigSV.panGestureRecognizer.velocity(in: bigSV).y > 0 {
            UIView.animate(withDuration: 0.01, animations: {
                self.customTopBar.alphaV.alpha = self.bigSV.contentOffset.y*0.004
                for i in 1...50 {
                    let time = i * 50
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(time)) {
                        self.customTopBar.alphaV.alpha = self.bigSV.contentOffset.y*0.004
                    }
                }
            }, completion: nil)
        } else {
            print("stay")
        }
    }
}
