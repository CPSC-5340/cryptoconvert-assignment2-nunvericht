//
//  CryptoItem.swift
//  Assignment2
//
//  Created by Nicholl Unvericht on 3/17/24.
//

import SwiftUI


struct CryptoItem: View {
    
    var item : ConvertModel<CryptoItemModel>
    
    var body: some View {
        HStack {
            Text(item.cardContent.cryptoName)
            Spacer()
            Text(String(item.cardContent.multiplier))
        }
    }
}
     
#Preview {
    CryptoItem(item: ConvertModel(cardContent: CryptoItemModel(cryptoName: "US Dollar", cryptoCode: "USD", multiplier: 65000)))
}
