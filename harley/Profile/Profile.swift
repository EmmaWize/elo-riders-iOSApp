//
//  Profile.swift
//  harley
//
//  Created by Emmanuel Zambrano on 17/02/25.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            Spacer()
            Image(.profile)
                .resizable()
                .aspectRatio(contentMode: .fill)
            Spacer()
        }.padding(-2)
        
    }
}

#Preview {
    Profile()
}
