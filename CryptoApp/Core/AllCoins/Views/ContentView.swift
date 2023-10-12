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
            if let errorMessage = vm.errorMessage {
                Text("\(errorMessage)")
            }else {
                Text("\(vm.coin): \(vm.price)")
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
