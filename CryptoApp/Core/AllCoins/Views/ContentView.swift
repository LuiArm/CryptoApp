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
    
    var body: some View {
        VStack {
            Text("\(vm.coin): \(vm.price)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
