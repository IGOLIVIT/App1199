//
//  AddBudget.swift
//  App1199
//
//  Created by IGOR on 23/12/2024.
//

import SwiftUI

struct AddBudget: View {

    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New budget planning")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.addBudget()
                            
                            viewModel.budName = ""
                            viewModel.budDescr = ""
                            viewModel.budAmount = ""
                            
                            viewModel.fetchBudgets()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddBudget = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        })
                        .opacity(viewModel.budName.isEmpty || viewModel.budDescr.isEmpty || viewModel.budAmount.isEmpty ? 0.3 : 1)
                        .disabled(viewModel.budName.isEmpty || viewModel.budDescr.isEmpty || viewModel.budAmount.isEmpty ? true : false)
                    }
                }
                .padding(.bottom, 36)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text("Transaction name")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.budName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.budName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Description of transaction")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.budDescr.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.budDescr)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Amount")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.budAmount.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.budAmount)
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
    AddBudget(viewModel: HomeViewModel())
}
