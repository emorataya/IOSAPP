//
//  Expense.swift
//  CashTrack
//
//  Created by Edwin Morataya on 12/2/22.
//

import Foundation

import SwiftUI

// MARK: Expense Model And Sample Data
struct Expense: Identifiable,Hashable{
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
}

enum ExpenseType: String{
    case income = "Income"
    case expense = "expenses"
    case all = "ALL"
}

var sample_expenses: [Expense] = [
//    Expense(remark: "Stocks", amount: 2599, date: Date(timeIntervalSince1970: 1652036845), type: .income, color: "Purple"),
//    Expense(remark: "In App Purchase", amount: 499, date: Date(timeIntervalSince1970: 1651864045), type: .income, color: "Red"),
//    Expense(remark: "Movie Ticket", amount: 99, date: Date(timeIntervalSince1970: 1651691245), type: .expense, color: "Yellow"),
//    Expense(remark: "Apple Music", amount: 25, date: Date(timeIntervalSince1970: 1651518445), type: .expense, color: "Green"),
//    Expense(remark: "Snacks", amount: 49, date: Date(timeIntervalSince1970: 1651432045), type: .expense, color: "Purple"),
]
