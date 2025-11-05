//
//  ChatiViewController.swift
//  sopt-37th-03practice
//
//  Created by JIN on 11/1/25.
//

import SnapKit
import UIKit

class ChatViewController: UIViewController {
    
    private var chatRooms: [ChatRoomModel] = []
    
    private let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
           super.viewDidLoad()
           
        setUI()
        setLayout()
        register()
        setDelegate()
        loadMockData()
       }
       
       private func setUI() {  // 기본 속성 정의
           view.backgroundColor = .white
           title = "채팅"
           tableView.separatorStyle = .singleLine
       }
       
       private func setLayout() {           // 레이아웃 잡기~!
           self.view.addSubview(tableView)
           
           tableView.snp.makeConstraints {
               $0.edges.equalToSuperview()
           }
       }
    
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadMockData() {
        chatRooms = ChatRoomModel.mockData
        tableView.reloadData()
    }
}

#Preview {
    ChatViewController()
}

extension ChatViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(chatRooms[indexPath.row].name)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        72
    }
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell()}
        cell.configure(chatRoom: chatRooms[indexPath.row])
        return cell
    }
    
    
}
