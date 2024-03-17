//
//  CurrencyItem.swift
//  Assignment2
//
//  Created by Nicholl Unvericht on 3/17/24.
//

import SwiftUI

struct CurrencyItem: View {
    
    var card : ConvertModel<CurrencyItemModel>
    
    var body: some View {
        if card.isFront {
            FrontCurrencyItem(card: card.cardContent)
        }
        else {
            BackCurrencyItem(card: card.cardContent)
        }
    }
}


struct FrontCurrencyItem: View {
    
    var card : CurrencyItemModel
    
    var body: some View {
        VStack {
            HStack {
                Text(card.countryFlag)
                Spacer()
            }
            HStack {
                Spacer()
                Text(card.currencyCode)
            }
        }
        .frame(width: 130, height: 130)
        .padding()
        .background(.blue)
    }
}

struct BackCurrencyItem: View {
    
    var card : CurrencyItemModel
    
    var body: some View {
        VStack {
            HStack {
                Text(card.currencyName)
                Spacer()
            }
            HStack {
                Spacer()
                Text(String(card.multiplier))
            }
        }
        .frame(width: 130, height: 130)
        .padding()
        .background(.blue)
    }
}


#Preview {
    CurrencyItem(card: ConvertModel(cardContent: CurrencyItemModel(currencyName: "Chilean Peso", currencyCode: "CLP", countryFlag: "🇨🇱", multiplier: 941.43)))
}

