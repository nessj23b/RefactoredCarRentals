//
//  Car.swift
//  RefactoredCarRentals
//
//  Created by Birch, Nathan J on 7/17/21.
//

import Foundation

class Car {

    static let ECONOMY = 0
    static let SUPERCAR = 1
    static let MUSCLE = 2

    private let title: String
    private var priceCode: Int

    init(title: String, priceCode: Int) {
        self.title = title
        self.priceCode = priceCode
    }


    func getPriceCode() -> Int {
        return priceCode
    }


    func getTitle() -> String {
        return title
    }
}

