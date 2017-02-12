//
//  CheckerboardHelper.swift
//  Chess
//
//  Created by Karol on 11/02/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

class CheckerboardHelper {
    class func getColumn(at position: Position2D, on board: Checkerboard) -> [Position2D] {
        return getRow(at: position, depth: board.getSize(), on: board)
    }
    
    class func getColumn(at position: Position2D, depth: Int, on board: Checkerboard) -> [Position2D] {
        var positions = [Position2D]()
        
        precondition(depth > 0)
        let start = max(0, (position.column - depth))
        let end = min(board.getSize(), position.column + depth)
        
        for row in start..<end {
            if row != position.row {
                positions.append(Position2D(column: position.column, row: row))
            }
        }
        
        return positions
    }
    
    class func getRow(at position: Position2D, on board: Checkerboard) -> [Position2D] {
        return getRow(at: position, depth: board.getSize(), on: board)
    }
    
    class func getRow(at position: Position2D, depth: Int, on board: Checkerboard) -> [Position2D] {
        var positions = [Position2D]()
        
        precondition(depth > 0)
        let start = max(0, (position.row - depth))
        let end = min(board.getSize(), position.row + depth)
        
        for col in start..<end {
            if col != position.column {
                positions.append(Position2D(column: col, row: position.row))
            }
        }
        
        return positions
    }
    
    enum Diagonal {
        case leftToRight, rightToLeft
    }
    
    class func getDiagonal(direction diagonal: Diagonal, at position: Position2D, on board: Checkerboard) -> [Position2D] {
        return getDiagonal(direction: diagonal, at: position, depth: board.getSize(), on: board)
    }
    
    class func getDiagonal(direction diagonal: Diagonal, at position: Position2D, depth: Int, on board: Checkerboard) -> [Position2D] {
        var positions = [Position2D]()
        
        precondition(depth > 0)
        let end = min(board.getSize(), depth)
        
        func left2right() {
            for i in 1...end {
                let newCol = position.column - i
                let newRow = position.row - i
                
                if board.isValid(column: newCol, row: newRow) {
                    positions.append(Position2D(column: newCol, row: newRow))
                } else {
                    break
                }
            }
            
            for i in 1...end {
                let newCol = position.column + i
                let newRow = position.row + i
                
                if board.isValid(column: newCol, row: newRow) {
                    positions.append(Position2D(column: newCol, row: newRow))
                } else {
                    break
                }
            }
        }
        
        func right2left() {
            for i in 1...end {
                let newCol = position.column - i
                let newRow = position.row + i
                
                if board.isValid(column: newCol, row: newRow) {
                    positions.append(Position2D(column: newCol, row: newRow))
                } else {
                    break
                }
            }
            
            for i in 1...end {
                let newCol = position.column + i
                let newRow = position.row - i
                
                if board.isValid(column: newCol, row: newRow) {
                    positions.append(Position2D(column: newCol, row: newRow))
                } else {
                    break
                }
            }
        }
        
        switch diagonal {
        case .leftToRight: left2right()
        case .rightToLeft: right2left()
        }

        return positions
    }
    
    class func getSurrounding(at position: Position2D, on board: Checkerboard) -> [Position2D] {
        var positions = [Position2D]()
        let relatives: [(col: Int, row: Int)] = [(-1,0), (-1,1), (0,1), (1,1), (1,0), (1,-1), (0,-1), (-1,-1)]
        
        for relative in relatives {
            let newCol = position.column + relative.col
            let newRow = position.row + relative.row
            
            if board.isValid(column: newCol, row: newRow) {
                positions.append(Position2D(column: newCol, row: newRow))
            }
        }
        
        return positions
    }
}

