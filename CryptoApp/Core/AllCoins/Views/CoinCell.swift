//
//  CoinCell.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/21/23.
//

import SwiftUI

struct CoinCell: View {
    var body: some View {
        HStack{
            //market cap rank
            Text("1")
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
                Text("BitCoin")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                
                Text("BTC")
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            
            Spacer()
            
            
            // coin price info
            
            VStack(alignment: .leading, spacing: 4) {
                Text("$20,330.00")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                
                Text("-5.60%")
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

#Preview {
    CoinCell()
}
