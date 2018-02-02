//
//  MessageDtoTests.swift
//  skillUpTest_8_preTests
//
//  Created by S N on 2018/01/31.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

@testable import skillUpTest_8_pre
import XCTest

class MessageDtoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMessageDto() {
        let messageID = 1
        let text = "test"
        let updateDate = Date()
        
        let message = MessageDto()
        message.messageID = messageID
        message.text = text
        message.updateDate = updateDate
        
        XCTAssertEqual(message.messageID, 1)
        XCTAssertEqual(message.text, "test")
        XCTAssertEqual(message.updateDate, updateDate)
        
    }
    
    func testPrimaryKey() {
        let primaryKey = MessageDto.primaryKey()
        
        XCTAssertEqual(primaryKey, "messageID")
    }
}
