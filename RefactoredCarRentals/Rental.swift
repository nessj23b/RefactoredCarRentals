//
//  Rental.swift
//  RefactoredCarRentals
//
//  Created by Birch, Nathan J on 7/17/21.
//

import Foundation

class Rental {
    
    private let car: Car
    private let daysRented: Int
    
    init(car: Car, daysRented: Int) {
        self.car = car
        self.daysRented = daysRented
    }
    
    
    func getDaysRented() -> Int {
        return daysRented
    }
    
    
    func getCar() -> Car {
        return car
    }
}
