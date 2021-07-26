//
//  Array+Identifiable.swift
//  learn
//
//  Created by 罗秋雨 on 2021/7/25.
//

import Foundation

extension Array where Element : Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
