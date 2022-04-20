//
//  FilterButton.swift
//  TechChallenge
//
//  Created by Adam Price on 19/04/2022.
//

import SwiftUI

struct FilterButton: ButtonStyle {
    
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding([.leading, .trailing])
            .padding([.top, .bottom], 8)
            .background(backgroundColor)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .font(.system(.title2).bold())
    }
}

#if DEBUG
struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("health") {
            print("Button pressed")
        }
        .buttonStyle(FilterButton(backgroundColor: .black))
    }
}
#endif
