//
//  Card.swift
//  Road2F1
//
//  Created by Hussain Alkatheri on 10/18/25.
//

import SwiftUI

struct CardView: View {
    @State var name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            if(name.contains("raichu")){
                Image("raichu")
                    .resizable()
                    .scaledToFit()
            }
            else if(name.contains("genesect")){
                Image("genesect")
                    .resizable()
                    .scaledToFit()
            }
            else if(name.contains("charizard")){
                Image("charizard")
                    .resizable()
                    .scaledToFit()
            }
            else{
                Image("unknown")
                    .resizable()
                    .scaledToFit()
            }
        }
        }
}


#Preview {
    CardView(name: "raichu")
}
