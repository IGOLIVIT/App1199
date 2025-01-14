//
//  StatisticsView.swift
//  App1199
//
//  Created by IGOR on 20/12/2024.
//

import SwiftUI

struct StatisticsView: View {

    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Team statistacs")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isStat = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                            
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddStat = true
                            }
                            
                        }, label: {
                            
                            Text("New")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .semibold))
                        })
                    }
                }
                .padding(.bottom, 26)
                
                if viewModel.statistics.isEmpty {
                    
                    VStack(spacing: 12) {
                        
                        Image(systemName: "person.2.fill")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 42, weight: .regular))
                        
                        Text("Start keeping statistics on players")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 50)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddStat = true
                            }
                            
                        }, label: {
                            
                            Text("+ Add statistics")
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
                            
                            ForEach(viewModel.statistics, id: \.self) { index in
                                    
                                    VStack(spacing: 15) {
                                        
                                        ZStack {
                                            
                                            HStack {
                                                
                                                Text(index.stName ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 22, weight: .semibold))
                                                
                                                Text("(\(index.stNick ?? ""))")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 20, weight: .medium))
                                            }
                                         
                                            HStack {
                                                
                                                Spacer()
                                                
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedStat = index
                                                    
                                                    withAnimation(.spring()) {
                                                        
                                                        viewModel.isDeleteStat = true
                                                    }
                                                    
                                                }, label: {
                                                    
                                                    Image(systemName: "trash.fill")
                                                        .foregroundColor(.red)
                                                        .font(.system(size: 16, weight: .regular))
                                                })
                                            }
                                        }
                                        
                                        HStack {
                                            
                                            Image(systemName: "arrow.up")
                                                .foregroundColor(.black)
                                                .font(.system(size: 12, weight: .semibold))
                                                .padding(5)
                                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                                            
                                            Text("\(index.stWin ?? "")%")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Image(systemName: "arrow.down")
                                                .foregroundColor(.black)
                                                .font(.system(size: 12, weight: .semibold))
                                                .padding(5)
                                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                                            
                                            Text("\(index.stLos ?? "")%")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Image(systemName: "arrow.up.arrow.down")
                                                .foregroundColor(.black)
                                                .font(.system(size: 12, weight: .semibold))
                                                .padding(5)
                                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                                            
                                            Text("\(index.stKDA ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                        }
                                    }
                                    .padding(20)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                    
                            }
                            
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchStats()
        }
        .sheet(isPresented: $viewModel.isAddStat, content: {
            
            AddStat(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteStat ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteStat = false
                        }
                    }
                
                VStack(spacing: 19) {

                    Text("Delete statistics")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("This will result in the loss of player stats. Are you sure?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteStat(withStName: viewModel.selectedStat?.stName ?? "", completion: {
                                
                                viewModel.fetchStats()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteStat = false
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
                                
                                viewModel.isDeleteStat = false
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
                .offset(y: viewModel.isDeleteStat ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    StatisticsView(viewModel: HomeViewModel())
}
