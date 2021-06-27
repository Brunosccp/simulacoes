//
//  Singleton.swift
//  Simulations
//
//  Created by Bruno Rocca on 23/06/21.
//

import Foundation

class Session {
    private static var instance: SessionModel?
    
    private init() { }
    
    static func setSession(_ session: SessionModel = SessionModel()) {
        Session.instance = session
    }
    
    static func shared() -> SessionModel {
        guard let shared = Session.instance else {
            fatalError("Error: Singleton not set")
        }
        
        return shared
    }
}

class SessionModel {
    private var lastId = 1
    
    func getNewId() -> Int {
        lastId += 1
        return lastId
    }
}
