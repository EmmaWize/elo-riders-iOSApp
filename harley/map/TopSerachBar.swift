//
//  TopSerachBar.swift
//  harley
//
//  Created by Emmanuel Zambrano on 14/02/25.
//

import SwiftUI

struct TopSerachBar: View {
    var body: some View {
        HStack {
            ZStack {
                Capsule()
                    .foregroundColor(.white)
                Spacer()
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22)
                        .foregroundColor(.black)
                    Text("Where to ?")
                    Spacer()
                }.padding(.horizontal)
            }
            ZStack {
                Capsule()
                    .fill(.clear)
                    .frame(width: 100)
                    .overlay(
                        Capsule()
                            .stroke(Color.black, lineWidth: 2)
                    )
                Text("FILTER").bold()
            }
            
            ZStack {
                Circle()
                    .foregroundColor(.black)
                Image(systemName: "list.bullet")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22)
                    .foregroundColor(.white)
            }
        }.frame(height: 40)
            .padding(.horizontal)
        
    }
}

#Preview {
    TopSerachBar()
}
