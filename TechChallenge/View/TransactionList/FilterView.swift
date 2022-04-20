import SwiftUI

struct FilterView: View {
    
    let categories: [TransactionModel.Category]
    
    @EnvironmentObject private var appState: AppState
        
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Button("all") {
                    appState.selectedCategory = nil
                }
                .buttonStyle(FilterButton(backgroundColor: .black))
                ForEach(categories) { category in
                    Button(category.rawValue) {
                        appState.selectedCategory = category
                    }
                    .buttonStyle(FilterButton(backgroundColor: category.color))
                }
            }
            .padding()
        }
        .background(Color.accentColor.opacity(0.8))
    }
}

#if DEBUG
struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(categories: TransactionModel.Category.allCases)
            .environmentObject(AppState(transactions: ModelData.sampleTransactions))
    }
}
#endif
