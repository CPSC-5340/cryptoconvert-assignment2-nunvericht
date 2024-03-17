//
//  CurrencyConverterViewModel.swift
//  Assignment2
//
//  Created by Nicholl Unvericht on 3/17/24.
//

import Foundation

// class required for ObservableObject
class CurrencyConverterViewModel : ObservableObject {
    
    @Published private(set) var listOfCards = [ConvertModel<CurrencyItemModel>]()
    
    func fetchCards() {
        self.listOfCards = [
            ConvertModel(cardContent: CurrencyItemModel(currencyName: "US Dollar", currencyCode: "USD", countryFlag: "🇺🇸", multiplier: 1)),
            ConvertModel(cardContent: CurrencyItemModel(currencyName: "Chinese Yuan", currencyCode: "CNY", countryFlag: "🇨🇳", multiplier: 7.20)),
            ConvertModel(cardContent: CurrencyItemModel(currencyName: "Canadian Dollar", currencyCode: "CAD", countryFlag: "🇨🇦", multiplier: 1.35)),
            ConvertModel(cardContent: CurrencyItemModel(currencyName: "Australian Dollar", currencyCode: "AUD", countryFlag: "🇦🇺", multiplier: 1.52)),
            ConvertModel(cardContent: CurrencyItemModel(currencyName: "Indian Rupee", currencyCode: "INR", countryFlag: "🇮🇳", multiplier: 82.88)),
            ConvertModel(cardContent: CurrencyItemModel(currencyName: "Chilean Peso", currencyCode: "CLP", countryFlag: "🇨🇱", multiplier: 941.43))
        ]
    }
    
    func flip(card: ConvertModel<CurrencyItemModel>) {
        if let index = findIndex(card: card) {
            listOfCards[index].isFront.toggle()
        }
    }
    
    func findIndex(card: ConvertModel<CurrencyItemModel>) -> Int? {
        for index in 0..<listOfCards.count {
            if card.id == listOfCards[index].id {
                return index
            }
        }
        return nil
    }
    
}
