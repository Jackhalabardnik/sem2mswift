//
//  File.swift
//  test1
//
//  Created by Jacek  on 10/10/2023.
//

import Foundation

struct Calculator {
    static func add(lhs: Double, rhs: Double) -> Double? {
        return lhs+rhs;
    }
    static func substract(lhs: Double, rhs: Double) -> Double? {
        return lhs-rhs;
    }
    static func mul(lhs: Double, rhs: Double) -> Double? {
        return lhs*rhs;
    }
    static func div(lhs: Double, rhs: Double) -> Double? {
        return lhs/rhs;
    }
    static func sinus(lhs: Double) -> Double {
        return sin(lhs);
    }
}
