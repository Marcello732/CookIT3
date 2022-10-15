//
//  HomeView.swift
//  CookIT
//
//  Created by Macbook on 15/10/2022.
//

import SwiftUI

struct HomeView: View {
    @State var noLoginView = false
    var body: some View {
        VStack {
            if self.noLoginView {
                ContentView()
            } else {
                SingInUp(noLoginView: $noLoginView)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
