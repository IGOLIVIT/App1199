//
//  BudgetView.swift
//  App1199
//
//  Created by IGOR on 20/12/2024.
//

import SwiftUI

struct BudgetView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Budget planning")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isBudget = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                            
                        })
                        
                        Spacer()
                        
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddBudget = true
                            }
                            
                        }, label: {
                            
                            Text("New")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .semibold))
                        })
                    }
                }
                .padding(.bottom, 30)
                
                HStack {
                    
                    Image(systemName: "bag.fill.badge.plus")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 17, weight: .regular))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text("Winning")
                            .foregroundColor(.white.opacity(0.3))
                        
                        Text("$\(viewModel.amountWinning)")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                    }
                    
                    Spacer()
                    
                    Image(systemName: "cart.badge.minus")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 17, weight: .regular))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text("Other expenses")
                            .foregroundColor(.white.opacity(0.3))
                        
                        Text("$\(viewModel.amountExpenses)")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                    }
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isEditBudget = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "pencil")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Edit")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                })
                .padding(.bottom, 26)
                
                if viewModel.budgets.isEmpty {
                    
                    VStack(spacing: 12) {
                        
                        Image(systemName: "creditcard.fill")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 42, weight: .regular))
                        
                        Text("Keep a team budget")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddBudget = true
                            }
                            
                        }, label: {
                            
                            Text("+ Add budget")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                        })
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.budgets, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        VStack (alignment: .leading, spacing: 5) {
                                            
                                            Text(index.budName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .regular))
                                            
                                            Text(index.budDescr ?? "")
                                                .foregroundColor(.white.opacity(0.2))
                                                .font(.system(size: 15, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Text("$\(index.budAmount ?? "")")
                                            .foregroundColor(.white.opacity(0.3))
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedBudget = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDeleteBudget = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "trash.fill")
                                                .foregroundColor(.red)
                                                .font(.system(size: 16, weight: .regular))
                                        })
                                        .padding(.leading, 5)
                                    }
                                
                                Rectangle()
                                    .fill(.white.opacity(0.2))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isEditBudget, content: {
            
            EditBudget(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteBudget ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteBudget = false
                        }
                    }
                
                VStack(spacing: 19) {

                    Text("Delete budget planning")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("This will result in the loss of budget information. Are you sure?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteBudget(withBudName: viewModel.selectedBudget?.budName ?? "", completion: {
                                
                                viewModel.fetchBudgets()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteBudget = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        .padding(.top, 25)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteBudget = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDeleteBudget ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isAddBudget, content: {
            
            AddBudget(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchBudgets()
        }
    }
}

#Preview {
    BudgetView(viewModel: HomeViewModel())
}
