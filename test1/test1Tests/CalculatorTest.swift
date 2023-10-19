//
//  CalculatorTest.swift
//  test1Tests
//
//  Created by Jacek  on 10/10/2023.
//

import XCTest
@testable import test1

final class CalculatorTest: XCTestCase {
    
    func testAdding() throws {
        let result = Calculator.add(lhs: 2,rhs: 3)
        let expectedValue = Double(5)
        XCTAssertEqual(result, expectedValue)
    }
    
    func testSubstracting() throws {
        let result = Calculator.substract(lhs: 2,rhs: 3)
        let expectedValue = Double(-1)
        XCTAssertEqual(result, expectedValue)
    }
    
    func testMul() throws {
        let result = Calculator.mul(lhs: 2,rhs: 3)
        let expectedValue = Double(6)
        XCTAssertEqual(result, expectedValue)
    }
    
    func testDiv() throws {
        let result = Calculator.div(lhs: 6,rhs: 3)
        let expectedValue = Double(2)
        XCTAssertEqual(result, expectedValue)
    }
    
    func testDivZero() throws {
        let result = Calculator.div(lhs: 2,rhs: 0)
        let expectedValue: Double? = nil
        XCTAssertEqual(result, expectedValue)
    }
    
    func testSinus() throws {
        let result = Calculator.sinus(lhs: 5)
        let expectedValue = sin(CGFloat(5))
        XCTAssertEqual(result, expectedValue)
    }}
