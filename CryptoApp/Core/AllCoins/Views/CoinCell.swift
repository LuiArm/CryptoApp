//
//  CoinCell.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/21/23.
//

import SwiftUI
import Kingfisher

struct CoinCell: View {
    let coin: Coin
    
    var body: some View {
        HStack{
            //market cap rank
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundStyle(.gray)
            
            
            //image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundStyle(.orange)
            
            
            // coin name info
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            
            Spacer()
            
            
            // coin price info
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("$\(coin.currentPrice,specifier: "%.2f")")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                
                Text("\(coin.priceChangePercentage24H,specifier: "%.2f")%")
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundStyle(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//#Preview {
//    CoinCell()
//}
