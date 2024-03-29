//
//  TransactionCardView.swift
//  CashTrack
//
//  Created by Edwin Morataya on 11/13/22.
//

import SwiftUI

struct TransactionCardView: View {
    var expense: Transaction
    @EnvironmentObject var transactionViewModel: TransactionViewModel
    var body: some View {
        HStack(spacing: 12){
            
            //If expense image will be down arrow, and if income will be up arrow
            if (expense.type == .income) {
                Image(systemName: "arrow.up")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background{
                        Circle()
                            .fill(expense.type == .expense ? Color.red : Color("Green"))
                    }
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 5, y: 5)
            }
            else {
                Image(systemName: "arrow.down")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background{
                        Circle()
                            .fill(expense.type == .expense ? Color.red : Color("Green"))
                    }
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 5, y: 5)
            }

            Text(expense.description)
                .fontWeight(.semibold)
                .lineLimit(1)
                .frame(maxWidth: .infinity,alignment: .leading)
                .foregroundColor(.white)

            VStack(alignment: .trailing, spacing: 7) {
                let price = transactionViewModel.convertNumberToPrice(value: expense.type == .expense ? -expense.amount : expense.amount)
                Text(price)
                    .font(.callout)
                    //.opacity(0.7)
                    .foregroundColor(expense.type == .expense ? Color.red : Color("Green"))
                Text(expense.date.formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    //.opacity(0.5)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("Gray"))
        }
        .foregroundColor(.white)
    }
}
