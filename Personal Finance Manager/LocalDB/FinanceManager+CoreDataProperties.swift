//
//  FinanceManager+CoreDataProperties.swift
//  Personal Finance Manager
//
//  Created by RASHED on 7/2/24.
//
//

import Foundation
import CoreData


extension FinanceManager {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FinanceManager> {
        return NSFetchRequest<FinanceManager>(entityName: "FinanceManager")
    }

    @NSManaged public var amount: Double
    @NSManaged public var createdAt: String?
    @NSManaged public var note: String?
    @NSManaged public var time: String?
    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var typeTag: String?

}

extension FinanceManager : Identifiable {

}
