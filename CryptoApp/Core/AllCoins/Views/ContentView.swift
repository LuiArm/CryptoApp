//
//  ContentView.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/9/23.
//

import SwiftUI

struct ContentView: View {
    //create instance of view model
    @StateObject var vm = CoinsViewModel()
    
//    var body: some View {
//        List {
//            ForEach(vm.coins){coin in
//                HStack(spacing: 12){
//                    Text("\(coin.marketCapRank)")
//                        .foregroundStyle(.gray)
//                    
//                    VStack(alignment: .leading, spacing: 4){
//                        Text(coin.name)
//                        fontWeight(.semibold)
//                        
//                        Text(coin.symbol.uppercased())
//                    }
//                }
//                .font(.footnote)
//            }
//        }
//        .overlay {
//            if let error = vm.errorMessage {
//                Text(error)
//            }
//        }
//    }
//}










#Preview {
    ContentView()
}
