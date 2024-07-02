//
//  ShowBalanceTableViewCell.swift
//  Personal Finance Manager
//
//  Created by RASHED on 6/30/24.
//

import UIKit

protocol CustomViewDelegate: AnyObject {
    func didPressIncomeButton()
    func didPressExpenseButton()
}

class ShowBalanceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var totalBalanceView: UIView!
    @IBOutlet weak var incomeView: UIView!
    @IBOutlet weak var expenseView: UIView!
    @IBOutlet weak var incomeButton: UIButton!
    @IBOutlet weak var expenseButton: UIButton!
    @IBOutlet weak var totalBalance: UILabel!
    @IBOutlet weak var income: UILabel!
    @IBOutlet weak var expense: UILabel!
    weak var delegate: CustomViewDelegate?
    
    var financeBlanceData: FinanceManager? {
        didSet {
            financeDetailsConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        incomeButton.addTarget(self, action: #selector(incomeButtonPressed), for: .touchUpInside)
        expenseButton.addTarget(self, action: #selector(iexpenseButtonPressed), for: .touchUpInside)
    }
    
    func setUpUI() {
        totalBalanceView.layer.cornerRadius = 7
        incomeView.layer.cornerRadius = 7
        expenseView.layer.cornerRadius = 7
    }
    
    @objc func incomeButtonPressed() {
        delegate?.didPressIncomeButton()
    }
    
    @objc func iexpenseButtonPressed() {
        delegate?.didPressExpenseButton()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func financeDetailsConfiguration() {
        expense.text = "$" + "\(4.00)"
        income.text = "$" + "\(6.00)"
    }
}
