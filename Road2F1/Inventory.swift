//
//  Inventory.swift
//  Road2F1
//
//  Created by Hussain Alkatheri on 10/18/25.
//

import SwiftUI
import Supabase
import Foundation

struct SheetView: View {
    @Binding var car1: Double
    @Binding var car2: Double
    @Binding var car3: Double
    @Environment(\.dismiss) var dismiss
    
    
    
    @State var profile: User = .init(id: .init(uuidString: "00000000-0000-0000-0000-000000000000")!, email: "", username: "", display_name: "", unlocked_cars: [], fastest_lap: nil, total_races: 0, created_at: .now, updated_at: .now)

    var body: some View {
        Button("add 1"){
            Task {
                let currentUser = try await supabase.auth.session.user

                var user: User =
                try await supabase
                  .from("users")
                  .select()
                  .eq("id", value: currentUser.id)
                  .single()
                  .execute()
                  .value
                if !user.unlocked_cars.contains(UUID(uuidString: "00000000-0000-0000-0000-000000000001")!){
                    user.unlocked_cars.append(UUID(uuidString: "00000000-0000-0000-0000-000000000001")!)
                }
                try await supabase.from("users")
                    .update(user)
                    .eq("id", value: currentUser.id)
                    .execute()
                car1 = 0.0
            }
        }
        Button("add 2"){
            Task {
                let currentUser = try await supabase.auth.session.user

                var user: User =
                try await supabase
                  .from("users")
                  .select()
                  .eq("id", value: currentUser.id)
                  .single()
                  .execute()
                  .value
                if !user.unlocked_cars.contains(UUID(uuidString: "00000000-0000-0000-0000-000000000002")!){
                    user.unlocked_cars.append(UUID(uuidString: "00000000-0000-0000-0000-000000000002")!)
                }
                try await supabase.from("users")
                    .update(user)
                    .eq("id", value: currentUser.id)
                    .execute()
                car2 = 0.0
            }
        }
        Button("add 3"){
            Task {
                let currentUser = try await supabase.auth.session.user

                var user: User =
                try await supabase
                  .from("users")
                  .select()
                  .eq("id", value: currentUser.id)
                  .single()
                  .execute()
                  .value
                if !user.unlocked_cars.contains(UUID(uuidString: "00000000-0000-0000-0000-000000000003")!){
                    user.unlocked_cars.append(UUID(uuidString: "00000000-0000-0000-0000-000000000003")!)
                }
                try await supabase.from("users")
                    .update(user)
                    .eq("id", value: currentUser.id)
                    .execute()
                car3 = 0.0
            }
        }
        
        Button("Delete all from account"){
            Task {
                let currentUser = try await supabase.auth.session.user

                var user: User =
                try await supabase
                  .from("users")
                  .select()
                  .eq("id", value: currentUser.id)
                  .single()
                  .execute()
                  .value
//                if !user.unlocked_cars.contains(UUID(uuidString: "00000000-0000-0000-0000-000000000003")!){
//                    user.unlocked_cars.append(UUID(uuidString: "00000000-0000-0000-0000-000000000003")!)
//                }
                user.unlocked_cars = []
                try await supabase.from("users")
                    .update(user)
                    .eq("id", value: currentUser.id)
                    .execute()
                car1 = 1.0
                car2 = 1.0
                car3 = 1.0
            }
        }
        
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
        .task {
            do{
                let currentUser = try await supabase.auth.session.user

                let user: User =
                try await supabase
                  .from("users")
                  .select()
                  .eq("id", value: currentUser.id)
                  .single()
                  .execute()
                  .value
                  
                  self.profile = user
            }
            catch{
                print(error)
            }
            
        }
    }
}

struct InventoryView: View {
    @State var name: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    
    var isSignInButtonDisabled: Bool {
        [name, password].contains(where: \.isEmpty)
    }
    
    @State var car1 : Double = 1.0
    @State var car2 : Double = 1.0
    @State var car3 : Double = 1.0
    
    @State private var showingSheet = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 15) {
                CardView(name: "blackcard")
                    .padding(50)
                    .grayscale(car1)
                CardView(name: "goldcard")
                    .padding(50)
                    .grayscale(car2)
                CardView(name: "yellowcard")
                    .padding(50)
                    .grayscale(car3)
                HStack {
                    Spacer()
                    Button("Add Card") {
    //                    NavigationLink(destination: BattleView()) {
    //                        Text("Go to Battle")
//                        }
                        showingSheet.toggle()
                    }
                    Spacer()

                }
            }
            .sheet(isPresented: $showingSheet) {
                SheetView(car1: $car1, car2: $car2, car3: $car3)
            }
        }
        .task {
            do{
                let currentUser = try await supabase.auth.session.user
                print("taskrunning")
                var user: User =
                try await supabase
                  .from("users")
                  .select()
                  .eq("id", value: currentUser.id)
                  .single()
                  .execute()
                  .value
                if user.unlocked_cars.contains(UUID(uuidString: "00000000-0000-0000-0000-000000000001")!){
                    car1 = 0.0
                }
                else{
                    car1 = 1.0
                }
                if user.unlocked_cars.contains(UUID(uuidString: "00000000-0000-0000-0000-000000000002")!){
                    car2 = 0.0
                    print("succ")
                }
                else{
                    car2 = 1.0
                    print("ded")
                }
                if user.unlocked_cars.contains(UUID(uuidString: "00000000-0000-0000-0000-000000000003")!){
                    car3 = 0.0
                    
                }
                else{
                    car3 = 1.0
                }
            }
            catch{
                print(error)
            }
        }
        
    }
}

#Preview {
    InventoryView()
}
