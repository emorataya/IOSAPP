//
//  NavBar.swift
//  CashTrack
//
//  Created by Edwin Morataya on 12/4/22.
//

import SwiftUI

struct NavBar: View {
    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    var body: some View {
        TabView {
            MainPageView().environmentObject(expenseViewModel)
                .tabItem(){
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                    Text("Home")
                }
            NewExpense().environmentObject(expenseViewModel)
                .fullScreenCover(isPresented: $expenseViewModel.addNewExpense)
                    {
                        expenseViewModel.clearData()
                    } content: {
                        NewExpense().environmentObject(expenseViewModel)
                    }
                .tabItem() {
                    Text("Add")
                        .onTapGesture{
                            print("Executed")
                            expenseViewModel.addNewExpense.toggle()
                        }
                }
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
