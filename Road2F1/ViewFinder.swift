//
//  ViewFinder.swift
//  Road2F1
//
//  Created by Hussain Alkatheri on 10/18/25.
//

import SwiftUI
import RealityKit

struct ViewFinder : View {
    @State var Car0: AnchorEntity = AnchorEntity()
    @State var Car1: AnchorEntity = AnchorEntity()
    @State var Car3: AnchorEntity = AnchorEntity()
    @State var modelName: String
    
    @State private var scale: Float = 1.0
    
    var body: some View {
        VStack{
            RealityView { content in
                content.camera = .spatialTracking
                content.renderingEffects.depthOfField = .disabled
                content.renderingEffects.motionBlur = .disabled
                Car0 = AnchorEntity(.image(group: "AR Resources", name: "aston123"))
                Car1 = AnchorEntity(.image(group: "AR Resources", name: "lotus1"))
                Car3 = AnchorEntity(.image(group: "AR Resources", name: "mclaren123"))
                if let car0 = try? await ModelEntity(named: "shrunk2uprotatedmore.usdz") {
                    content.add(car0)
                    Car0.addChild(car0)
                }
                content.add(Car0)
                
                if let car1 = try? await ModelEntity(named: "lotus_49c.usdz") {
                    content.add(car1)
                    Car1.addChild(car1)
                }
                content.add(Car1)
                
                if let car3 = try? await ModelEntity(named: "MCL35M.usdz") {
                    content.add(car3)
                    Car3.addChild(car3)
                }
                content.add(Car3)
                

            }
//            update: { content in
//                if let glassCube = content.entities.first {
//
//                }
//            }
            placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            
        }
        
    }

}

#Preview {
//    Can't see AR in simulator
    ProgressView()
        .progressViewStyle(.circular)
}


