//
//  CoinsViewModel.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/9/23.
//

import Foundation


final class CoinsViewModel: ObservableObject {
    
    
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init () {
        Task { try await fetchCoins() }
    }
    
    func fetchCoins() async throws {
        self.coins = try await service.fetchCoins()
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(5))
       
    }
}
    
    
    
    
    
    
    
    
    
    
//    func fetchCoinsWithCompletionHandler() {
//        service.fetchCoins { coins, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    self.errorMessage = error.localizedDescription
//                    return
//                }
//                self.coins = coins ?? []
//            }
//        }
        
//        service.fetchCoinsWithResult { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let coins):
//                    self?.coins = coins
//                case .failure(let error):
//                    self?.errorMessage = error.localizedDescription
//                }
//            }
//        }
//    }
    
 
    
