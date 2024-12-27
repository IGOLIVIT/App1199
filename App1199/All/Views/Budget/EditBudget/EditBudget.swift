//
//  EditBudget.swift
//  App1199
//
//  Created by IGOR on 23/12/2024.
//

import SwiftUI

struct EditBudget: View {

    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Edit")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.amountWinning = Int(viewModel.addamountWinning) ?? 0
                            viewModel.amountExpenses = Int(viewModel.addamountExpenses) ?? 0
                            
                            viewModel.addamountWinning = ""
                            viewModel.addamountExpenses = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditBudget = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        })
                    }
                }
                .padding(.bottom, 36)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {

                        Text("Amount winning")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addamountWinning.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addamountWinning)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Amount Expenses")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addamountExpenses.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addamountExpenses)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color("prim")))
                        .padding(1)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    EditBudget(viewModel: HomeViewModel())
}
