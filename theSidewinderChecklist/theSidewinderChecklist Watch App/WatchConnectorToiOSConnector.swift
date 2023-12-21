//
//  WatchConnectorToiOSConnector.swift
//  theSidewinderChecklist Watch App
//
//  Created by andrew austin on 12/5/23.
//

import Foundation
import WatchConnectivity

class WatchToiOSConnector: NSObject, WCSessionDelegate {
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
//    func sessionDidBecomeInactive(_ session: WCSession) {
//        
//    }
//    
//    func sessionDidDeactivate(_ session: WCSession) {
//        
//    }
//    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
    }
}
