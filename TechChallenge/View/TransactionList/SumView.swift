//
//  SumView.swift
//  TechChallenge
//
//  Created by Adam Price on 19/04/2022.
//

import SwiftUI

struct SumView: View {
    
    @EnvironmentObject private var appState: AppState

    let total: String
    
    var body: some View {
        ZStack {
            HStack(alignment: .bottom) {
                Text("Total spent:")
                    .secondary()
                Spacer()
                VStack(alignment: .trailing) {
                    Text(appState.selectedCategory?.rawValue ?? "all")
                        .font(.system(.headline))
                        .foregroundColor(appState.selectedCategory?.color ?? .black)
                    Text(total)
                        .bold()
                        .secondary()
                }
            }
            .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 2)
        )
    }
}

#if DEBUG
struct SumView_Previews: PreviewProvider {
    static var previews: some View {
        SumView(total: "$200.45")
            .environmentObject(AppState(transactions: ModelData.sampleTransactions))
    }
}
#endif
