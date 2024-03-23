//
//  CryptoConverterViewModel.swift
//  Assignment2
//
//  Created by Nicholl Unvericht on 3/17/24.
//

import Foundation

// class required for ObservableObject
class CryptoConverterViewModel : ObservableObject {
    
    @Published private(set) var listOfCrypto = [ConvertModel<CryptoItemModel>]()
    
    @Published var bitcoin: String = "1"
    
    var updatedMultiplier: Double = 1.0
    
    func fetchCrypto() {
        self.listOfCrypto = [
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "US Dollar", cryptoCode: "USD", multiplier: 62211.00)),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "Ethereum", cryptoCode: "ETH", multiplier: 18.34)),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "Tether", cryptoCode: "USDT", multiplier: 62164.75)),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "Binance", cryptoCode: "BNB", multiplier: 120.79)),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "USD Coin", cryptoCode: "USDC", multiplier: 62209.16)),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "XRP", cryptoCode: "XRP", multiplier: 106077.12))
        ]
    }
    
    // function for error checking out of index
    func findIndex(item: ConvertModel<CryptoItemModel>) -> Int? {
        for index in 0..<listOfCrypto.count {
            if item.id == listOfCrypto[index].id {
                return index
            }
        }
        return nil
    }
    
    // "getter" for cryptoName
    func getCryptoName (_ item: ConvertModel<CryptoItemModel>) -> String {
        return String(item.cardContent.cryptoName)
    }
    
    // "setter" for Value (multiplier * bitcoinAmount)  Performs error checking and stores the last valid value
    func setValue (_ item: ConvertModel<CryptoItemModel>) -> Double {
        guard let bitcoinAmount = Double(bitcoin) else {
            let updatedValue = updatedMultiplier * item.cardContent.multiplier
            return updatedValue
        }
        let updatedValue = bitcoinAmount * item.cardContent.multiplier
        updatedMultiplier = bitcoinAmount
        return updatedValue
    }
    
    // function to updateCryptoItem.  utilizes previous functions for error handling
    func updateCryptoItem(_ item: ConvertModel<CryptoItemModel>) -> ConvertModel<CryptoItemModel>? {
        
        guard let index = findIndex(item: item) else {
            return item
        }

        let updatedMultiplier = setValue(item)
        let cryptoName = getCryptoName(item)
        let updatedItem = ConvertModel(
            cardContent: CryptoItemModel(
                cryptoName: cryptoName,
                cryptoCode: item.cardContent.cryptoCode,
                multiplier: updatedMultiplier
            )
        )
        return updatedItem
    }
}
