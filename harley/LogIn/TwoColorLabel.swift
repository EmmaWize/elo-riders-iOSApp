//
//  TwoColorLabel.swift
//  harley
//
//  Created by Emmanuel Zambrano on 17/02/25.
//

import SwiftUI

struct TwoColorLabel: View {
    let text: String
    var symbol: String = "*"
    var body: some View {
        HStack(spacing: 0) {
            Text(text)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            Text(symbol)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.orange)
        }
    }
}

#Preview {
    TwoColorLabel(text: "Emma", symbol: "'")
}
