//
//  ViewController.swift
//  RefactoredCarRentals
//
//  Created by Birch, Nathan J on 7/17/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let car1 = Car(title: "Mustang", priceCode: Car.MUSCLE)
        let car2 = Car(title: "Lambo", priceCode: Car.SUPERCAR)
        let car3 = Car(title: "Impala", priceCode: Car.ECONOMY)
        let car4 = Car(title: "Camero", priceCode: Car.MUSCLE)
        let car5 = Car(title: "Ferarri", priceCode: Car.SUPERCAR)
        let car6 = Car(title: "Grand Caravan", priceCode: Car.ECONOMY)

        let rental1 = Rental(car: car1, daysRented: 5)
        let rental2 = Rental(car: car2, daysRented: 20)
        let rental3 = Rental(car: car3, daysRented: 12)
        let rental4 = Rental(car: car4, daysRented: 9)
        let rental5 = Rental(car: car5, daysRented: 2)
        let rental6 = Rental(car: car6, daysRented: 37)

        let customer1 = Customer(name: "Liviu")
        let customer2 = Customer(name: "Nathan")

        customer1.addRental(rental1)
        customer1.addRental(rental2)
        customer1.addRental(rental3)
        customer1.addRental(rental4)
        
        customer2.addRental(rental5)
        customer2.addRental(rental6)
        
        let allCustomers = [customer1, customer2]

        for customer in allCustomers {
            print(customer.createBillingStatement())
        }
    }
}

