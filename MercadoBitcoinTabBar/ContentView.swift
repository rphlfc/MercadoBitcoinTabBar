//
//  ContentView.swift
//  MercadoBitcoinTabBar
//
//  Created by Raphael Cerqueira on 26/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTabBarIndex: Int = 0
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $selectedTabBarIndex) {
            Text("Início")
                .title()
                .tag(0)
            
            Text("Ativos")
                .title()
                .tag(1)
            
            Text("Movimentar BRL")
                .title()
                .tag(2)
            
            Text("Extrato")
                .title()
                .tag(3)
        }
        .overlay(
            VStack {
                Divider()
                    .padding(.bottom, 12)
                
                HStack(spacing: 0) {
                    ForEach(0 ..< tabItems.count) { i in
                        VStack {
                            ZStack {
                                if selectedTabBarIndex == i {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 45, height: 45)
                                        .foregroundColor(Color.orange.opacity(0.3))
                                        .matchedGeometryEffect(id: "tab", in: animation)
                                } else {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 45, height: 45)
                                        .foregroundColor(Color.clear)
                                }
                                
                                Image(systemName: tabItems[i].image)
                                    .font(.title)
                            }
                            
                            Spacer(minLength: 0)
                            
                            Text(tabItems[i].title)
                                .font(.caption)
                                .fontWeight(.medium)
                        }
                        .foregroundColor(selectedTabBarIndex == i ? Color.orange : Color("AccentColor"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .onTapGesture {
                            withAnimation(.spring(dampingFraction: 0.7)) {
                                selectedTabBarIndex = i
                            }
                        }
                    }
                }
            }
            .background(Color("TabBarBackgroundColor").ignoresSafeArea(.all, edges: .bottom))
            
            , alignment: .bottom
        )
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
    }
}

extension View {
    func title() -> some View {
        modifier(Title())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
