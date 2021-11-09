//
//  HomeVC.swift
//  CarrotMarket_CloneCoding
//
//  Created by Junho Lee on 2021/11/07.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var customNavigationBar: CustomNavigationBar!

    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var ItemTV: UITableView!
    
    var itemTVContentList: [ItemTVData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar.delegate = self
        registerXib()
        initItemTVContentList()
        ItemTV.delegate = self
        ItemTV.dataSource = self
        SetNavigationBar()
        tabBarController?.tabBar.isHidden = false
    }
    
    func registerXib(){
        let xibTableViewName = UINib(nibName: ItemTVC.identifier, bundle: nil)
        ItemTV.register(xibTableViewName, forCellReuseIdentifier: ItemTVC.identifier)
    }
    
    func initItemTVContentList() {
        itemTVContentList.append(contentsOf: [
            ItemTVData(item: "거베라",location: "관악구", imageName: ["1-1", "1-2","1-3","1-4"], time: "1시 5분", chats: 2, hearts: 3, price: "10,000원", content: "팝니다 팔아요. 뭐라고 해야 잘 팔릴지 모르겠어서 일단 분량만 채워둡니다. 쿠리보가 직접 판매하는 배터리 두개 엘지 무선청소기. 최은주가 부릅니다 래원의 느린심장박동", views: 132, category: "꽃"),
            ItemTVData(item: "수국 팔아요",location: "중랑구", imageName: ["2-1", "2-2", "2-3","2-4","2-5"], time: "2시 13분", chats: 2, hearts: 3, price: "5,000원", content: "팝니다 팔아요. 뭐라고 해야 잘 팔릴지 모르겠어서 일단 분량만 채워둡니다. 쿠리보가 직접 판매하는 배터리 두개 엘지 무선청소기. 최은주가 부릅니다 래원의 느린심장박동", views: 234, category: "꽃"),
            ItemTVData(item: "바나나 먹으면 나한테 바나나?",location: "중랑구", imageName: ["3-1", "3-2","3-3","3-4","3-5"], time: "3시 23분", chats: 2, hearts: 3, price: "40,000원", content: "팝니다 팔아요. 뭐라고 해야 잘 팔릴지 모르겠어서 일단 분량만 채워둡니다. 쿠리보가 직접 판매하는 배터리 두개 엘지 무선청소기. 최은주가 부릅니다 래원의 느린심장박동", views: 71, category: "음식"),
            ItemTVData(item: "특A등급 한우 스테이크",location: "강원도 횡성", imageName: ["4-1", "4-2","4-3","4-4","4-5","4-6"], time: "4시 15분", chats: 2, hearts: 3, price: "10,000원", content: "팝니다 팔아요. 뭐라고 해야 잘 팔릴지 모르겠어서 일단 분량만 채워둡니다. 쿠리보가 직접 판매하는 배터리 두개 엘지 무선청소기. 최은주가 부릅니다 래원의 느린심장박동", views: 3, category: "음식"),
            ItemTVData(item: "등산가실 분~ 오이 챙겨드립니다~!",location: "중랑구", imageName: ["5-1", "5-2","5-3"], time: "6시 27분", chats: 2, hearts: 3, price: "70,000원", content: "팝니다 팔아요. 뭐라고 해야 잘 팔릴지 모르겠어서 일단 분량만 채워둡니다. 쿠리보가 직접 판매하는 배터리 두개 엘지 무선청소기. 최은주가 부릅니다 래원의 느린심장박동", views: 42, category: "추억"),
            ItemTVData(item: "오늘 먹은 4가지 치즈맛 불닭볶음면",location: "중랑구", imageName: ["6-1", "6-2","6-3","6-4"], time: "8시 5분", chats: 2, hearts: 3, price: "120,000원", content: "팝니다 팔아요. 뭐라고 해야 잘 팔릴지 모르겠어서 일단 분량만 채워둡니다. 쿠리보가 직접 판매하는 배터리 두개 엘지 무선청소기. 최은주가 부릅니다 래원의 느린심장박동", views: 89, category: "잡화"),
            ItemTVData(item: "에어팟 1세대",location: "중랑구", imageName: ["7-1", "7-2","7-3"], time: "11시 45분", chats: 2, hearts: 3, price: "310,000원", content: "팝니다 팔아요. 뭐라고 해야 잘 팔릴지 모르겠어서 일단 분량만 채워둡니다. 쿠리보가 직접 판매하는 배터리 두개 엘지 무선청소기. 최은주가 부릅니다 래원의 느린심장박동", views: 132, category: "갓플"),
            ItemTVData(item: "불꽃놀이, 빛과 철의 도시 포항으로!",location: "중랑구", imageName: ["8-1", "8-2","8-3","8-4"], time: "13시 54분", chats: 2, hearts: 3, price: "110,000원", content: "팝니다 팔아요. 뭐라고 해야 잘 팔릴지 모르겠어서 일단 분량만 채워둡니다. 쿠리보가 직접 판매하는 배터리 두개 엘지 무선청소기. 최은주가 부릅니다 래원의 느린심장박동", views: 23, category: "추억"),
            ItemTVData(item: "킹받는 루피의 미소",location: "눈덮인 산속 마을", imageName: ["9-1", "9-2","9-3"], time: "15시 15분", chats: 2, hearts: 3, price: "35,000원", content: "팝니다 팔아요. 뭐라고 해야 잘 팔릴지 모르겠어서 일단 분량만 채워둡니다. 쿠리보가 직접 판매하는 배터리 두개 엘지 무선청소기. 최은주가 부릅니다 래원의 느린심장박동", views: 12, category: "사랑")
        ])
    }
    
    func SetNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated:true)
        self.view.bringSubviewToFront(plusButton)
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 143
    }
}

extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemTVContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTVC.identifier) as? ItemTVC else {return UITableViewCell()}
        
        cell.setData(appData: itemTVContentList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let homeItemSB = UIStoryboard.init(name: "HomeItemSB", bundle:nil)
        
        guard let nextVC = homeItemSB.instantiateViewController(identifier: "HomeItemVC") as? HomeItemVC else {return}
        
        //
        nextVC.itemIndex = indexPath.row
        nextVC.itemTVContentList = itemTVContentList
        
        // 화면전환
        nextVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
