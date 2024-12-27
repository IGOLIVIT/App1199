//
//  EditHome.swift
//  App1199
//
//  Created by IGOR on 20/12/2024.
//

import SwiftUI

struct EditHome: View {
    
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
                            
                            viewModel.nameTeam = viewModel.addnameTeam
                            viewModel.Income = Int(viewModel.addIncome) ?? 0
                            viewModel.subs = Int(viewModel.addSubs) ?? 0
                            
                            viewModel.addSubs = ""
                            viewModel.addnameTeam = ""
                            viewModel.addIncome = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEdit = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        })
                        .opacity(viewModel.addnameTeam.isEmpty || viewModel.addSubs.isEmpty || viewModel.addIncome.isEmpty ? 0.3 : 1)
                        .disabled(viewModel.addnameTeam.isEmpty || viewModel.addSubs.isEmpty || viewModel.addIncome.isEmpty ? true : false)
                    }
                }
                .padding(.bottom, 36)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text("Name your team")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addnameTeam.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addnameTeam)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Subscribers")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addSubs.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addSubs)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Income")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addIncome.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addIncome)
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
    EditHome(viewModel: HomeViewModel())
}
