//
//  Array+Only.swift
//  learn
//
//  Created by 罗秋雨 on 2021/7/25.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
