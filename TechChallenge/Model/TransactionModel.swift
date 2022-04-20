//
//  TransactionModel.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import Foundation

// MARK: - TransactionModel

struct TransactionModel {
    enum Category: String, CaseIterable {
        case food
        case health
        case entertainment
        case shopping
        case travel
    }
    
    enum Provider: String {
        case amazon
        case americanAirlines
        case burgerKing
        case cvs
        case exxonmobil
        case jCrew
        case starbucks
        case timeWarner
        case traderJoes
        case uber
        case wawa
        case wendys
    }
    
    let id: Int
    let name: String
    let category: Category
    let amount: Double
    let date: Date
    let accountName: String
    let provider: Provider?
}

extension TransactionModel: Identifiable {}

extension TransactionModel: Hashable {}

// MARK: - Category

extension TransactionModel.Category: Identifiable {
    var id: String {
        rawValue
    }
}

extension TransactionModel.Category {
    static subscript(index: Int) -> Self? {
        guard
            index >= 0 &&
            index < TransactionModel.Category.allCases.count
        else {
            return nil
        }
        
        return TransactionModel.Category.allCases[index]
    }
}

extension Array where Element == TransactionModel {
    
    func filter(by category: TransactionModel.Category?) -> [Element] {
        guard let category = category else { return self }
        return self.filter { $0.category == category }
    }
    
    func totalForCategory(_ category: TransactionModel.Category?) -> Double {
        guard let category = category else { return self.reduce(0) { $0 + $1.amount } }
        return self.filter { $0.category == category }.reduce(0) { $0 + $1.amount }
    }
    
    var total: Double {
        return self.reduce(0) { $0 + $1.amount }
    }
}
