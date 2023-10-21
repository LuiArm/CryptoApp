//
//  TopMoversView.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/18/23.
//

import SwiftUI

struct TopMoversView: View {
    var body: some View {
        VStack {
            Text("Top Movers")
                .font(.title2)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<10, id: \.self){ _ in
                        TopMoversItemView()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    TopMoversView()
}
