//
//  ChartViewController.swift
//  Personal Finance Manager
//
//  Created by RASHED on 7/1/24.
//

import UIKit
import TomatoPieChartFramework

class ChartViewController: TomatoPieChartViewController {
    
    @IBOutlet weak var chartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        
    }
    
    @IBAction func onTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ChartViewController {
    private func registerCell() {
        chartTableView.register(TableViewCell.chartTableViewCell.nib, forCellReuseIdentifier: TableViewCell.chartTableViewCell.identifier)
        chartTableView.register(TableViewCell.transactionTableViewCell.nib, forCellReuseIdentifier: TableViewCell.transactionTableViewCell.identifier)
    }
    
    private func setUpTableView() {
        registerCell()
        chartTableView.delegate = self
        chartTableView.dataSource = self
    }
}

extension ChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.chartTableViewCell.identifier, for: indexPath) as? ChartTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.transactionTableViewCell.identifier, for: indexPath) as? TransactionTableViewCell else {
                return UITableViewCell()
            }
            return cell
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

extension ChartViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell index \(indexPath.row + 1)")
        push(from: Storyboard.main.rawValue, identifier: ViewControllerIdentifier.expenseViewController.rawValue) { (viewController: ExpenseViewController) in
        }
    }
}


