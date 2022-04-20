//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
        
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        VStack {
            FilterView(categories: TransactionModel.Category.allCases)
            List {
                ForEach(appState.transactions.filter(by: appState.selectedCategory)) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())

            SumView(total: "$\(appState.pinnedTotal(for: appState.selectedCategory).formatted())")
            .padding(8)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Transactions")
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
            .environmentObject(AppState(transactions: ModelData.sampleTransactions))
    }
}
#endif
