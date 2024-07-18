//
//  main.swift
//  Factory
//
//  Created by Аlina Кovtunovich on 26.06.2024.
//

import Foundation

struct Order {
    let id: UUID = UUID()
    let material: String
    var quantity: Int
    var unitPrice: Double
    var amount: Double {
        Double(quantity) * unitPrice
    }
    var isReady: Bool
    let client: Person
    
    mutating func updateOrder(newQuantity: Int? = nil, newUnitPrice: Double? = nil) {
        if let newQuantity = newQuantity {
            quantity = newQuantity
        }
        if let newUnitPrice = newUnitPrice {
            unitPrice = newUnitPrice
        }
    }
}

class Person {
    let name: String
    let surname: String
    var dateOfBorn: String
    weak var passport: Passport?
    
    init(name: String, surname: String, dateOfBorn: String, passport: Passport? = nil) {
        self.name = name
        self.surname = surname
        self.dateOfBorn = dateOfBorn
        self.passport = passport
        print("Person \(name) \(surname) is initialized")
    }
    
    deinit {
        print("Person \(name) \(surname) is being deallocated")
    }
}

class Passport {
    let series: String
    let number: String
    let dateIssue: String
    weak var person: Person?
    
    init(series: String, number: String, dateIssue: String, person: Person) {
        self.series = series
        self.number = number
        self.dateIssue = dateIssue
        self.person = person
        print("Passport \(series)-\(number) is initialized")
    }
    
    deinit {
        print("Passport \(series)-\(number) is being deallocated")
    }
}

class Factory {
    let name: String
    private(set) var clients: [Person]
    private(set) var staff: [Passport]
    private(set) var orders: [Order]

    init(name: String) {
        self.name = name
        self.clients = []
        self.staff = []
        self.orders = []
        print("Factory \(name) is initialized")
    }
    
    func addClient(_ client: Person) {
        clients.append(client)
    }
    
    func addStaff(_ passport: Passport) {
        staff.append(passport)
    }

    func addOrder(_ order: Order) {
        orders.append(order)
    }
    
    func cancelOrder(by id: UUID) {
        orders.removeAll { $0.id == id }
    }
    
    func updateOrder(orderId: UUID, newQuantity: Int? = nil, newUnitPrice: Double? = nil) {
        if let index = orders.firstIndex(where: { $0.id == orderId }) {
            orders[index].updateOrder(newQuantity: newQuantity, newUnitPrice: newUnitPrice)
        }
    }
    
    func printFactoryDetails() {
        let staffDetails = staff.map { "\($0.series) \($0.number): \($0.person?.name ?? "") \($0.person?.surname ?? "")" }.joined(separator: "\n    ")
        let clientDetails = clients.map { "\($0.name) \($0.surname)" }.joined(separator: "\n    ")
        let orderDetails = orders.map { "\($0.id.uuidString) - \($0.material) (\($0.quantity))" }.joined(separator: "\n    ")

        print("""
            Factory Name: \(name)
            Staff:
                \(staffDetails)
            Clients:
                \(clientDetails)
            Orders:
                \(orderDetails)
            """)
    }
    
    deinit {
        print("Factory \(name) is being deallocated")
    }
}

func test() {
    let factory = Factory(name: "New Leroy Merlin")

    let clientIvanov = Person(name: "Иван", surname: "Иванов", dateOfBorn: "24.05.1991")
    factory.addClient(clientIvanov)

    let workerPetrov = Person(name: "Семён", surname: "Петров", dateOfBorn: "12.12.1989")
    let passportPetrov = Passport(series: "5027", number: "125-973", dateIssue: "20.12.2019", person: workerPetrov)
    factory.addStaff(passportPetrov)

    var order = Order(material: "Плитка", quantity: 255, unitPrice: 468.0, isReady: false, client: clientIvanov)
    factory.addOrder(order)
    
    factory.printFactoryDetails()
    
    factory.updateOrder(orderId: order.id, newQuantity: 300)
    factory.updateOrder(orderId: order.id, newUnitPrice: 450.0)
    
    factory.printFactoryDetails()
}

test()

