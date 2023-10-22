//
//  HomeView.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/18/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = CoinsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TopMoversView()
                
                Divider()
            
                AllCoinsView()
                
            }
            .navigationTitle("CRyPtO")
        }
        
    }
}

#Preview {
    HomeView()
}
