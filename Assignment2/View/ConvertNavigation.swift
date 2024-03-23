//
//  ConverterNavigation.swift
//  Assignment2
//
//  Created by Nicholl Unvericht on 3/17/24.
//

import SwiftUI

struct ConvertNavigation: View {
    
    var converter = CurrencyConverter()
    var crypto = CryptoConverter()
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("World Currency Exchange", destination: converter)
                NavigationLink("Crypto Exchange", destination: crypto)
            }
            .listStyle(.grouped)
            .navigationTitle("Conversion App")
        }
    }
}

#Preview {
    ConvertNavigation()
}
