//
//  TabBArItem.swift
//  harley
//
//  Created by Emmanuel Zambrano on 12/02/25.
//

import SwiftUI

struct TabBarItem: View {
    let image: ImageResource?
    let title: String
    let systemImage: String?
    var selectedView: selectedView
    init(image: ImageResource, title: String, selectedView: selectedView) {
        self.image = image
        self.title = title
        self.systemImage = nil
        self.selectedView = selectedView
    }
    
    init(systemImage: String, title: String, selectedView: selectedView) {
        self.image = nil
        self.title = title
        self.systemImage = systemImage
        self.selectedView = selectedView
    }
    
    var body: some View {
        VStack(alignment: .center){
            if let image = image{
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(selectedView.rawValue == title ? .orange : .white)
                    .frame(width: 30, height: 30)
            } else {
                Image(systemName: systemImage ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(selectedView.rawValue == title ? .orange : .white)
                    .frame(width: 30, height: 30)
            }
            
            Text(title)
                .foregroundStyle(selectedView.rawValue == title ? .orange : .white)
                .font(.system(size: 12))
        }
    }
}

#Preview {
    TabBarItem(systemImage: "ellipsis", title: "more", selectedView: .More)
}
