//
//  ContentView.swift
//  CashTrack
//
//  Created by Edwin Morataya on 12/2/22.
//

import SwiftUI

struct MainPageView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var isFilter: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 14){
                ExpenseCard
                    .environmentObject(expenseViewModel)
                TransactionsView()
            }
        }
        .background{
            Color("Black")
                .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func AddButton()->some View{
        Button {
            expenseViewModel.addNewExpense.toggle()
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
                .frame(width: 55, height: 55)
                .background{
                    Circle()
                        .fill(.black)
//                        .fill(
//                            .linearGradient(colors: [
//                                Color("blue"),
//                                Color("red"),
//                                Color("yellow"),
//                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
//                        )
                }
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
        }
        .padding()
    }
    
    // MARK: Transactions View
    @ViewBuilder
    func TransactionsView()->some View{
        VStack(spacing: 15){
            Text("Transactions")
                .font(.title2.bold())
                .opacity(0.7)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.bottom)
            
            ForEach(expenseViewModel.expenses){expense in
                // MARK: Transaction Card View
                TransactionCardView(expense: expense)
                    .environmentObject(expenseViewModel)
            }
        }
        .padding(.top)
    }
}
struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}

extension MainPageView {

    var ExpenseCard: some View {
        
            GeometryReader{proxy in
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .background(Color.white)
                
                VStack(spacing: 15){
                    VStack(spacing: 15){
                        
                        // MARK: Current Month Expenses Price
                        Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expenses))
                            .font(.system(size: 35, weight: .bold))
                            .lineLimit(1)
                            .padding(.bottom,5)
                    }
                    .offset(y: 0)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
            .frame(width: 250, height: 145)
            .padding(.top)
        }
}

