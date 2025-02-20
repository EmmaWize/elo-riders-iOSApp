//
//  mapItem.swift
//  harley
//
//  Created by Emmanuel Zambrano on 14/02/25.
//

import SwiftUI

struct mapItem: View {
    let color: Color
    let image: ImageResource
    let itemColor: Color
    let sfImage: String?
    
    init(color: Color, image: ImageResource, itemColor: Color, sfImage: String) {
        self.color = color
        self.image = image
        self.itemColor = itemColor
        self.sfImage = sfImage
    }
    
    init() {
        self.color = .orange
        self.image = .helment
        self.itemColor = .white
        self.sfImage = nil
    }
    var body: some View {
        ZStack {
            Image(systemName: "drop.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32)
                .rotationEffect(Angle(degrees: 180.0))
                .foregroundColor(color)
            if let sfImage = sfImage {
                Image(systemName: sfImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                    .foregroundColor(itemColor)
                    .padding(.bottom, 10)
                    .padding(9)
            } else {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                    .foregroundColor(itemColor)
                    .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    mapItem(color: .hdOrange, image: .harley, itemColor: .black, sfImage: "flag.fill")
}
