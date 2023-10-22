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
            ScrollView {
                TopMoversView()
                
                Divider()
            
                
            }
            .navigationTitle("CRyPtO")
        }
        
    }
}

#Preview {
    HomeView()
}
