//
//  FilemanagerExtension.swift
//  ToDoListBasic
//
//  Created by Giovanni Michele on 21/11/22.
//

import Foundation
import UIKit

fileprivate class HapticsManager {
    
    static let shared = HapticsManager()
    
    private let feedback = UINotificationFeedbackGenerator()
    
    private init() { }
    
    func trigger(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
        feedback.notificationOccurred(notification)
    }
    
}
//func haptic(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
//    HapticsManager.
//}
//
