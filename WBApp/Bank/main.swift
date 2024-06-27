//
//  main.swift
//  Bank
//
//  Created by Аlina Кovtunovich on 24.06.2024.
//

import Foundation

struct BankAccount: Hashable {
    private let id: UUID = UUID()
    let accountNumber: String
    let accountHolderName: String
    var accountBalance: Double
    
    mutating func topUpBalance(amount: Double) {
        accountBalance += amount
        print("Баланс обновлён. Текущий баланс: \(accountBalance)₽.")
    }
    
    mutating func withdrawing(amount: Double) -> Bool {
        if amount <= accountBalance {
            accountBalance -= amount
            print("Успешное снятие средств -\(amount)₽, остаток на счёте *\(accountNumber.suffix(4)) - \(accountBalance)₽.")
            return true
        } else {
            print("Недостаточно средств на счёте. Доступно \(accountBalance)₽.")
            return false
        }
    }
    
}

class Bank {
    private var accounts: [BankAccount] = []
    private var generatedAccountNumbers: Set<String> = []
    
    func printAccounts() {
        if accounts.isEmpty {
            print("Список счетов пуст.")
        } else {
            accounts.enumerated().forEach { (index, account) in
                print("""
                    \(index + 1):
                    Имя владельца счёта: \(account.accountHolderName).
                    Номер счёта: \(account.accountNumber).
                    Баланс счёта: \(account.accountBalance)₽.
                    _____________________________________________________
                    """)
            }
        }
    }
    
    func generateAccountNumber() -> String {
        var accountNumber: String
        repeat {
            accountNumber = (1...5).map { _ in
                String(format: "%04d", Int.random(in: 0..<10000))
            }.joined(separator: " ")
        } while generatedAccountNumbers.contains(accountNumber)
        
        generatedAccountNumbers.insert(accountNumber)
        return accountNumber
    }
    
    func addAccount() {
        let accountNumber = generateAccountNumber()
        var accountHolderName: String?
        repeat {
            print("Введите ФИО держателя счёта:", terminator: " ")
            if let input = readLine(), !input.trimmingCharacters(in: .whitespaces).isEmpty {
                accountHolderName = input
            } else {
                print("Поле не может быть пустым. Пожалуйста, попробуйте снова.")
            }
        } while accountHolderName == nil
        
        var account = BankAccount(accountNumber: accountNumber, accountHolderName: accountHolderName!, accountBalance: 0.0)
        
        print("""
            Счёт успешно создан.
            ФИО владельца счёта - \(accountHolderName!).
            Номер счёта - \(accountNumber).
            """)
        
        print("Какую сумму желаете внести на баланс счёта?")
        if let input = readLine(), let amount = Double(input) {
            account.topUpBalance(amount: amount)
        } else {
            print("Некорректный ввод. Начальный баланс установлен в 0₽.")
        }
        accounts.append(account)
    }
    
    func addTestingAccounts() {
        let account1 = BankAccount(accountNumber: generateAccountNumber(), accountHolderName: "Ильин Пётр Викторович", accountBalance: 150000.0)
        accounts.append(account1)
        
        let account2 = BankAccount(accountNumber: generateAccountNumber(), accountHolderName: "Дмитриев Александр Иванович", accountBalance: 42000.0)
        accounts.append(account2)
        
        let account3 = BankAccount(accountNumber: generateAccountNumber(), accountHolderName: "Петрова Анна Владимировна", accountBalance: 79500.0)
        accounts.append(account3)
        
        let account4 = BankAccount(accountNumber: generateAccountNumber(), accountHolderName: "Климкин Иван Данилович", accountBalance: 0.0)
        accounts.append(account4)
    }
    
    func performOperations() {
        while true {
            print("""
            
            **********************************
            Выберите операцию:
            1. Пополнить счёт
            2. Снять средства
            3. Перевести средства
            4. Вывести список счетов
            5. Создать новый счёт
            6. Выход
            **********************************
            
            """)
            if let choice = readLine() {
                switch choice {
                case "1":
                    performTopUp()
                case "2":
                    performWithdrawal()
                case "3":
                    performTransfer()
                case "4":
                    printAccounts()
                case "5":
                    addAccount()
                case "6":
                    return
                default:
                    print("Неверный выбор. Пожалуйста, попробуйте снова.")
                }
            }
        }
    }
    
    private func performTopUp() {
        print("Введите номер счёта для пополнения:", terminator: " ")
        if let accountNumber = readLine(), let accountIndex = accounts.firstIndex(where: { $0.accountNumber == accountNumber }) {
            print("Введите сумму для пополнения:", terminator: " ")
            if let amountInput = readLine(), let amount = Double(amountInput) {
                accounts[accountIndex].topUpBalance(amount: amount)
            } else {
                print("Некорректная сумма.")
            }
        } else {
            print("Счёт не найден.")
        }
    }
    
    private func performWithdrawal() {
        print("Введите номер счёта для снятия средств:", terminator: " ")
        if let accountNumber = readLine(), let accountIndex = accounts.firstIndex(where: { $0.accountNumber == accountNumber }) {
            print("Введите сумму для снятия:", terminator: " ")
            if let amountInput = readLine(), let amount = Double(amountInput) {
                _ = accounts[accountIndex].withdrawing(amount: amount)
            } else {
                print("Некорректная сумма.")
            }
        } else {
            print("Счёт не найден.")
        }
    }
    
    private func performTransfer() {
        print("Введите номер счёта отправителя:", terminator: " ")
        if let senderAccountNumber = readLine(), let senderIndex = accounts.firstIndex(where: { $0.accountNumber == senderAccountNumber }) {
            print("Введите номер счёта получателя:", terminator: " ")
            if let recipientAccountNumber = readLine(), let recipientIndex = accounts.firstIndex(where: { $0.accountNumber == recipientAccountNumber }) {
                print("Введите сумму для перевода:", terminator: " ")
                if let amountInput = readLine(), let amount = Double(amountInput) {
                    if amount <= accounts[senderIndex].accountBalance {
                        _ = accounts[senderIndex].withdrawing(amount: amount)
                        accounts[recipientIndex].topUpBalance(amount: amount)
                        print("Перевод выполнен успешно.")
                        
                    } else {
                        print("Недостаточно средств для перевода. Доступно \(accounts[senderIndex].accountBalance)₽.")
                    }
                } else {
                    print("Некорректная сумма.")
                }
            } else {
                print("Счёт получателя не найден.")
            }
        } else {
            print("Счёт отправителя не найден.")
        }
    }
}

// Пример использования
let bank = Bank()

// Добавление тестовых счетов
bank.addTestingAccounts()

// Основной цикл операций
bank.performOperations()
