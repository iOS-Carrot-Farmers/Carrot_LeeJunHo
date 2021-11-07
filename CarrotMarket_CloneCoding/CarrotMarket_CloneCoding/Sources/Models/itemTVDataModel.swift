//
//  itemTVDataModel.swift
//  CarrotMarket_CloneCoding
//
//  Created by Junho Lee on 2021/11/07.
//

import UIKit

struct ItemTVData{
    
    // - Mark : 홈테이블뷰 변수들
    let item : String   //상품
    let location : String //지역
    var imageName: [String] = [] // 이미지이름
    let time : String // 시간
    let chats : Int // 채팅수
    let hearts : Int // 관심수
    let price : String // 가격
    
    // - Mark : 세부게시글 변수들
    let content : String // 글 내용
    let views : Int // 조회수
    let category : String // 카테고리 이름
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName[0])
    }
}
