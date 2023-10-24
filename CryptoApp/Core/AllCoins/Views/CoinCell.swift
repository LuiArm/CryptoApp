//
//  CoinCell.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/21/23.
//

import SwiftUI

struct CoinCell: View {
    let coin: Coin
    
    var body: some View {
        HStack{
            //market cap rank
            Text("\(coin.marketCapRank ?? 1,specifier: "%.2f")")
                .font(.caption)
                .foregroundStyle(.gray)
            
            
            //image
            Image(systemName: "bitcoinsign.circle.fill")
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
            
            VStack(alignment: .leading, spacing: 4) {
                Text("$\(coin.currentPrice,specifier: "%.2f")")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                
                Text("\(coin.priceChangePercentage24H,specifier: "%.2f")%")
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundStyle(.red)
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
