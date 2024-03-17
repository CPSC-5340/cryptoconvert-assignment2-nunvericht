//
//  ConvertModel.swift
//  Assignment2
//
//  Created by Nicholl Unvericht on 3/17/24.
//

import Foundation

// add generic <SomeType>
struct ConvertModel<SomeType> : Identifiable {
    let id = UUID()
    var isFront : Bool = true
    let cardContent : SomeType
}

struct CurrencyItemModel {
    let currencyName : String
    let currencyCode : String
    let countryFlag : String
    let multiplier : Double
}

struct CryptoItemModel {
    let cryptoName : String
    let cryptoCode : String
    let multiplier : Double
}
