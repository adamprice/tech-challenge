//
//  TechChallengeApp.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

@main
struct TechChallengeApp: App {
    
    @StateObject var appState = AppState(transactions: ModelData.sampleTransactions)

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    TransactionListView()
                }
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }
                
                NavigationView {
                    InsightsView()
                }
                .tabItem {
                    Label("Insights", systemImage: "chart.pie.fill")
                }
            }
            .environmentObject(appState)
        }
    }
}
