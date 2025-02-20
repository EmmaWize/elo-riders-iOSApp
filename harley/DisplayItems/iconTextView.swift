//
//  iconTextView.swift
//  harley
//
//  Created by Emmanuel Zambrano on 14/02/25.
//

import SwiftUI

struct iconTextView: View {
    let title: String
    let image: ImageResource
    var textSize: CGFloat = 20
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: textSize)
                .foregroundColor(.white)
            Text(title)
                .foregroundColor(.white)
                .bold()
                .font(.system(size: textSize))
        }.frame(height: 100)
        
    }
}

#Preview {
    iconTextView(title: "Emma", image: .record)
}
