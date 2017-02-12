//
//  Checkerboard.swift
//  Chess
//
//  Created by Karol on 12/02/2017.
//  Copyright © 2017 Karol Bukowski. All rights reserved.
//

import Foundation

protocol Checkerboard {
    func getSize() -> Int
    func isValid(column: Int, row: Int) -> Bool
}
