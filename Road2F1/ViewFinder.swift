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
                Car0 = AnchorEntity(.image(group: "AR Resources", name: "blackcard"))
                Car1 = AnchorEntity(.image(group: "AR Resources", name: "goldv2"))
                Car3 = AnchorEntity(.image(group: "AR Resources", name: "goldcard"))
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
                

            } update: { content in
                if let glassCube = content.entities.first {

                }
            }
            placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            
            
            
        //
            //            RealityView { content in
            //                cup = try! await Entity(named: "ruh")
            //                let radians = 90 * Float.pi / 180
            //
            //                cup.orientation += simd_quatf(angle: radians, axis: SIMD3<Float>(1,0,0))
            //                cup.scale = SIMD3<Float>(0.4,0.4,0.4)
            //                cup.position = cup.position + [-0.05, -0.04, 0]
            //                MusicManager.instance.playFunk()
            //                lazar.registerComponent()
            //                rootNode = AnchorEntity(.image(group: "AR Resources" , name: "tag"))
            //
            //                cameraNode = AnchorEntity(.camera)
            //
            //                let box = ModelEntity()
            //                let mesh = MeshResource.generateBox(size: 0.005, cornerRadius: 0.000005)
            //                let material = SimpleMaterial(color: .red.withAlphaComponent(0.7), roughness: 0.15, isMetallic: true)
            //                box.components.set(ModelComponent(mesh: mesh, materials: [material]))
            ////                box.physicsBody = PhysicsBodyComponent(massProperties: .default, material: .generate(), mode: .dynamic)
            ////                box.generateCollisionShapes(recursive: true)
            ////                box.physicsBody?.isAffectedByGravity = false
            //                box.position = [0, 0, -0.1]
            //    //            let anchor = AnchorEntity(.image(group: "AR Resources" , name: "tag"))
            ////                box.applyLinearImpulse(SIMD3<Float>(0, 0, -0.2), relativeTo: nil)
            //
            //                cameraNode.addChild(box)
            //
            //                var ship = Entity()
            //                ship = try! await Entity(named: "ship")
            //
            //    //            let anchor = AnchorEntity(.image(group: "AR Resources" , name: "tag"))
            ////                box.applyLinearImpulse(SIMD3<Float>(0, 0, -0.2), relativeTo: nil)
            //
            //                ship.transform.rotation += simd_quatf(angle: radians, axis: SIMD3<Float>(0,1.2,0))
            //
            //                ship.position = [-0.02, -0.03, -0.2]
            ////                ship.orientation += simd_quatf(angle: radians, axis: SIMD3<Float>(1,1,0))
            //                cameraNode.addChild(ship)
            //
            //
            //
            //                playerswall = ModelEntity()
            //                let floorMesh = MeshResource.generatePlane(width: 10, height: 10, cornerRadius: 0.005)
            ////                let floorMesh = MeshResource.generatePlane(width: 1, depth: 1)
            ////                let floorMaterial = SimpleMaterial(color: .gray, roughness: 0.15, isMetallic: true)
            //                let floorMaterialhidden = SimpleMaterial(color: .red.withAlphaComponent(0.0), roughness: 0.15, isMetallic: true)
            //                playerswall.components.set(ModelComponent(mesh: floorMesh, materials: [floorMaterialhidden]))
            //                playerswall.physicsBody = PhysicsBodyComponent(massProperties: .default, material: .generate(staticFriction: 0.1, dynamicFriction: 0.1, restitution: 0.1), mode: .static)
            //                playerswall.generateCollisionShapes(recursive: true)
            ////                floor.position = [0, -0.5, 0.5]
            //                playerswall.position = cameraNode.position(relativeTo: rootNode) + [0, 0, cameraNode.position(relativeTo: rootNode).z + 0.2]
            //                playerswall.components.set(playerwall())
            //    //            let floorAnchor = AnchorEntity(.plane(alignment: .horizontal))
            //
            //                rootNode.addChild(playerswall)
            //
            //
            //                }))
            //                // Add the horizontal plane anchor to the scene
            //                content.add(rootNode)
            //
            //                content.add(cameraNode)
            //
            //                }
            //
            //            }
            
        }
        
    }

}

#Preview {
//    ContentView()
    ProgressView()
        .progressViewStyle(.circular)
}

//
//#Preview {
//    ViewFinder()
//}


