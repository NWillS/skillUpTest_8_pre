//
//  TaskDaoTests.swift
//  skillUpTest_8_preTests
//
//  Created by S N on 2018/01/26.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

@testable import skillUpTest_8_pre
import XCTest

class TaskDaoTests: XCTestCase {
    var moc = MocRealmMessage()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        moc = MocRealmMessage()
        moc.mocRealmMessage().deleteAll()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        moc.mocRealmMessage().deleteAll()

    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
