//
//  CapsuleText.swift
//  harley
//
//  Created by Emmanuel Zambrano on 19/02/25.
//

import SwiftUI

struct CapsuleText: View {
    let text: String
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(.white.opacity(0.3))
                .overlay(
                    Capsule()
                        .stroke(Color.black, lineWidth: 2)
                )
            Text(text)
                .bold()
                .padding()
        }.fixedSize(horizontal: true, vertical: true)
        
    }
}

#Preview {
    CapsuleText(text: "Hola Emmanuel")
}
