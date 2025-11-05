//
//  ChatRoomModel.swift
//  sopt-37th-03practice
//
//  Created by JIN on 11/1/25.
//

import UIKit
import Foundation

struct ChatRoomModel {
    
    let profileImage: UIImage?
    let name: String
    let location: String
    let lastMessage: String
    let thumbnail: UIImage?
    
    static let mockData: [ChatRoomModel] = [
        ChatRoomModel(profileImage: .image16, name: "이명진", location: "대한민국", lastMessage: "확인했습니다 감사합니다 :)", thumbnail: .image10),
        ChatRoomModel(profileImage: .image16, name: "신혜연", location: "일본", lastMessage: "넵 수고하세용 ㅋ", thumbnail: .image11),
        ChatRoomModel(profileImage: .image17, name: "안치욱", location: "중국", lastMessage: "니 하오마....", thumbnail: .image12),
        ChatRoomModel(profileImage: .image18, name: "선영주", location: "미국", lastMessage: "오빠 나 미미나 힘들어.", thumbnail: .image13),
        ChatRoomModel(profileImage: .image19, name: "이나연", location: "프랑스", lastMessage: "네.", thumbnail: .image14),
        ChatRoomModel(profileImage: UIImage(named: "profile6"), name: "김나연", location: "영국", lastMessage: "김나연님이 이모티콘을 보냈어요.", thumbnail: UIImage(named: "item6")),
        ChatRoomModel(profileImage: UIImage(named: "profile1"), name: "이서현", location: "독일", lastMessage: "이서현님이 이모티콘을 보냈어요.", thumbnail: UIImage(named: "item7")),
        ChatRoomModel(profileImage: UIImage(named: "profile2"), name: "조영서", location: "이탈리아", lastMessage: "옷 예쁘네요! 얼마죠?", thumbnail: UIImage(named: "item8")),
        ChatRoomModel(profileImage: UIImage(named: "profile3"), name: "박정환", location: "스페인", lastMessage: "네고좀 해주세요.", thumbnail: UIImage(named: "item9")),
        ChatRoomModel(profileImage: UIImage(named: "profile4"), name: "진소은", location: "캐나다", lastMessage: "감사합니다! 조심하가세요~!", thumbnail: UIImage(named: "item10"))
    ]
    
}

