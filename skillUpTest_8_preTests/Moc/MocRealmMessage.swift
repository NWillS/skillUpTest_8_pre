//
//  MocRealmMessage.swift
//  skillUpTest_8_preTests
//
//  Created by S N on 2018/01/26.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

@testable import skillUpTest_8_pre
import XCTest

class MocRealmMessage: XCTestCase {
    
    func mocRealmMessage() -> RealmDaoHelper<MessageDto> {
        return RealmDaoHelper<MessageDto>()
    }
    
    // MARK: - テスト用テキスト
    
    static let dummyText = ["0", "1", "2", "3", "4"]
    
}
