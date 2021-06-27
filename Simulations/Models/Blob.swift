//
//  Blob.swift
//  Simulations
//
//  Created by Bruno Rocca on 23/06/21.
//

import SceneKit

class Blob: Creature {
    func getNewBlob() -> Blob {
        let geometry = SCNCylinder()
        let blob = Blob(geometry: geometry)
        
        return blob
    }
}
