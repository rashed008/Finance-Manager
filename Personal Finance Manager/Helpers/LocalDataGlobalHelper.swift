//
//  LocalDataGlobalHelper.swift
//  Personal Finance Manager
//
//  Created by RASHED on 7/2/24.
//

import Foundation
import UIKit
import CoreData

struct LocalDataGlobalHelper {
    static var appDelegate = UIApplication.shared.delegate as? AppDelegate
    let context = appDelegate?.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FinanceManager")
    
    func fetchFinanceData() -> [FinanceManager] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FinanceManager")
        var financeManager = [FinanceManager]()
        do {
            financeManager = try context?.fetch(fetchRequest) as! [FinanceManager]
        } catch let error as NSError{
            print("Data Couldn't be saved because of :\(error)")
        }
        return financeManager
    }
    
    func addNewEmpData(dic: [String: Any]) {
        let entity = NSEntityDescription.entity(forEntityName: "FinanceManager", in: context!)
        let newData = NSManagedObject(entity: entity!, insertInto: context)
        
        newData.setValue(dic["FNtitle"], forKey: "title")
        newData.setValue(dic["FNtypeTag"], forKey: "typeTag")
        newData.setValue(dic["FNdateText"], forKey: "createdAt")
        newData.setValue(dic["FNnoteText"], forKey: "note")
        newData.setValue(dic["FNtimetext"], forKey: "time")
        newData.setValue(dic["FNtype"], forKey: "type")
        newData.setValue(dic["FNamount"], forKey: "amount")
        
        do {
            try context?.save()
            print("Data Saved Successfully")
        } catch let error as NSError{
            print("Data Couldn't be saved because of :\(error)")
        }
    }
    
    func editEmpData() {
        do {
            try context?.save()
        } catch let error as NSError{
            print("Data Couldn't be saved because of :\(error)")
        }
    }
    
    func deleteEmpData(arr: [FinanceManager], index: Int) -> [FinanceManager] {
        var arrEMP = arr
        context?.delete(arrEMP[index])
        arrEMP.remove(at: index)
        
        do {
            try context?.save()
        } catch let error as NSError{
            print("Data Couldn't be saved because of :\(error)")
        }
        
        return arrEMP
    }
}

