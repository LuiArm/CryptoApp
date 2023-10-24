//
//  TopMoversItemView.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/18/23.
//

import SwiftUI

struct TopMoversItemView: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            // image
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(.orange)
                .padding(.bottom,8)
            
            // coin info
            HStack(spacing: 4) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text("$\(coin.currentPrice)")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            
            // coin percent change
            Text("+\(coin.priceChangePercentage24H)%")
                .font(.title2)
                .foregroundStyle(.green)
            
        }
        .frame(width: 140, height: 140)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray), lineWidth: 2)
        }
    }
}

//#Preview {
//    TopMoversItemView()
//}
