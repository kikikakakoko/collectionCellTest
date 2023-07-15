//
//  protocol.swift
//  collectionCellTest
//
//  Created by Kiki on 2023/07/12.
//

import Foundation

protocol collectionDelegate: AnyObject {
    
    func collectionTapped(at index: Int)
}
