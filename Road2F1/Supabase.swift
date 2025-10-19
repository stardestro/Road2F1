//
//  Supabase.swift
//  Road2F1
//
//  Created by Hussain Alkatheri on 10/18/25.
//

import SwiftUI
import Supabase
import Foundation

struct Instrument: Identifiable, Decodable {
    let id: String
    let car_code: String
    let car_name: String
    let team_name: String
    let year: Int
    let speed: Int
    let acceleration: Int
    let handling: Int
    let model_url: String
    let thumbnail_url: String
    let description: String
    let rarity: String
    let created_at: String
}



struct SupabaseView: View {
    @State var carlist: [Instrument] = []
    
    var body: some View {
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .padding()
            Text("Username: Stardestro")
            Text("Age: 25")
                .padding(5)
            Text("Fastest time: 15.00")
            ScrollView{
                ForEach(carlist) { instrument in
                    VStack{
                        Text(instrument.id)
                        Text(instrument.car_name)
                        Text(instrument.team_name)
                        Text("\(instrument.year)")
                        Text("\(instrument.speed)")
                        Text("\(instrument.acceleration)")
                        Text("\(instrument.handling)")
                        Text(instrument.description)
                    }
                    .padding(30)
                }
            }
            Button("Supabase get"){
                Task{
                    let client = SupabaseClient(supabaseURL: URL(string: "https://hkaehgfxcafvbhdsuxon.supabase.co/")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrYWVoZ2Z4Y2FmdmJoZHN1eG9uIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA4MDQ4MTQsImV4cCI6MjA3NjM4MDgxNH0.KBR-xx3RJlG4qBSpIOHXFtYrF151OZ-8MH9RtfIdviY")
                    carlist = try await client
                      .from("cars")
                      .select()
                      .execute()
                      .value
                    print(carlist[0])
                }
//                print("pressed")
                
            }
        }
    }
}


#Preview {
    SupabaseView()
}
