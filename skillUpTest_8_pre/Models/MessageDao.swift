//
//  MessageDao.swift
//  skillUpTest_8_pre
//
//  Created by S N on 2018/01/24.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation

final class MessageDao {
    static let daoHelper = RealmDaoHelper<MessageDto>()
    
//    メッセージ追加
    static func addMessage(text: String) {
        let message = MessageDto()
        guard let newID = daoHelper.newId() else {
            return
        }
        message.messageID = newID
        message.text = text
        message.updateDate = Date()
        
        daoHelper.add(object: message)
    }
    
//    メッセージ全取得
    static func getAllMessages() -> ( [[MessageDto]], [String]) {
        let messageList = daoHelper.findAll().sorted(byKeyPath: "updateDate", ascending: true)
        var result = [[MessageDto]]()
        var groupList = [String]()
        
        for message in messageList {
            let updateDate = message.updateDate.dateStyleYYYYMMDD()
            if (!(groupList.filter { $0 == updateDate }.isEmpty) ) {
                continue
            }
            groupList.append(updateDate)
            result.append(findBy(postDate: updateDate))
        }
        
        return (result, groupList)
    }
//    指定投稿日メッセージ全取得
    static func findBy(postDate: String) -> [MessageDto] {
        
        let fromDate = "\(postDate) 00:00:00".toDateStyleMedium(dateFormat: "yyyy-MM-dd HH:mm:ss")
        let toDate = "\(postDate) 23:59:59".toDateStyleMedium(dateFormat: "yyyy-MM-dd HH:mm:ss")
        
        return daoHelper.findAll().filter("updateDate >= %@ AND updateDate <= %@", fromDate, toDate)
            .sorted(byKeyPath: "updateDate", ascending: true).map { MessageDto(value: $0) }
    }
}
