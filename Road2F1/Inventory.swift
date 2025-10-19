//
//  Inventory.swift
//  Road2F1
//
//  Created by Hussain Alkatheri on 10/18/25.
//

import SwiftUI

struct InventoryView: View {
    @State var name: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    
    var isSignInButtonDisabled: Bool {
        [name, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 15) {
                CardView(name: "raichu")
                    .padding(50)
                CardView(name: "genesect")
                    .padding(50)
                CardView(name: "charizard")
                    .padding(50)
                HStack {
                    Spacer()
                    Button("Add Card") {
    //                    NavigationLink(destination: BattleView()) {
    //                        Text("Go to Battle")
//                        }
                    }
                    Spacer()

                }
            }
        }
        
    }
}

#Preview {
    InventoryView()
}
