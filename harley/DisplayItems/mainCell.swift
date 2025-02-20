//
//  mainCell.swift
//  harley
//
//  Created by Emmanuel Zambrano on 13/02/25.
//

import SwiftUI

struct mainCell: View {
    let image: ImageResource
    let text: String
    let cornerRadius = 25.0
    let widthSize = 360.0
    let heightSize = 350.0
    let bottomSize = 60.0
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: widthSize, height: heightSize - bottomSize)
                    .cornerRadius(cornerRadius)
                    .clipped()
                RoundedCorners(color: .gray,
                               tl: 0,
                               tr: 0, bl: cornerRadius,
                               br: cornerRadius)
                .frame(width: widthSize, height: bottomSize)
                .offset(CGSize(width: 0.0, height: -25.0))
            }
            VStack{
                Spacer()
                ZStack(alignment: .center) {
                    RoundedCorners(color: .black,
                                   tl: 0, tr: 0,
                                   bl: cornerRadius,
                                   br: cornerRadius)
                    .frame(width: widthSize, height: bottomSize)
                    
                    HStack(spacing: 0) {
                        Text(text).padding()
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                        Image(systemName: "arrow.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 15)
                            .foregroundColor(.white)
                            .offset(CGSize(width: -3.0, height: 0))
                    }
                }
                .offset(CGSize(width: 0.0, height: -25.0))
                
            }
        }
        .frame(width: widthSize, height: heightSize)
    }
}


#Preview {
    mainCell(image: .bike1, text: "View Event Details")
}
