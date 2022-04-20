//
//  TechChallengeTests.swift
//  TechChallengeTests
//
//  Created by Adrian Tineo Cabello on 30/7/21.
//

import XCTest
@testable import TechChallenge

class TechChallengeTests: XCTestCase {

    func testTransactionFilter() throws {
        let transactions = [TransactionModel(
            id: 1,
            name: "Movie Night",
            category: .entertainment,
            amount: 82.99,
            date: Date(string: "2021-03-05")!,
            accountName: "Checking Account",
            provider: .timeWarner
        ),
        TransactionModel(
            id: 2,
            name: "Jeans",
            category: .shopping,
            amount: 54.60,
            date: Date(string: "2021-04-25")!,
            accountName: "Checking Account",
            provider: .jCrew
        )]

        let filtered = transactions.filter(by: .entertainment)
        XCTAssertEqual(filtered[0], transactions[0])
    }
    
    func testTransactionFilterNoTransactions() throws {
        let transactions = [TransactionModel(
            id: 1,
            name: "Movie Night",
            category: .entertainment,
            amount: 82.99,
            date: Date(string: "2021-03-05")!,
            accountName: "Checking Account",
            provider: .timeWarner
        ),
        TransactionModel(
            id: 2,
            name: "Jeans",
            category: .shopping,
            amount: 54.60,
            date: Date(string: "2021-04-25")!,
            accountName: "Checking Account",
            provider: .jCrew
        )]

        let filtered = transactions.filter(by: .health)
        XCTAssertEqual(filtered.count, 0)
    }

    func testCategoryAmounts() throws {
        let transactions = [TransactionModel(
            id: 1,
            name: "Movie Night",
            category: .entertainment,
            amount: 82.99,
            date: Date(string: "2021-03-05")!,
            accountName: "Checking Account",
            provider: .timeWarner
        ),
        TransactionModel(
            id: 2,
            name: "Jeans",
            category: .shopping,
            amount: 54.60,
            date: Date(string: "2021-04-25")!,
            accountName: "Checking Account",
            provider: .jCrew
        )]
        
        XCTAssertEqual(transactions.totalForCategory(.entertainment), 82.99)
        XCTAssertEqual(transactions.totalForCategory(.shopping), 54.60)
        XCTAssertEqual(transactions.totalForCategory(nil), 137.59)
    }

}
