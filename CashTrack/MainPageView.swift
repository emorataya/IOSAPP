//
//  MainPageView.swift
//  CashTrack
//
//  Created by Edwin Morataya on 11/13/22.
//

import SwiftUI

struct MainPageView: View {
    @EnvironmentObject var transactionViewModel: TransactionViewModel
    var isFilter: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 14){
                TransactionCard
                    .environmentObject(transactionViewModel)
                TransactionsView()
            }
        }
        .background{
            Color("DarkGray")
                .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func TransactionsView()->some View{
        VStack(spacing: 15){
            Text("Transactions")
                .font(.title2.bold())
                //.opacity(0.7)
                .frame(maxWidth: .infinity,alignment: .center)
                .padding(.bottom)
                .foregroundColor(.white)

            
            ForEach(transactionViewModel.expenses){expense in
                TransactionCardView(expense: expense)
                    .environmentObject(transactionViewModel)
            }
        }
        .padding(.top)
    }
}

extension MainPageView {
    var TransactionCard: some View {
            GeometryReader{transaction in
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .background(Color("DarkGray"))
                    VStack(spacing: 15){
                        Text(transactionViewModel.convertExpensesToCurrency(expenses: transactionViewModel.expenses))
                            .font(.system(size: 40, weight: .bold))
                            .lineLimit(1)
                            .padding(.bottom,5)
                    }
                    .offset(y: 0)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
            .frame(width: 250, height: 145)
            .padding(.top)
        }
}

