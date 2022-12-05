//
//  NewTransaction.swift
//  CashTrack
//
//  Created by Edwin Morataya on 11/13/22.
//

import SwiftUI

struct NewTransaction: View {
    @Binding var tabSelection: Int
    @EnvironmentObject var transactionViewModel: TransactionViewModel
    @Environment(\.self) var env
    var body: some View {
        VStack{
            VStack(spacing: 15){
                Text("Add transaction")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .opacity(0.5)
                
                if let symbol = transactionViewModel.convertNumberToPrice(value: 0).first{
                    TextField("0", text: $transactionViewModel.amount)
                        .font(.system(size: 35))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background{
                            Text(transactionViewModel.amount == "" ? "0" : transactionViewModel.amount)
                                .font(.system(size: 35))
                                .opacity(0)
                                .overlay(alignment: .leading) {
                                    Text(String(symbol))
                                        .opacity(0.5)
                                        .offset(x: -15, y: 5)
                                }
                        }
                        .padding(.vertical,10)
                        .frame(maxWidth: .infinity)
                        .background{
                            Capsule()
                                .fill(.gray)
                        }
                        .padding(.horizontal,20)
                        .padding(.top)
                }
                
                Label {
                    TextField("Description",text: $transactionViewModel.remark)
                        .padding(.leading,10)
                } icon: {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                .padding(.vertical,20)
                .padding(.horizontal,15)
                .background{
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                .padding(.top,25)
                
                Label {
                    CustomCheckboxes()
                } icon: {
                    Image(systemName: "arrow.up.arrow.down")
                        .foregroundColor(.gray)
                }
                .padding(.vertical,20)
                .padding(.horizontal,15)
                .background{
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                .padding(.top,5)
                
                Label {
                    DatePicker.init("", selection: $transactionViewModel.date,in: Date.distantPast...Date(),displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading,10)
                } icon: {
                    Image(systemName: "calendar")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                .padding(.vertical,20)
                .padding(.horizontal,15)
                .background{
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                .padding(.top,5)
            }
            .frame(maxHeight: .infinity,alignment: .center)
            
            Button(action: {transactionViewModel.saveData(env: env)
                self.tabSelection = 1
            }) {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.vertical,15)
                    .frame(maxWidth: .infinity)
                    .background{
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(.black)
                    }
                    .foregroundColor(.white)
                    .padding(.bottom,10)
            }
            .disabled(transactionViewModel.remark == "" || transactionViewModel.type == .all || transactionViewModel.amount == "")
            .opacity(transactionViewModel.remark == "" || transactionViewModel.type == .all || transactionViewModel.amount == "" ? 0.6 : 1)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Color.gray
                .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func CustomCheckboxes()->some View{
        HStack(spacing: 10){
            ForEach([ExpenseType.income,ExpenseType.expense],id: \.self){type in
                ZStack{
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.black,lineWidth: 2)
                        .opacity(0.5)
                        .frame(width: 20, height: 20)
                    
                    if transactionViewModel.type == type{
                        Image(systemName: "checkmark")
                            .font(.caption.bold())
                            .foregroundColor(.green)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    transactionViewModel.type = type
                }
                
                Text(type.rawValue.capitalized)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .opacity(0.7)
                    .padding(.trailing,10)
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.leading,10)
    }
}
