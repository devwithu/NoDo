//
//  NoDo.swift
//  NoDo-B4
//
//  Created by Paulo Dichone on 7/19/19.
//  Copyright © 2019 Paulo Dichone. All rights reserved.
//

import Foundation
import SwiftUI

struct NoDo: Codable, Hashable, Identifiable {
    var id = UUID()
    var name: String = ""
    var dateAdded: String = ""
    var isDone: Bool = false
    
}
