//
//  CookITApp.swift
//  CookIT
//
//  Created by Macbook on 21/09/2022.
//

import SwiftUI

@main
struct CookITApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
