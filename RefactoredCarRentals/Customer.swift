//
//  Customer.swift
//  RefactoredCarRentals
//
//  Created by Birch, Nathan J on 7/17/21.
//

import Foundation

class Customer {
    
    private let name: String
    private var rentals = [Rental]()
    
    init(name: String) {
        self.name = name
    }
    
    
    func addRental(_ newRental: Rental) {
        rentals.append(newRental)
    }
    
    
    func getName() -> String {
        return name
    }
    
    
    func generateRentalPrice(for rental: Rental) -> Double {
        var rentalPrice = 0.0

        //determine amounts for each line
        switch rental.getCar().getPriceCode() {
        // calculates price of economy car rental
        case Car.ECONOMY:
            // 80 per day
            rentalPrice += 80.0
            // gets -2 day discount if rented for more than 2 days at 30 per day
            if (rental.getDaysRented() > 2) {
                rentalPrice += (Double(rental.getDaysRented()) - 2) * 30.0
            }
            break
            
        // calculates price of muscle car rental
        case Car.MUSCLE:
            // 200 per day
            rentalPrice += 200.0
            // gets -3 day discount if rented for more than 3 days at 50 per day
            if (rental.getDaysRented() > 3) {
                rentalPrice += (Double(rental.getDaysRented()) - 3) * 50.0
            }
            break
            
        // calculates price of super car rental
        case Car.SUPERCAR:
            // 200 per day (no discount)
            rentalPrice += Double(rental.getDaysRented()) * 200.0
            break
            
        default:
            break
        }
        
        return rentalPrice
    }
    
    
    func generateFrequentRenterPoints(for rental: Rental) -> Int {
        var frequentRenterPoints = 0
        // add frequent renter points for every rental
        frequentRenterPoints += 1
        // add bonus for a two day new release rental
        if ((rental.getCar().getPriceCode() == Car.SUPERCAR) && rental.getDaysRented() > 1) {
            frequentRenterPoints += 1
        }
        return frequentRenterPoints
    }
    
    
    func createBillingStatement() -> String {
        
        var totalAmountOwed = 0.0
        let seperator = "\n----------------------------------------------------------\n"
        var rentalRecord = "Rental Record for \(getName()):\n"
        var frequentRenterPoints = 0
        
        for rental in rentals {
            //calculated amount for renting cars
            var rentalPrice = 0.0
            
            // calculates cost for each rental depending on the car type and duration of rental
            rentalPrice = generateRentalPrice(for: rental)
            
            // calculates amount of FRP earned from ^ rental
            frequentRenterPoints += generateFrequentRenterPoints(for: rental)
            
            //show figures for this rental
            rentalRecord += "\t\(rental.getCar().getTitle())\t\t\(rentalPrice)\n"
            totalAmountOwed += rentalPrice
        }
        
        // add total amount owed for all rentals
        rentalRecord += "\nFinal rental payment owed: \(totalAmountOwed)\n"
        
        // add FRP earned
        rentalRecord += "You received an additional \(frequentRenterPoints) frequent renter points!\n" + seperator
        
        // output
        return rentalRecord
    }
}
