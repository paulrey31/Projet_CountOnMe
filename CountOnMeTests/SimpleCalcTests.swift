//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/201.9
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcTests: XCTestCase {
    var calculation: Calculation!
    override func setUp() {
        super.setUp()
        calculation = Calculation()
    }
    // MARK: test to adding numbers
    func testGivenHaveStringCalculTextEmpty_WhenAddNumber_ThenStringCalculTextHave2() {
        calculation.addNumber(number: "2")
        XCTAssertEqual(calculation.calculText, "2")
    }
    func testGivenStringCalculTextHave2_WhenAddNumber_ThenStringCalculTextHave22() {
        calculation.addNumber(number: "2")
        calculation.addNumber(number: "2")
        XCTAssertEqual(calculation.calculText, "22")
    }
    func testGivenStringCalculTextHaveResult_WhenAddNumber_ThenStringCalculTextHave2() {
        calculation.calculText = "2 + 2 = 4"
        calculation.addNumber(number: "2")
        XCTAssertEqual(calculation.calculText, "2")
    }
    
    // MARK: test to adding comma
    func testGivenStringCalculTextHave2_WhenAddComma_ThenStringCalculTextHave2Comma() {
        calculation.addNumber(number: "2")
        calculation.addComma(comma: ".")
        XCTAssertEqual(calculation.calculText, "2.")
    }
    
    func testGivenStringCalculTextHaveEmpty_WhenAddComma_ThenStringCalculTextHaveEmptyAndDisplayAlert() {
        calculation.calculText = ""
        calculation.addComma(comma: ".")
        XCTAssertEqual(calculation.calculText, "")
    }
    
    func testGivenStringCalculTextHaveResult_WhenAddComma_ThenStringCalculTextHaveEmpty() {
        calculation.calculText = "2 + 2=4"
        calculation.addComma(comma: ".")
        XCTAssertEqual(calculation.calculText, "")
    }
    
    // MARK: test to adding operator
    func testGivenStringCalculTextHave2_WhenAddOperator_ThenStringCalculTextHave2AndPlus() {
        calculation.addNumber(number: "2")
        calculation.addOperator(_operator: "+")
        XCTAssertEqual(calculation.calculText, "2 + ")
    }
    
    func testGivenStringCalculTextHaveEmpty_WhenAddOperator_ThenStringCalculTextHavePlus() {
        calculation.calculText = ""
        calculation.addOperator(_operator: "+")
        XCTAssertEqual(calculation.calculText, " + ")
    }
    
    func testGivenStringCalculTextHave2AndPlus_WhenAddOperator_ThenStringCalculTextHave2AndPlusAndDisplayAlert() {
        calculation.calculText = "2 + "
        calculation.addOperator(_operator: "+")
        XCTAssertEqual(calculation.calculText, "2 + ")
    }
    
    // MARK: test to clear calcul text
    func testGivenStringCalculTextHave2_WhenResetOperator_ThenStringCalculTextHaveEmpty() {
        calculation.addNumber(number: "2")
        calculation.resetOperator()
        XCTAssertEqual(calculation.calculText, "")
    }
    
    // MARK: test simple calcul
    func testGivenAddition2and2_WhenEqualOperator_ThenHaveResult4() {
        calculation.addNumber(number: "2")
        calculation.addOperator(_operator: "+")
        calculation.addNumber(number: "2")
        calculation.equalOperator()
        XCTAssertEqual(calculation.calculText, "2 + 2 = 4")
    }
    
    func testGivenSubstraction2and2_WhenEqualOperator_ThenHaveResult0() {
        calculation.addNumber(number: "2")
        calculation.addOperator(_operator: "-")
        calculation.addNumber(number: "2")
        calculation.equalOperator()
        XCTAssertEqual(calculation.calculText, "2 - 2 = 0")
    }
    
    func testGivenDivision2and2_WhenEqualOperator_ThenHaveResult0() {
        calculation.addNumber(number: "2")
        calculation.addOperator(_operator: "/")
        calculation.addNumber(number: "2")
        calculation.equalOperator()
        XCTAssertEqual(calculation.calculText, "2 / 2 = 1")
    }
    
    func testGivenMultiplication2and2_WhenEqualOperator_ThenHaveResult0() {
        calculation.addNumber(number: "2")
        calculation.addOperator(_operator: "x")
        calculation.addNumber(number: "2")
        calculation.equalOperator()
        XCTAssertEqual(calculation.calculText, "2 x 2 = 4")
    }
    
    func testGivenDivision2and0_WhenEqualOperator_ThenHaveResultAndDisplayAlert() {
        calculation.addNumber(number: "2")
        calculation.addOperator(_operator: "/")
        calculation.addNumber(number: "0")
        calculation.equalOperator()
        XCTAssertEqual(calculation.calculText, "2 / 0 = inf")
    }
    
    func testGivenDivision2_WhenEqualOperator_ThenHaveResultAndDisplayAlert() {
        calculation.addNumber(number: "2")
        calculation.addOperator(_operator: "/")
        calculation.equalOperator()
        XCTAssertEqual(calculation.calculText, "2 / ")
    }
    
    // MARK: test priority calcul
    func testGivenCalculPriority_WhenEqualOperator_ThenHaveResult() {
        calculation.addNumber(number: "2")
        calculation.addOperator(_operator: "+")
        calculation.addNumber(number: "2")
        calculation.addOperator(_operator: "x")
        calculation.addNumber(number: "5")
        calculation.equalOperator()
        XCTAssertEqual(calculation.calculText, "2 + 2 x 5 = 12")
    }
    
    // MARK:  test error
    func testGivenHaveEmpty_WhenEqualOperator_ThenDisplayAlert() {
        let exp = expectation(description: #function)
        
        calculation.displayAlert = { errorText in
            XCTAssertTrue("Démarrer un calcul !" == errorText)
            exp.fulfill()
        }
    
        calculation.equalOperator()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGivenHaveTwoOperator_WhenEqualOperator_ThenDisplayAlert() {
        let exp = expectation(description: #function)
        
        calculation.displayAlert = { errorText in
            XCTAssertTrue("Un operateur est déja mis !" == errorText)
            exp.fulfill()
        }
        
        calculation.addNumber(number: "2")
        calculation.addOperator(_operator: "+")
        calculation.addOperator(_operator: "+")
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
