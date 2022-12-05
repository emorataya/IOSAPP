//
//  NavBar.swift
//  CashTrack
//
//  Created by Edwin Morataya on 12/4/22.
//

import SwiftUI

struct NavBar: View {
    @StateObject var transactionViewModel: TransactionViewModel = .init()
    @State private var tabSelection = 1
    var body: some View {
        TabView {
            MainPageView().environmentObject(transactionViewModel)
                .tabItem(){
                    Text("Home")
                }.tag(1)
            NewTransaction(tabSelection: $tabSelection).environmentObject(transactionViewModel)
                .tabItem() {
                    Text("Add") 
                }.tag(2)
        }.onAppear() {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            
            // correct the transparency bug for Navigation bars
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
        
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
