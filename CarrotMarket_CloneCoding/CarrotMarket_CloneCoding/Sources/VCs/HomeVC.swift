//
//  HomeVC.swift
//  CarrotMarket_CloneCoding
//
//  Created by Junho Lee on 2021/11/07.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var customNavigationBar: CustomNavigationBar!
    
    @IBOutlet weak var ItemTV: UITableView!
    
    var ItemTVContentList: [ItemTVData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar.delegate = self
        registerXib()
        initItemTVContentList()
        ItemTV.delegate = self
        ItemTV.dataSource = self
    }
    
    func registerXib(){
        let xibTableViewName = UINib(nibName: ItemTVC.identifier, bundle: nil)
        ItemTV.register(xibTableViewName, forCellReuseIdentifier: ItemTVC.identifier)
    }
    
    func initItemTVContentList() {
        ItemTVContentList.append(contentsOf: [
            ItemTVData(item: "아이템명 1",location: "중랑구", imageName: ["searchIcon", "myAroundIcon"], time: "1시 5분", chats: 2, hearts: 3, price: "10,000원", content: "팝니다 팔아요", views: 132, category: "잡화"),
            ItemTVData(item: "아이템명 1",location: "중랑구", imageName: ["searchIcon", "myAroundIcon"], time: "1시 5분", chats: 2, hearts: 3, price: "10,000원", content: "팝니다 팔아요", views: 132, category: "잡화"),
            ItemTVData(item: "아이템명 1",location: "중랑구", imageName: ["searchIcon", "myAroundIcon"], time: "1시 5분", chats: 2, hearts: 3, price: "10,000원", content: "팝니다 팔아요", views: 132, category: "잡화"),
            ItemTVData(item: "아이템명 1",location: "중랑구", imageName: ["searchIcon", "myAroundIcon"], time: "1시 5분", chats: 2, hearts: 3, price: "10,000원", content: "팝니다 팔아요", views: 132, category: "잡화"),
            ItemTVData(item: "아이템명 1",location: "중랑구", imageName: ["searchIcon", "myAroundIcon"], time: "1시 5분", chats: 2, hearts: 3, price: "10,000원", content: "팝니다 팔아요", views: 132, category: "잡화")
        ])
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 143
    }
}

extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemTVContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTVC.identifier) as? ItemTVC else {return UITableViewCell()}
        
        cell.setData(appData: ItemTVContentList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let homeItemSB = UIStoryboard.init(name: "HomeItemSB", bundle:nil)
        
        guard let nextVC = homeItemSB.instantiateViewController(identifier: "HomeItemVC") as? HomeItemVC else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated:true, completion:nil)
    }
}
