//
//  ConverterNavigation.swift
//  Assignment2
//
//  Created by Nicholl Unvericht on 3/17/24.
//

import SwiftUI

struct ConverterNavigation: View {
    
    var converter = CurrencyConverter()
    var crypto = CryptoView()
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("World Currency Exchange", destination: converter)
                NavigationLink("Crypto Exchange", destination: crypto)
            }
            .navigationTitle("Conversion App")
        }
    }
}

#Preview {
    ConverterNavigation()
}
