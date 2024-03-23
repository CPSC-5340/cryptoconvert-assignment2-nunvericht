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
    
    // this function will update the listview but does not have same behavior as instructional video.
    func updateCryptoItem(_ item: ConvertModel<CryptoItemModel>) -> ConvertModel<CryptoItemModel>? {
        guard let bitcoinAmount = Double(bitcoin) else {
            return item
        }
        let updatedMultiplier = item.cardContent.multiplier * bitcoinAmount
        let updatedItem =  ConvertModel(cardContent: CryptoItemModel(cryptoName: item.cardContent.cryptoName,
                                                                     cryptoCode: item.cardContent.cryptoCode,
                                                                     multiplier: updatedMultiplier))
        return updatedItem
    }
    
    // "getter" for cryptoName
    func getCryptoName (_ item: ConvertModel<CryptoItemModel>) -> String {
        return String(item.cardContent.cryptoName)
    }
    
    // "setter" for Value (multiplier * bitcoinAmount)
    func setValue (_ item: ConvertModel<CryptoItemModel>) -> String {
        guard let bitcoinAmount = Double(bitcoin) else {
            return String(updatedMultiplier * item.cardContent.multiplier)
        }
        let updatedValue = bitcoinAmount * item.cardContent.multiplier
        updatedMultiplier = bitcoinAmount
        return String(format: "%.2f", updatedValue)
    }
}
