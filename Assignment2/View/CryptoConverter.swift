//
//  CryptoConverter.swift
//  Assignment2
//
//  Created by Nicholl Unvericht on 3/17/24.
//

import SwiftUI

struct CryptoConverter: View {
    
    @FocusState private var textFocus: Bool
    
    @ObservedObject var viewModel = CryptoConverterViewModel()
        
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Bitcoin: ")
                    TextField("Amount", text: $viewModel.bitcoin)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        .focused($textFocus)
                }
                .padding()
                List(viewModel.listOfCrypto) {
                    item in CryptoItem(item: viewModel.updateCryptoItem(item)!)
                }
                .listStyle(.grouped)
            }
            .onAppear {
                viewModel.fetchCrypto()
            }
            .navigationTitle("Crypto Exchange")
            .navigationBarTitleDisplayMode(.inline)
                
            // Dismiss the keyboard on tap outside TextField
            .onTapGesture {
                textFocus = false
            }
        }
    }
}
    
#Preview {
    CryptoConverter()
}
