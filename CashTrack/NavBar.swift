//
//  NavBar.swift
//  CashTrack
//
//  Created by Edwin Morataya on 12/4/22.
//

import SwiftUI

struct NavBar: View {
    init(){
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    @StateObject var transactionViewModel: TransactionViewModel = .init()
    @State private var tabSelection = 1
    var body: some View {
        TabView {
            Group{
                MainPageView().environmentObject(transactionViewModel)
                    .tabItem(){
                        Label("Home", systemImage: "house")
                    }.tag(1)
                NewTransaction(tabSelection: $tabSelection).environmentObject(transactionViewModel)
                    .tabItem() {
                        Label("Add", systemImage: "plus")
                    }.tag(2)
            }
        }
        .accentColor(tabSelection == 1 ? Color("Green"): .white)
        .id(tabSelection)
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
