//
//  Navigator.swift
//  Road2F1
//
//  Created by Hussain Alkatheri on 10/18/25.
//

import SwiftUI

struct NavigatorView: View {
    var body: some View {
        TabView {
            InventoryView()
                .tabItem {
                    Label("Inventory", systemImage: "cube.fill")
                }
            ViewFinder(modelName: "toy_car")
                .ignoresSafeArea(.all)
                .tabItem {
                    Label("AR", systemImage: "camera.viewfinder")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
            ContentView()
                .tabItem {
                    Label("login", systemImage: "gearshape.fill")
                }
            SupabaseView()
                .tabItem {
                    Label("Supabase", systemImage: "gearshape.fill")
                }
            
//            NavigationLink(destination: ProfileView()) {
//                Text("Profile")
//            }
//            NavigationLink(destination: ContentView()) {
//                Text("Leaderboard")
//            }
        }
    }
}


#Preview {
    NavigatorView()
}
