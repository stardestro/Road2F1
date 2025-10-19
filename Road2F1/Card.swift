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
            if(name.contains("blackcard")){
                Image("lotus11")
                    .resizable()
                    .scaledToFit()
            }
            else if(name.contains("goldcard")){
                Image("aston1231")
                    .resizable()
                    .scaledToFit()
            }
            else if(name.contains("yellowcard")){
                Image("mclaren1231")
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
