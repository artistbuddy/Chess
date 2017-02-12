//
//  Board2D.swift
//  Chess
//
//  Created by Karol on 11/02/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

struct Board2D<Piece>: Checkerboard {
    let size: Int
    var columns: Int {
        return size
    }
    var rows: Int {
        return size
    }
    fileprivate var array: [Piece?]
    
    init(size: Int, initialValue: Piece?) {
        self.size = size
        self.array = [Piece?](repeating: nil, count: size)
    }
    
    subscript(column: Int, row: Int) -> Piece? {
        get {
            return array[row*columns + column]
        }
        set {
            precondition(row < rows, "Row \(row) is out of range")
            precondition(column < columns, "Column \(column) is out of range")
            
            array[row*columns + column] = newValue
        }
    }
    
    func isValid(position: Position2D) -> Bool {
        return isValid(column: position.column, row: position.row)
    }
    
    //MARK:- Checkerboard
    func isValid(column: Int, row: Int) -> Bool {
        if column > columns || row > rows {
            return false
        }
        
        if column < 0 || row < 0 {
            return false
        }
        
        return true
    }
    
    func getSize() -> Int {
        return self.size
    }
}
