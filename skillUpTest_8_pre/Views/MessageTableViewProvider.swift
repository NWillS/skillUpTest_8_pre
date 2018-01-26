//
//  MessageTableViewProvider.swift
//  skillUpTest_8_pre
//
//  Created by S N on 2018/01/25.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit

class MessageTableViewProvider: NSObject {
    var messageList: [[MessageDto]] = []
    var groupList: [String] = []
    
    func set(messageList: [[MessageDto]], groupList: [String]) {
        self.messageList = messageList
        self.groupList = groupList
    }
}

extension MessageTableViewProvider: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupList[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell") as? MessageTableViewCell else {
            fatalError("messageCellが取得できない。")
        }
        let message = messageList[indexPath.section][indexPath.row].text
        let time = messageList[indexPath.section][indexPath.row].updateDate.dateStyleHHMM()
        
        cell.set(message: message, time: time)
        
        return cell
    }
    
}
