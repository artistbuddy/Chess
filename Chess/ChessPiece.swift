//
//  ChessPiece.swift
//  Chess
//
//  Created by Karol on 11/02/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

enum ChessPiece: CustomStringConvertible {
    case king(ChessColor), queen(ChessColor), rook(ChessColor), bishop(ChessColor), knight(ChessColor), pawn(ChessColor)
    
    enum ChessColor {
        case black, white
    }
    
    //MARK:- CustomStringConvertible
    var description: String {
        switch self {
        case .king(.white): return "♔"
        case .queen(.white): return "♕"
        case .rook(.white): return "♖"
        case .bishop(.white): return "♗"
        case .knight(.white): return "♘"
        case .pawn(.white): return "♙"
            
        case .king(.black): return "♚"
        case .queen(.black): return "♛"
        case .rook(.black): return "♜"
        case .bishop(.black): return "♝"
        case .knight(.black): return "♞"
        case .pawn(.black): return "♟"
        }
    }
    
    //MARK:- Equatable
    static func ==(lhs: ChessPiece, rhs: ChessPiece) -> Bool {
        switch (lhs, rhs) {
        case let (.king(a), .king(b)) where a == b: return true
        case let (.queen(a), .queen(b)) where a == b: return true
        case let (.rook(a), .rook(b)) where a == b: return true
        case let (.bishop(a), .bishop(b)) where a == b: return true
        case let (.knight(a), .knight(b)) where a == b: return true
        case let (.pawn(a), .pawn(b)) where a == b: return true
        default: return false
        }
    }
}
