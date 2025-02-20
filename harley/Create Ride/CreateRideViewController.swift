//
//  CreateRideViewController.swift
//  harley
//
//  Created by Emmanuel Zambrano on 17/02/25.
//

import SwiftUI
import MapKit

struct CreateRideViewController: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = CreateRideViewModel()
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                HStack {
                    Text("CREATE")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.black)
                        .kerning(0.7)
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                        .foregroundColor(.black)
                        .onTapGesture {
                            dismiss()
                        }
                }
                .padding()
                
                Rectangle().frame(height: 2.5)
                    .foregroundColor(.gray.opacity(0.2))
                HStack {
                    mapItem(color: .hdOrange, image: .harley, itemColor: .black, sfImage: "flag.fill")
                        .frame(height: 45)
                        .padding(.trailing)
                    HDTextFile(text: $viewModel.location, title: "Start:", placeholder: "calle 100 19-25 sdsa dasdasd sd")
                    
                }.padding(20)
                if viewModel.showPicker {
                    Picker("Options", selection: $viewModel.selectedOption) {
                        ForEach(viewModel.options.indices, id: \.self) { index in
                            Text(viewModel.options[index])
                                .tag(index)
                        }
                    }
                } else {
                    Text("OR")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.black)
                    HStack(spacing: 0) {
                        Text("IMPORT GPX FILE ").padding()
                            .font(.system(size: 17, weight: .bold))
                            .bold()
                            .foregroundColor(.black)
                        Image(systemName: "arrow.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 20)
                            .foregroundColor(.black)
                    }
                }
            }
            ZStack {
                Map(position: $viewModel.position) {
                    ForEach(viewModel.locations.indices, id: \.self) { index in
                        let friend = viewModel.locations[index].location
                        Annotation(friend.title, coordinate: friend.coordinates) {
                            mapItem()
                        }
                    }
                }
                HStack {
                    VStack(alignment: .leading) {
                        CustomPickerView(selectedOption: $viewModel.RodaType)
                            .frame(width: 120)
                        Spacer()
                        CapsuleText(text: "AVOID")
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 20) {
                        Spacer()
                        imageCircle(icon: "person.fill.badge.plus", iconColor: .white, backgroundColor: .green)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.addFriendsTaped()
                                }
                                
                            }
                        imageCircle(icon: "plus", iconColor: .black, backgroundColor: .hdOrange)
                        imageCircle(icon: "square.2.layers.3d.fill", iconColor: .white, backgroundColor: .black)
                        CapsuleText(text: "OPTIONS")
                    }
                }.padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CreateRideViewController()
}
