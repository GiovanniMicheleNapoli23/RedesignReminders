//
//  FilemanagerExtension.swift
//  ToDoListBasic
//
//  Created by Giovanni Michele on 21/11/22.
//

import Foundation

extension FileManager {
    /// The documents directory for this app.
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
 
