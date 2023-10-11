//
//  CoinsViewModel.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/9/23.
//

import Foundation


final class CoinsViewModel: ObservableObject {
    
    @Published var coin = ""
    @Published var price = ""
    
    init () {
        fetchPrice(coin: "bitcoin")
    }
    
    func fetchPrice(coin: String) {
        //url in string format
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        //turn url into url object
        guard let url = URL(string: urlString) else {return}
     
        //dataTask running asynchronously, once load request is complete, the handler is execeuted on the delegate queue
        URLSession.shared.dataTask(with: url) { data, response, error in
           // data is raw data returned, need to parse json... response is a 200 if ok or 404 if something went wrong, error will return an error if there is one and nil if there is not
            
            //make sure we have data first before we move forward
            guard let data = data else { return }
            
            // parsing raw data into readable json as a dictionary
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            
            //casting value as dictionary
            guard let value = jsonObject[coin] as? [String: Double] else {return}
            
            // unwrapping price
            guard let price = value["usd"] else {return}
            
            //updating UI must be done from the main thread
            DispatchQueue.main.async {
                self.coin = coin.capitalized
                self.price = "$\(price)"
            }
            
            print(jsonObject)
        }.resume()
        
        
        print("Did reach end of function")
    }
}
