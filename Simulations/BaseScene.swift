//
//  BaseScene.swift
//  Simulations
//
//  Created by Bruno Rocca on 22/06/21.
//

import UIKit
import SceneKit
import ARKit

class BaseSceneView: ARSCNView {
    
    let blobControl = BlobControl()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        self.allowsCameraControl = true
        self.showsStatistics = true
    }
    
    func createFood() {
        let foodScene = SCNScene(named: "art.scnassets/food.scn")!
        let foodNodeTemplate = foodScene.rootNode.childNodes[0]
        
        for _ in 1...10 {
            let foodNode = foodNodeTemplate.copy() as! SCNNode
            let randomX = Double.random(in: -7.5...7.5)
            let randomZ = Double.random(in: -7.5...7.5)
            
            foodNode.position = SCNVector3(randomX, 0.1, randomZ)
            self.scene.rootNode.addChildNode(foodNode)
        }
    }
    
    func createBlob() {
        let blobControl = Blob()
        
        
        let blob = blobControl.getNewBlob()
        self.scene.rootNode.addChildNode(blob)
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { timer in
            blob.makeMove()
        })
    }
}
