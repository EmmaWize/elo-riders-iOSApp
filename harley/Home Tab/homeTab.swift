//
//  homeTab.swift
//  harley
//
//  Created by Emmanuel Zambrano on 13/02/25.
//

import SwiftUI

struct mainItem: Identifiable {
    let id = UUID()
    let image: ImageResource
    let description: String?
    let elo: Double
}

struct homeTab: View {
    @StateObject private var viewModel = HomeViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Welcome \(viewModel.userName)")
                    .font(.system(size: 25, weight: .bold))
                Spacer()
                Image(systemName: "envelope")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 28)
                    .padding(.trailing, 5)
            }.padding(.horizontal, 32)
            ScrollView {
                ForEach(viewModel.items, id: \.id) { item in
                    mainCell(image: item.image, text: item.description ?? "View Event Details")
                }
            }.padding(.horizontal)
        }
    }
}

#Preview {
    homeTab()
}
