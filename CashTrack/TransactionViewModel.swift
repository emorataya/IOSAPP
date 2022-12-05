//
//  TransactionViewModel.swift
//  CashTrack
//
//  Created by Edwin Morataya on 11/13/22.
//

import SwiftUI

class TransactionViewModel: ObservableObject{
    @Published var addNewExpense: Bool = false
    @Published var amount: String = ""
    @Published var type: ExpenseType = .all
    @Published var date: Date = Date()
    @Published var remark: String = ""

    @Published var expenses: [Transaction] = sample_expenses
    
    func convertExpensesToCurrency(expenses: [Transaction],type: ExpenseType = .all)->String{
        var value: Double = 0
        value = expenses.reduce(0, { partialResult, expense in
            return partialResult + (type == .all ? (expense.type == .income ? expense.amount : -expense.amount) : (expense.type == type ? expense.amount : 0))
        })
        
        return convertNumberToPrice(value: value)
    }
    
    func convertNumberToPrice(value: Double)->String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: .init(value: value)) ?? "$0.00"
    }
    
    func clearData(){
        date = Date()
        type = .all
        remark = ""
        amount = ""
    }
    
    func saveData(env: EnvironmentValues){
        print("Save")
        let amountInDouble = (amount as NSString).doubleValue
        let expense = Transaction(description: remark, amount: amountInDouble, date: date, type: type)
        expenses.append(expense)
        clearData()
        expenses = expenses.sorted(by: { first, scnd in
            return scnd.date < first.date
        })
    }
}
