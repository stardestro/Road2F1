//
//  Profile.swift
//  Road2F1
//
//  Created by Hussain Alkatheri on 10/18/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .padding()
            Text("Username: Stardestro")
            Text("Age: 25")
                .padding(5)
            Text("Fastest time: 15.00")
        }
    }
}


#Preview {
    ProfileView()
}

