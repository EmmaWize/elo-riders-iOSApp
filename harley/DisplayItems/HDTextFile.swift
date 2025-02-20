//
//  HDTextFile.swift
//  harley
//
//  Created by Emmanuel Zambrano on 18/02/25.
//

import SwiftUI

struct HDTextFile: View {
    @Binding var text: String
    var title: String
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .overlay(
                    Rectangle()
                        .stroke(Color.black, lineWidth: 2)
                )
            
            HStack(spacing: 10) {
                if !title.isEmpty {
                    Text(title)
                        .bold()
                        .foregroundColor(.black)
                }
                TextField(placeholder, text: $text)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .foregroundColor(.black)
            }
            .padding(8)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    @State var sampleText = ""
    return HDTextFile(text: $sampleText, title: "Start:", placeholder: "Emma pero en gris")
}
