//
//  AppState.swift
//  TechChallenge
//
//  Created by Adam Price on 20/04/2022.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var transactions: [TransactionModel]
    @Published var pinned: Set<Int>
    @Published var selectedCategory: TransactionModel.Category?
    
    init(transactions: [TransactionModel]) {
        self.transactions = transactions
        self.pinned = Set(transactions.map(\.id))
    }
    
    func pinnedTotal(for category: TransactionModel.Category? = nil) -> Double {
        transactions
            .filter { pinned.contains($0.id) }
            .filter(by: category)
            .reduce(0) { $0 + $1.amount }
    }
}
