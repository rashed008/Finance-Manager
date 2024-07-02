//
//  DashboardViewController.swift
//  Personal Finance Manager
//
//  Created by RASHED on 6/30/24.
//

import UIKit
import CoreData
import UserNotifications

class DashboardViewController: UIViewController, refreshScreeen {
    
    @IBOutlet weak var dashBoardTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    var financeManagerDataArray: [FinanceManager] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        getFinanceManagerData()
        setUpTableView()
        setUpUI()
        scheduleLocalNotification(title: "Personal Finance Manager", body: "Your Medical allowance budget will be exceeds soon", timeInterval: 5)
    }
    
    func setUpUI() {
        addButton.layer.cornerRadius = addButton.frame.size.width/2
        addButton.clipsToBounds = true
    }
    
    func getFinanceManagerData() {
        financeManagerDataArray = LocalDataGlobalHelper().fetchFinanceData()
    }

    func refreshDashBoardData() {
        getFinanceManagerData()
    }
}

extension DashboardViewController : CustomViewDelegate {
    
    func didPressIncomeButton() {
        push(from: .main, identifier: .chartViewController)
    }
    
    func didPressExpenseButton() {
        push(from: .main, identifier: .chartViewController)
    }
    
    @IBAction func onTapFilterButton(_ sender: Any) {
        showFilterActionSheet { selectedFilter in
            print("Selected filter: \(selectedFilter)")
        }
    }
    
    @IBAction func onTapAddButton(_ sender: Any) {
        push(from: Storyboard.main.rawValue, identifier: ViewControllerIdentifier.expenseViewController.rawValue) { (viewController: ExpenseViewController) in
            viewController.buttonName = "Add"
            viewController.delegate = self
        }
    }
}

extension DashboardViewController {
    private func registerCell() {
        dashBoardTableView.register(TableViewCell.showBalanceTableViewCell.nib, forCellReuseIdentifier: TableViewCell.showBalanceTableViewCell.identifier)
        dashBoardTableView.register(TableViewCell.transactionTableViewCell.nib, forCellReuseIdentifier: TableViewCell.transactionTableViewCell.identifier)
    }
    
    private func setUpTableView() {
        registerCell()
        dashBoardTableView.delegate = self
        dashBoardTableView.dataSource = self
    }
}

extension DashboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + financeManagerDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.showBalanceTableViewCell.identifier, for: indexPath) as? ShowBalanceTableViewCell else {
                return UITableViewCell()
            }
            let financeData = financeManagerDataArray[indexPath.row]
            cell.financeBlanceData = financeData
            cell.delegate = self
            return cell
        } else if (indexPath.row - 1 < financeManagerDataArray.count) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.transactionTableViewCell.identifier, for: indexPath) as? TransactionTableViewCell else {
                return UITableViewCell()
            }
            let financeTransactionsData = financeManagerDataArray[indexPath.row - 1]
            cell.financeTransactionData = financeTransactionsData
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            showAlertWithActions(title: "Delete Confirmation", message: "Are you sure you want to delete this item?", yesActionTitle: "Delete", noActionTitle: "Cancel", yesHandler: {
                self.financeManagerDataArray = LocalDataGlobalHelper().deleteEmpData(arr: self.financeManagerDataArray, index: indexPath.row - 1)
                if self.financeManagerDataArray.count > 0 {
                    self.dashBoardTableView.deleteRows(at: [indexPath], with: .automatic)
                }
            })
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 322
        } else {
            return 83
        }
    }
}


extension DashboardViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell index \(indexPath.row + 1)")
        push(from: Storyboard.main.rawValue, identifier: ViewControllerIdentifier.expenseViewController.rawValue) { (viewController: ExpenseViewController) in
            viewController.financeManagerData = self.financeManagerDataArray[indexPath.row - 1]
            viewController.delegate = self
        }
    }
}


extension DashboardViewController {
    func scheduleLocalNotification(title: String, body: String, timeInterval: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }
}
