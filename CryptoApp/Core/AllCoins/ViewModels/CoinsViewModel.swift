//
//  CoinsViewModel.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/9/23.
//

import Foundation


final class CoinsViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    
    private let service = CoinDataService()
    
    init () {
     fetchCoins()
    }
    
    func fetchCoins() {
        service.fetchCoins { coins in
            DispatchQueue.main.async {
                self.coins = coins
            }
        }
    }
    
    
//    func fetchPrice(coin: String) {
//        service.fetchPrice(coin: coin) { priceFromService in
//            DispatchQueue.main.async {
//                self.price = "$\(priceFromService)"
//                self.coin = coin
//            }
//        }
//    }
    
}
