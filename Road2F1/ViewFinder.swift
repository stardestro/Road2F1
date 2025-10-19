//
//  ViewFinder.swift
//  Road2F1
//
//  Created by Hussain Alkatheri on 10/18/25.
//

import SwiftUI
import RealityKit
//import ARKit

//struct ViewFinder: UIViewRepresentable {
//    @State var modelName: String
//    
//    func makeUIView(context: Context) -> ARView {
//        let arView = ARView(frame: .zero)
//        
//        let config = ARWorldTrackingConfiguration()
////        config.planeDetection = [.horizontal,.vertical]
////        config.environmentTexturing = .automatic
//        arView.debugOptions = [.showAnchorOrigins]
//        arView.session.run(config)
//        return arView
//    }
//    
//    
//    func updateUIView(_ uiView: ARView, context: Context) {
//        // 1.
////        let anchorEntity = AnchorEntity(plane: .any)
////            let testEntity = ARImageAnchor.load("apriltag", in: uiView.scene)
//        let imageAnchor = AnchorEntity(.image(group: "AR Resources", name: "tag"))
////        let imageAnchor = AnchorEntity(.image(named:"tag25h9-0.png"))
//        
//        // 2.
////        guard let modelEntity = try? Entity.loadModel(named: modelName) else { return }
//        
//        guard let carEntity = try? Entity.loadModel(named: "toy_car") else { return }
//        
//        // 3.
////        anchorEntity.addChild(modelEntity)
//        imageAnchor.addChild(carEntity)
//        
//        // 4.
////        uiView.scene.addAnchor(anchorEntity)
//        uiView.scene.addAnchor(imageAnchor)
//    }
//}





struct ViewFinder : View {
    @State var rootNode: AnchorEntity = AnchorEntity()
    @State var modelName: String
    
    @State private var scale: Float = 1.0
    
    var body: some View {
        VStack{
            RealityView { content in
                content.camera = .spatialTracking
                content.renderingEffects.depthOfField = .disabled
                content.renderingEffects.motionBlur = .disabled
                rootNode = AnchorEntity(.image(group: "AR Resources", name: "tag"))
//                rootNode = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds:     [0.1, 0.1]))
                if let glassCube = try? await ModelEntity(named: "toy_car") {
                    content.add(glassCube)
                    glassCube.position = [0.5,0.1,0]
//                    glassCube.transform.scale = SIMD3<Float>(0.5, 0.5, 0.5)
//                    glassCube.transform = Transform(scale: SIMD3<Float>(0.5, 0.5, 0.5))
                    // 1.
//                    glassCube.components.set(InputTargetComponent())
                    // 2.
//                    glassCube.generateCollisionShapes(recursive: false)
                    rootNode.addChild(glassCube)
//                    glassCube.scale = [1,1,1]
                }
                content.add(rootNode)

            } update: { content in
                if let glassCube = content.entities.first {
                    glassCube.transform.scale = [0.1, 0.1, 0.1]
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


