//
//  ChessPieceMovement.swift
//  Chess
//
//  Created by Karol on 11/02/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

class ChessOrthodoxMovement {
    func king(position: Position2D, board: Checkerboard) -> [Position2D] {
        return CheckerboardHelper.getSurrounding(at: position, on: board)
    }
    
    func knight(position: Position2D, board: Checkerboard) -> [Position2D] {
        var positions = [Position2D]()
        let relatives: [(col: Int, row: Int)] = [(-1, -2), (-2, -1), (-1, 2), (-2, 1), (1, 2), (2, 1), (1, -2), (2, -1)]
        
        for relative in relatives {
            let newCol = position.column + relative.col
            let newRow = position.row + relative.row
            
            if board.isValid(column: newCol, row: newRow) {
                positions.append(Position2D(column: newCol, row: newRow))
            }
        }
        
        return positions
    }
    
    func rook(position: Position2D, board: Checkerboard) -> [Position2D] {
        var positions = [Position2D]()
        
        positions.append(contentsOf: CheckerboardHelper.getColumn(at: position, on: board))
        positions.append(contentsOf: CheckerboardHelper.getRow(at: position, on: board))
        
        return positions
    }
    
    func bishop(position: Position2D, board: Checkerboard) -> [Position2D] {
        var positions = [Position2D]()
        
        positions.append(contentsOf: CheckerboardHelper.getDiagonal(direction: .leftToRight, at: position, on: board))
        positions.append(contentsOf: CheckerboardHelper.getDiagonal(direction: .rightToLeft, at: position, on: board))
        
        return positions
    }
    
    func queen(position: Position2D, board: Checkerboard) -> [Position2D] {
        var positions = [Position2D]()
        
        positions.append(contentsOf: CheckerboardHelper.getDiagonal(direction: .leftToRight, at: position, on: board))
        positions.append(contentsOf: CheckerboardHelper.getDiagonal(direction: .rightToLeft, at: position, on: board))
        positions.append(contentsOf: CheckerboardHelper.getColumn(at: position, on: board))
        positions.append(contentsOf: CheckerboardHelper.getRow(at: position, on: board))
        
        return positions
    }
    
    func pawnWhite(position: Position2D, board: Checkerboard) -> [Position2D] {
        ///We assume that whites are always on the bottom (first player)
        var positions = [Position2D]()
        let relatives: [(col: Int, row: Int)] = [(0, 1), (1, 1), (-1, 1)]
        
        for relative in relatives {
            let newCol = position.column + relative.col
            let newRow = position.row + relative.row
            
            if board.isValid(column: newCol, row: newRow) {
                positions.append(Position2D(column: newCol, row: newRow))
            }
        }
        
        if position.row == 1 { //if pawn is on initial position it can move forward 2 squares
            positions.append(Position2D(column: position.column, row: position.row + 2))
        }
        
        return positions
    }
    
    func pawnBlack(position: Position2D, board: Checkerboard) -> [Position2D] {
        var positions = [Position2D]()
        let relatives: [(col: Int, row: Int)] = [(0, -1), (1, -1), (-1, -1)]
        
        for relative in relatives {
            let newCol = position.column + relative.col
            let newRow = position.row + relative.row
            
            if board.isValid(column: newCol, row: newRow) {
                positions.append(Position2D(column: newCol, row: newRow))
            }
        }
        
        if position.row == 6 {
            positions.append(Position2D(column: position.column, row: position.row - 2))
        }
        
        return positions
    }

    
    func possibleMoves(_ piece: ChessPiece, at position: Position2D, on board: Checkerboard) -> [Position2D] {
        switch piece {
        case .king: return king(position: position, board: board)
        case .queen: return queen(position: position, board: board)
        case .bishop: return bishop(position: position, board: board)
        case .knight: return knight(position: position, board: board)
        case .rook: return rook(position: position, board: board)
        case .pawn(.white): return pawnWhite(position: position, board: board)
        case .pawn(.black): return pawnBlack(position: position, board: board)
        }
    }
}
