//
//  task1and4Tests.swift
//  task1and4Tests
//
//  Created by Сергей Никулин on 06.05.2018.
//  Copyright © 2018 SNikulin. All rights reserved.
//

import XCTest
@testable import task1and4

class task1and4Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test1() {
        let login = "test@test.com"
        
        let result = Validator.validate(login: login)
        
        XCTAssertTrue(result)
    }
    
    func test2() {
        let login = "2test@test.com"
        
        let result = Validator.validate(login: login)
        
        XCTAssertFalse(result)
    }
    
    func test3() {
        let login = "some.name@mail-mail.ru"
        
        let result = Validator.validate(login: login)
        
        XCTAssertTrue(result)
    }
    
    func test4() {
        let login = "Withdate1899@test923.someString"
        
        let result = Validator.validate(login: login)
        
        XCTAssertTrue(result)
    }
    
    func test5() {
        let login = "nameWithdate1899@test923.someStringThatLongerThanNeeded"
        
        let result = Validator.validate(login: login)
        
        XCTAssertFalse(result)
    }
    
    func test6() {
        let login = "nameWithdate1899@test923.s"
        
        let result = Validator.validate(login: login)
        
        XCTAssertFalse(result)
    }
    
    func test7() {
        let login = "a"
        
        let result = Validator.validate(login: login)
        
        XCTAssertFalse(result)
    }
    
    func test8() {
        let login = "SomeLoginW1th.and-"
        
        let result = Validator.validate(login: login)
        
        XCTAssertTrue(result)
    }
    func test9() {
        let login = "SomeLoginW1th.and-andwith@"
        
        let result = Validator.validate(login: login)
        
        XCTAssertFalse(result)
    }
    
    func test10() {
        let login = "SomeVeryLongLoginThatShouldNotFinishThetest"
        
        let result = Validator.validate(login: login)
        
        XCTAssertFalse(result)
    }
    
    func test11() {
        let login = "1loginthatstartswithnumber"
        
        let result = Validator.validate(login: login)
        
        XCTAssertFalse(result)
    }
    
    func test12() {
        let login = "name1-familyname2.nickname"
        
        let result = Validator.validate(login: login)
        
        XCTAssertTrue(result)
    }
}
