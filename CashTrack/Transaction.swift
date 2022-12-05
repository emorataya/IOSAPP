//
//  Transaction.swift
//  CashTrack
//
//  Created by Edwin Morataya on 11/13/22.
//

import Foundation

import SwiftUI

struct Transaction: Identifiable,Hashable{
    var id = UUID().uuidString
    var description: String
    var amount: Double
    var date: Date
    var type: ExpenseType
}

enum ExpenseType: String{
    case income = "Income"
    case expense = "expenses"
    case all = "ALL"
}

var sample_expenses: [Transaction] = [
    Transaction(description: "Stocks", amount: 2599, date: Date(timeIntervalSince1970: 1652036845), type: .income),
    Transaction(description: "In App Purchase", amount: 499, date: Date(timeIntervalSince1970: 1651864045), type: .income),
    Transaction(description: "Movie Ticket", amount: 99, date: Date(timeIntervalSince1970: 1651691245), type: .expense)
]
