//
//  TopMoversView.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/18/23.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var vm: CoinsViewModel
    
    var body: some View {
        VStack {
            Text("Top Movers")
                .font(.title2)
            
            ScrollView(.horizontal){
                HStack(spacing: 14){
                    ForEach(vm.topMovingCoins){ coin in
                        TopMoversItemView(coin: coin)
                    }
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    TopMoversView()
//}
