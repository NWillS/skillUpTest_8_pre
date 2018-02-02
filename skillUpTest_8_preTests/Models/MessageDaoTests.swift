//
//  MessageDaoTests.swift
//  skillUpTest_8_preTests
//
//  Created by S N on 2018/02/02.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

@testable import skillUpTest_8_pre
import XCTest

class MessageDaoTests: XCTestCase {
    var moc = MocRealmMessage()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        moc = MocRealmMessage()
        moc.mocRealmMessage().deleteAll()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        moc.mocRealmMessage().deleteAll()
        super.tearDown()
    }
    
    func testAddMessage() {
//        setup
        XCTAssertEqual(moc.mocRealmMessage().findAll().count, 0)
        let text = MocRealmMessage.dummyText[0]
        
//        exercise
        MessageDao.addMessage(text: text)
        
//        verify
        XCTAssertEqual(moc.mocRealmMessage().findAll().count, 1)
        XCTAssertEqual(moc.mocRealmMessage().findFirst(key: 1 as AnyObject)?.text, MocRealmMessage.dummyText[0])
    }

    func testGetAllMessages() {
//        setup
        XCTAssertEqual(moc.mocRealmMessage().findAll().count, 0)
        
        MessageDao.addMessage(text: MocRealmMessage.dummyText[0])
        
//        excercise
        let result = MessageDao.getAllMessages()
        
//        verify
        XCTAssertEqual(result.0.count, 1)
        XCTAssertEqual(result.1.count, 1)
        
    }
    func testFindBy() {
//        setup
        XCTAssertEqual(moc.mocRealmMessage().findAll().count, 0)
        MessageDao.addMessage(text: MocRealmMessage.dummyText[0])
        MessageDao.addMessage(text: MocRealmMessage.dummyText[1])
        
        let result = MessageDao.getAllMessages()
        
//        exercise
        let messages = MessageDao.findBy(postDate: result.1[0])
        
//        verify
        XCTAssertEqual(messages.count, 2)
        XCTAssertEqual(messages[0].text, MocRealmMessage.dummyText[0])
        XCTAssertEqual(messages[1].text, MocRealmMessage.dummyText[1])
    }
}
