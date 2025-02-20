//
//  SegmentedControlView.swift
//  harley
//
//  Created by Emmanuel Zambrano on 19/02/25.
//

import SwiftUI

struct SegmentedControlView: View {
    let options = ["Option 1", "Option 2", "Option 3"]
    
    @State private var selectedOption = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Picker("Options", selection: $selectedOption) {
                ForEach(options.indices, id: \.self) { index in
                    Text(options[index])
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            Text("Selected: \(options[selectedOption])")
                .font(.title)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Segmented Control")
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView()
    }
}


