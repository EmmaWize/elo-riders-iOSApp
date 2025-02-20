//
//  LogInViewController.swift
//  harley
//
//  Created by Emmanuel Zambrano on 17/02/25.
//

import SwiftUI

struct LogInView: View {
    var otherView: (any View)?
    @StateObject var viewModel = LogInViewModel()
    var body: some View {
        if viewModel.showingSheet {
            Profile()
        } else {
            VStack(alignment: .leading, spacing: 25) {
                Spacer()
                HDTextFileTitle(text: $viewModel.userName, title: "EMAIL", placeholder: "harley@harley-davidson.com", isSecure: false)
                HDTextFileTitle(text: $viewModel.password, title: "PASSWORD", placeholder: "harley@harley-davidson.com", isSecure: true)
                Button(action: {
                    viewModel.validatePassword()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 50)
                            .foregroundColor(viewModel.isFormValid ? .black : .black.opacity(0.5))
                        HStack {
                            Text("Sing in").padding()
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
                })
                HStack(alignment: .center, content: {
                    Spacer()
                    Text("FORGOT PASSWORD?")
                        .bold()
                    Spacer()
                })
                VStack {
                    Text("By logging in, you agree to the ") +
                    Text("Terms of Use")
                        .foregroundColor(.black)
                        .bold()
                        .underline() +
                    Text(" and ") +
                    Text("Privacy Policy")
                        .foregroundColor(.black)
                        .bold()
                        .underline()
                }
                Rectangle().frame(height: 1).foregroundColor(.gray)
                Text("DON'T HAVE AN ACCOUNT YET?")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                Button(action: {
                    if viewModel.isFormValid {
                        viewModel.showingSheet = true
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 50)
                            .foregroundColor(.black)
                        HStack {
                            Text("Create An Account").padding()
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
                })
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LogInView()
}
