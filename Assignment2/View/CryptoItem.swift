//
//  CryptoItem.swift
//  Assignment2
//
//  Created by Nicholl Unvericht on 3/17/24.
//  Defines the Crypto ListItem added to ListView for MVVM

import SwiftUI


struct CryptoItem: View {
    
    var item : ConvertModel<CryptoItemModel>
    
    var body: some View {
        HStack {
            let cryptoMultiplier = item.cardContent.multiplier
            //Text(item.cardContent.cryptoCode)
            Text(item.cardContent.cryptoName)
            Spacer()
            Text(String(format: "%.2f", cryptoMultiplier))
        }
    }
}

#Preview {
    CryptoItem(item: ConvertModel(cardContent: CryptoItemModel(cryptoName: "US Dollar", cryptoCode: "USD", multiplier: 65000)))
}
