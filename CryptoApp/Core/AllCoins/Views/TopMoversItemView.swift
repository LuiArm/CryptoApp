//
//  TopMoversItemView.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/18/23.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            // image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(.orange)
                .padding(.bottom,8)
            
            // coin info
            HStack(spacing: 4) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text("$\(coin.currentPrice, specifier: "%.2f")")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            
            // coin percent change
            Text("\(coin.priceChangePercentage24H, specifier: "%.2f")%")
                .font(.title2)
                .foregroundStyle(coin.priceChangePercentage24H > 0 ? .green : .red)
            
        }
        .frame(width: 140, height: 140)
        .background(Color("ItemBackgroundColor"))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray), lineWidth: 2)
        }
    }
}

//#Preview {
//    TopMoversItemView()
//}
