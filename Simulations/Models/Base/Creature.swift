//
//  Creature.swift
//  Simulations
//
//  Created by Bruno Rocca on 23/06/21.
//

import SceneKit

class Creature: SCNNode {
    let id: Int
    
    override init() {
        self.id = Session.shared().getNewId()
        super.init()
    }
    
    override convenience init(geometry: SCNGeometry?) {
        SCNNode(geometry: nil)
        super.init(geometry: geometry)
    }
    
    required init?(coder: NSCoder) {
        self.id = Session.shared().getNewId()
        super.init(coder: coder)
    }
    
    func makeMove() {
        if !nodeIsOnEdge() {
            self.position.x += 0.05
        }
    }
    
    private func nodeIsOnEdge() -> Bool {
        if self.position.x + (self.scale.x / 2) > 7.5 {
            return true
        } else {
            return false
        }
    }
}
