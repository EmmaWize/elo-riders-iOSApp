//
//  CustomPickerView.swift
//  harley
//
//  Created by Emmanuel Zambrano on 19/02/25.
//

import SwiftUI

struct CustomPickerView: View {
    @Binding var selectedOption: Int
    let options = ["road.lanes.curved.right", "mountain.2"]
    @Namespace private var animationNamespace
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<options.count, id: \.self) { index in
                Button(action: {
                    withAnimation() {
                        selectedOption = index
                    }
                }) {
                    ZStack {
                        if selectedOption == index {
                            Capsule()
                                .stroke(.hdOrange, lineWidth: 2)
                                .matchedGeometryEffect(id: "background", in: animationNamespace)
                        }
                        
                        Image(systemName: options[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .padding(8) // Espaciado interno entre ícono y borde
                }
            }
        }
        .padding(2) // Espaciado entre botones y borde exterior
        .background(
            ZStack {
                Capsule()
                    .foregroundColor(.white.opacity(0.3))
                Capsule()
                    .stroke(Color.black, lineWidth: 2)
                    .foregroundColor(.blue)
            }
        )
        .frame(height: 60) // Ajuste para compensar los padding
    }
}

struct ContentView: View {
    @State private var selectedOption = 0

    var body: some View {
        VStack {
            CustomPickerView(selectedOption: $selectedOption)
                .frame(width: 120)
            
            Text("Opción seleccionada: \(selectedOption == 0 ? "Road" : "Mountain")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
