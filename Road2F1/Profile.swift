//
//  Profile.swift
//  Road2F1
//
//  Created by Hussain Alkatheri on 10/18/25.
//

import SwiftUI
import Supabase
import Foundation

struct ProfileView: View {
//    var body: some View {
//        VStack{
//            Text("Profile")
//                .font(.largeTitle)
//                .padding()
//            Text("Username: Stardestro")
//            Text("Age: 25")
//                .padding(5)
//            Text("Fastest time: 15.00")
//        }
//    }
//}
    @State var username = ""
    @State var fullName = ""
    @State var website = ""
    
    @State var profile: User = .init(id: .init(uuidString: "00000000-0000-0000-0000-000000000000")!, email: "", username: "", display_name: "", unlocked_cars: [], fastest_lap: nil, total_races: 0, created_at: .now, updated_at: .now)

    @State var isLoading = false

    var body: some View {
      NavigationStack {
        Form {
          Section {
//              TextField("UUID", text: $profile.id)
//              .textContentType(.username)
//              .textInputAutocapitalization(.never)
              Text("\(profile.id)")
              Text(profile.email)
              Text(profile.username)
              Text(profile.display_name)
              Text("\(profile.unlocked_cars)")
              Text("\(profile.total_races)")
              Text("\(profile.created_at)")
              Text("\(profile.updated_at)")
//              .textContentType(.name)
//            TextField("Website", text: $website)
//              .textContentType(.URL)
//              .textInputAutocapitalization(.never)
          }
            
            if isLoading {
              ProgressView()
            }
          }
        }
        .navigationTitle("Profile")
        .toolbar(content: {
          ToolbarItem(placement: .topBarLeading){
            Button("Sign out", role: .destructive) {
              Task {
                try? await supabase.auth.signOut()
              }
            }
          }
        })
      
      .task {
        await getInitialProfile()
      }
    }

    func getInitialProfile() async {
      do {
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

//          self.username = user.display_name ?? ""
//          self.fullName = user.email ?? ""
//          self.website = user.username ?? ""

      } catch {
        debugPrint(error)
      }
    }
  }



#Preview {
    ProfileView()
}

