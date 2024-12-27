//
//  HomeView.swift
//  App1199
//
//  Created by IGOR on 20/12/2024.
//

import SwiftUI
import StoreKit

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                if viewModel.nameTeam.isEmpty {
                    
                    Text("Name your team")
                        .foregroundColor(.white.opacity(0.2))
                        .font(.system(size: 26, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)

                } else {
                    
                    Text(viewModel.nameTeam)
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                }
                
                Text("Dota 2")
                    .foregroundColor(.white)
                    .font(.system(size: 23, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 6)
                
                HStack {
                    
                    Image(systemName: "person.3.fill")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 17, weight: .regular))
                    
                    Text("\(viewModel.subs)")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    Image(systemName: "banknote.fill")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 17, weight: .regular))
                    
                    Text("\(viewModel.Income)")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    Spacer()
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isEdit = true
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
                .padding(.bottom, 50)
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isTeam = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "person.2.fill")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 22, weight: .regular))
                        
                        VStack (alignment: .leading, spacing: 1) {
                            
                            Text("Team management")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Track your team")
                                .foregroundColor(.white.opacity(0.2))
                                .font(.system(size: 15, weight: .regular))
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                    }
                })
                
                Rectangle()
                    .fill(.white.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.vertical, 6)
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isStat = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "chart.line.uptrend.xyaxis")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 22, weight: .regular))
                        
                        VStack (alignment: .leading, spacing: 1) {
                            
                            Text("Team statistics")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Keep a record of wins/losses")
                                .foregroundColor(.white.opacity(0.2))
                                .font(.system(size: 15, weight: .regular))
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                    }
                })
                
                Rectangle()
                    .fill(.white.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.vertical, 6)
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isBudget = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "creditcard.fill")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 22, weight: .regular))
                        
                        VStack (alignment: .leading, spacing: 1) {
                            
                            Text("Budget planning")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Plan a budget for team")
                                .foregroundColor(.white.opacity(0.2))
                                .font(.system(size: 15, weight: .regular))
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                    }
                })
                
                Rectangle()
                    .fill(.white.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                Spacer()
                
                VStack(spacing: 10) {
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/fd611722-4677-469f-a021-badc1344b7f3") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "list.bullet.clipboard.fill")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 22, weight: .regular))

                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .medium))
                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 22, weight: .regular))

                                Text("Rate app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .medium))
                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    })
                    
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isEdit, content: {
            
            EditHome(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isTeam, content: {
            
            TeamView(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isStat, content: {
            
            StatisticsView(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isBudget, content: {
            
            BudgetView(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
