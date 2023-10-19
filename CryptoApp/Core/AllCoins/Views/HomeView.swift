//
//  HomeView.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/18/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<10){
                        Text("HOME VIEW \($0)")
                    }
                }
            }
            .navigationTitle("LIVE PRICES")
        }
    }
}

#Preview {
    HomeView()
}
