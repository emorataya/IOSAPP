//
//  NavBar.swift
//  CashTrack
//
//  Created by Edwin Morataya on 12/4/22.
//

import SwiftUI

struct NavBar: View {
    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    @State private var tabSelection = 1
    var body: some View {
        TabView {
            MainPageView().environmentObject(expenseViewModel)
                .tabItem(){
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                    
                    Text("Home")
                }.tag(1)
            NewExpense(tabSelection: $tabSelection).environmentObject(expenseViewModel)
                .tabItem() {
                    Text("Add")
                        .onTapGesture{
                            expenseViewModel.addNewExpense.toggle()
                        }
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
