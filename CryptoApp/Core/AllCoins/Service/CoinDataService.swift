//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/11/23.
//

import Foundation

class CoinDataService {
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h&locale=en"
  
    func fetchCoins() async throws -> [Coin] {
        guard let url = URL(string: urlString) else { return [] }
      
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let coins = try JSONDecoder().decode([Coin].self, from: data)
            return coins
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            return []
            
        }
        
    }
}




































// MARK: - Completion Handlers


extension CoinDataService {
    
    func fetchCoinsWithResult(completion: @escaping (Result<[Coin], CoinAPIError>)-> Void) {
        
        
        guard let url = URL(string: urlString) else { return }
      
        
        URLSession.shared.dataTask(with: url) {data, response , error in
            if let error = error {
                completion(.failure(.unknownError(error: error)))
            }
            
           
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(.requestFailed(description: "Request Failed")))
                    return
                }
   
                guard httpResponse.statusCode == 200 else {
                    completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                    return
                }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                completion(.success(coins))
            } catch {
                print("DEBUG: Failed to decode with error \(error)")
                completion(.failure(.jsonParsingFailure))
            }
            
        }.resume()
    }
    
    
    
//
//    func fetchCoins(completion: @escaping ([Coin]?, Error?)-> Void) {
//        let urlString = "https://ap.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en"
//
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) {data, response , error in
//            if let error = error {
//                completion(nil, error)
//            }
//            guard let data = data else { return }
//
//
//            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else {
//                print("failed to decode coins")
//                return
//            }
//
//
//            completion(coins, nil)
//        }.resume()
//
//
//    }
    
    
    func fetchPrice(coin: String, completion: @escaping(Double) -> Void)  {
        //url in string format
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        //turn url into url object
        guard let url = URL(string: urlString) else {return}
     
        //dataTask running asynchronously, once load request is complete, the handler is execeuted on the delegate queue
        URLSession.shared.dataTask(with: url) { data, response, error in
            //updating UI must be done from the main thread
            
            //Check error first so we dont have to move forward if we do have an error
            if let error = error {
                print("DEBUG: Failed with error \(error.localizedDescription)")
                //set error var to description of error if we have one
//                self.errorMessage = error.localizedDescription
                return
            }
            
            //check if we are getting a response if not stop here
                guard let httpResponse = response as? HTTPURLResponse else {
//                    self.errorMessage = "Bad HTTP response"
                    return
                }
                
           // making sure response is a 200
                guard httpResponse.statusCode == 200 else {
//                    self.errorMessage = "Failed with status code \(httpResponse.statusCode)"
                    return
                }
                
           // data is raw data returned, need to parse json... response is a 200 if ok or 404 if something went wrong, error will return an error if there is one and nil if there is not
            
            //make sure we have data first before we move forward
            guard let data = data else { return }
            
            // parsing raw data into readable json as a dictionary
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            
            //casting value as dictionary
            guard let value = jsonObject[coin] as? [String: Double] else {return}
            
            // unwrapping price
            guard let price = value["usd"] else {return}
            
          
//                self.coin = coin.capitalized
//                self.price = "$\(price)"
                print("DEBUG: price in service class \(price)")
                completion(price)
        }.resume()
    }
    
}
