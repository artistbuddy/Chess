//
//  Position2D.swift
//  Chess
//
//  Created by Karol on 11/02/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

struct Position2D {
    let x: Int
    let y: Int
    
    var column: Int {
        return x
    }
    var row: Int {
        return y
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    init(column: Int, row: Int) {
        self.x = column
        self.y = row
    }
}
