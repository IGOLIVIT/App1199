//
//  TeamView.swift
//  App1199
//
//  Created by IGOR on 20/12/2024.
//

import SwiftUI

struct TeamView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Team management")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTeam = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                            
                        })

                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddTeam = true
                            }
                            
                        }, label: {
                            
                            Text("New")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .semibold))
                        })
                    }
                }
                .padding(.bottom, 26)
                
                if viewModel.players.isEmpty {
                    
                    VStack(spacing: 12) {
                        
                        Image(systemName: "person.2.fill")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 42, weight: .regular))
                        
                        Text("Create your team")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddTeam = true
                            }
                            
                        }, label: {
                            
                            Text("+ Add players")
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
                            
                            ForEach(viewModel.players, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        Image("profile")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 22, weight: .regular))
                                            .padding(.trailing)
                                        
                                        VStack (alignment: .leading, spacing: 5) {
                                            
                                            HStack {
                                                
                                                Text(index.plName ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .regular))
                                                
                                                Text("(\(index.plNick ?? ""))")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 16, weight: .regular))
                                                
                                            }
                                            
                                            Text(index.plChar ?? "")
                                                .foregroundColor(.white.opacity(0.2))
                                                .font(.system(size: 15, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Text(index.plPos ?? "")
                                            .foregroundColor(.white.opacity(0.3))
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedPlayer = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDeleteTeam = true
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
        .onAppear {
            
            viewModel.fetchPlayers()
        }
        .sheet(isPresented: $viewModel.isAddTeam, content: {
            
            AddTeam(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteTeam ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteTeam = false
                        }
                    }
                
                VStack(spacing: 19) {

                    Text("Delete players")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("This will result in the loss of the player. Are you sure?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteTeam(withPlName: viewModel.selectedPlayer?.plName ?? "", completion: {
                                
                                viewModel.fetchPlayers()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteTeam = false
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
                                
                                viewModel.isDeleteTeam = false
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
                .offset(y: viewModel.isDeleteTeam ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    TeamView(viewModel: HomeViewModel())
}
