//
//  AllCoinsView.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/21/23.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var vm: CoinsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack {
                Text("Coin")
                
                Spacer()
                
                Text("Prices")
            }
            .foregroundStyle(.gray)
            .font(.caption)
            .padding(.horizontal)
            
            ScrollView{
                VStack{
                    ForEach(vm.coins) { coin in
                        CoinCell(coin: coin)
                    }
                }
            }
          
        }
        
    }
}

//#Preview {
//    AllCoinsView()
//}
