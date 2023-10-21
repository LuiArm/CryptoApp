//
//  TopMoversItemView.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/18/23.
//

import SwiftUI

struct TopMoversItemView: View {
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
                Text("BTC")
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text("$20,333.00")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            
            // coin percent change
            Text("+ 5.60%")
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

#Preview {
    TopMoversItemView()
}
