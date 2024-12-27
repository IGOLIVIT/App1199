//
//  HomeViewModel.swift
//  App1199
//
//  Created by IGOR on 20/12/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {

    @AppStorage("nameTeam") var nameTeam: String = ""
    @AppStorage("subs") var subs: Int = 0
    @AppStorage("Income") var Income: Int = 0
    
    @AppStorage("amountWinning") var amountWinning: Int = 0
    @AppStorage("amountExpenses") var amountExpenses: Int = 0
    
    @Published var addamountWinning: String = ""
    @Published var addamountExpenses: String = ""
    
    @Published var addnameTeam: String = ""
    @Published var addSubs: String = ""
    @Published var addIncome: String = ""

    @Published var isEdit: Bool = false
    
    @Published var isAddTeam: Bool = false
    @Published var isAddStat: Bool = false
    @Published var isAddBudget: Bool = false
    @Published var isEditBudget: Bool = false
    
    @Published var isTeam: Bool = false
    @Published var isStat: Bool = false
    @Published var isBudget: Bool = false

    @Published var isDeleteTeam: Bool = false
    @Published var isDeleteStat: Bool = false
    @Published var isDeleteBudget: Bool = false

    @Published var plName: String = ""
    @Published var plNick: String = ""
    @Published var plPos: String = ""
    @Published var plChar: String = ""

    @Published var players: [PlayerModel] = []
    @Published var selectedPlayer: PlayerModel?

    func addPlayer() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PlayerModel", into: context) as! PlayerModel

        loan.plName = plName
        loan.plNick = plNick
        loan.plPos = plPos
        loan.plChar = plChar

        CoreDataStack.shared.saveContext()
    }

    func fetchPlayers() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlayerModel>(entityName: "PlayerModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.players = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.players = []
        }
    }
    
    @Published var stName: String = ""
    @Published var stNick: String = ""
    @Published var stWin: String = ""
    @Published var stLos: String = ""
    @Published var stKDA: String = ""

    @Published var statistics: [StatModel] = []
    @Published var selectedStat: StatModel?

    func addStat() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "StatModel", into: context) as! StatModel

        loan.stName = stName
        loan.stNick = stNick
        loan.stWin = stWin
        loan.stLos = stLos
        loan.stKDA = stKDA

        CoreDataStack.shared.saveContext()
    }

    func fetchStats() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<StatModel>(entityName: "StatModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.statistics = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.statistics = []
        }
    }
    
    @Published var budName: String = ""
    @Published var budDescr: String = ""
    @Published var budAmount: String = ""

    @Published var budgets: [BudgetModel] = []
    @Published var selectedBudget: BudgetModel?

    func addBudget() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "BudgetModel", into: context) as! BudgetModel

        loan.budName = budName
        loan.budDescr = budDescr
        loan.budAmount = budAmount

        CoreDataStack.shared.saveContext()
    }

    func fetchBudgets() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<BudgetModel>(entityName: "BudgetModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.budgets = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.budgets = []
        }
    }
}
