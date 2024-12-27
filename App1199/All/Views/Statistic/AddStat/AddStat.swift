//
//  AddStat.swift
//  App1199
//
//  Created by IGOR on 23/12/2024.
//

import SwiftUI

struct AddStat: View {

    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New statistic")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.addStat()
                            
                            viewModel.stName = ""
                            viewModel.stNick = ""
                            viewModel.stWin = ""
                            viewModel.stLos = ""
                            viewModel.stKDA = ""
                            
                            viewModel.fetchStats()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddStat = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        })
                        .opacity(viewModel.stName.isEmpty || viewModel.stNick.isEmpty || viewModel.stWin.isEmpty || viewModel.stLos.isEmpty ? 0.3 : 1)
                        .disabled(viewModel.stName.isEmpty || viewModel.stNick.isEmpty || viewModel.stWin.isEmpty || viewModel.stLos.isEmpty ? true : false)
                    }
                }
                .padding(.bottom, 36)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text("Name players")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.stName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.stName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Players nickname")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.stNick.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.stNick)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Winning percentage")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.stWin.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.stWin)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Percentage of losses")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.stLos.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.stLos)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("K/DA")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.stKDA.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.stKDA)
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
    AddStat(viewModel: HomeViewModel())
}
