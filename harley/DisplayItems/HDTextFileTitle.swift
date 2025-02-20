//
//  HDTextFile.swift
//  harley
//
//  Created by Emmanuel Zambrano on 17/02/25.
//

import SwiftUI

struct HDTextFileTitle: View {
    @Binding var text: String
    var title: String
    var placeholder: String
    var isSecure: Bool
    @State private var isTextVisible: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            TwoColorLabel(text: title)
            if isSecure {
                ZStack {
                    if isTextVisible {
                        TextField(placeholder, text: $text)
                            .padding()
                            .background(Color.white)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    } else {
                        SecureField(placeholder, text: $text)
                            .padding()
                            .background(Color.white)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                    HStack {
                        Spacer()
                        Image(systemName: "eye.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .foregroundColor(.gray)
                            .padding()
                            .onTapGesture {
                                print("tap")
                                isTextVisible.toggle()
                            }
                    }
                }
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 2)
                    )
            }
        }
    }
}

#Preview {
    @State var sampleText = ""
    
    return HDTextFileTitle(text: $sampleText, title: "Item name", placeholder: "harley@harley-davidson.com", isSecure: true)
}
