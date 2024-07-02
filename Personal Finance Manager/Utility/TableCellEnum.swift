//
//  TableCellEnum.swift
//  Personal Finance Manager
//
//  Created by RASHED on 6/30/24.
//

import UIKit

enum TableViewCell {
    
    case showBalanceTableViewCell
    case transactionTableViewCell
    case chartTableViewCell
    
    var nib: UINib {
        var nib = UINib()
        switch self {
        case .showBalanceTableViewCell:
            nib = UINib(nibName: "ShowBalanceTableViewCell", bundle: nil)
        case .transactionTableViewCell:
            nib = UINib(nibName: "TransactionTableViewCell", bundle: nil)
        case .chartTableViewCell:
            nib = UINib(nibName: "ChartTableViewCell", bundle: nil)
        }
        return nib
    }
    
    var identifier: String {
        var identifier = ""
        
        switch self {
        case .showBalanceTableViewCell:
            identifier = "ShowBalanceTableViewCell"
        case .transactionTableViewCell:
            identifier = "TransactionTableViewCell"
        case .chartTableViewCell:
            identifier = "ChartTableViewCell"
        }
        return identifier
    }
}
