//
//  ContentView.swift
//  shortenswift
//
//  Created by Ali Raza on 3/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var longURL: String = ""
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @ObservedObject var viewModel = BitlyViewModel()

    var body: some View {
        VStack(spacing: 20) {
            TextField("Paste URL here", text: $longURL)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                viewModel.shortenURL(url: longURL)
                if !viewModel.shortURL.isEmpty {
                    UIPasteboard.general.string = viewModel.shortURL
                    alertTitle = "Success"
                    alertMessage = "Short URL copied to clipboard"
                } else {
                    alertTitle = "Error"
                    alertMessage = "Failed to shorten URL"
                }
                showingAlert = true
            }) {
                Text("Shorten URL")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
            }
            .padding()
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
