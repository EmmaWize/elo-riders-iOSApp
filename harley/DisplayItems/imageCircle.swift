//
//  imageCircle.swift
//  harley
//
//  Created by Emmanuel Zambrano on 18/02/25.
//

import SwiftUI

struct imageCircle: View {
    let icon: String
    let iconColor: Color
    let backgroundColor: Color
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(backgroundColor)
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(iconColor)
                .padding(10)
        }
        .frame(height: 50)
    }
}

#Preview {
    imageCircle(icon: "plus", iconColor: .white, backgroundColor: .blue)
}
