//
//  ExpenseViewController.swift
//  Personal Finance Manager
//
//  Created by RASHED on 6/30/24.
//

import UIKit
import CoreData

protocol refreshScreeen {
    func refreshDashBoardData()
}

class ExpenseViewController: UIViewController {
    
    @IBOutlet weak var addExpenseButton: UIButton!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var showDate: UITextField!
    @IBOutlet weak var showTime: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var typeTagTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var dropdownButton: UIButton!
    @IBOutlet weak var dropdownTextField: UITextField!
    @IBOutlet weak var typeTagButton: UIButton!
    @IBOutlet weak var titleText: UILabel!
    
    var delegate: refreshScreeen!
    var buttonName: String = ""
    var financeManagerData:  FinanceManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        showIncomeExpenseDropDown()
        showTypeTagDropDown()
    }
    
    func setUpUI() {
        if (buttonName == "Add") {
            addExpenseButton.setTitle("Add Expense", for: .normal)
            titleText.text = "Add Details"
        } else {
            addExpenseButton.setTitle("Edit Expense", for: .normal)
            titleText.text = "Edit Details"
            titleTextField.text  = financeManagerData?.title
            amountTextField.text = String(financeManagerData?.amount ?? 0)
            typeTextField.text = financeManagerData?.type
            typeTagTextField.text = financeManagerData?.typeTag
            dateTextField.text = financeManagerData?.createdAt
            timeTextField.text = financeManagerData?.time
            noteTextField.text = financeManagerData?.note
        }
        showDate.setCurrentDate()
        showTime.setCurrentTime()
        dateView.layer.cornerRadius = 7
        timeView.layer.cornerRadius = 7
    }
    
    func showIncomeExpenseDropDown() {
        dropdownButton.tag = 1000
        dropdownTextField.tag = 1002
        let options = ["INCOME", "EXPENSE"]
        setupDropdown(button: dropdownButton, textField: dropdownTextField, options: options, pickerViewTag: 1001)
    }
    
    func showTypeTagDropDown() {
        typeTagButton.tag = 1001
        typeTagTextField.tag = 1003
        let typeTagOptions = ["TRANSPORT", "FOOD", "MEDICAL"]
        setupDropdown(button: typeTagButton, textField: typeTagTextField, options: typeTagOptions, pickerViewTag: 1002)
    }
    
    @IBAction func onTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onTapAddEditData(_ sender: Any) {
        if (buttonName == "Add") {
            addExpenseButton.setTitle("Add Expense", for: .normal)
            let titleText = titleTextField.text ?? ""
            let amountText = Double(amountTextField.text ?? "") ?? 0
            let typeText = typeTextField.text ?? ""
            let typeTagText = typeTagTextField.text ?? ""
            let dateText = dateTextField.text ?? ""
            let timetext = timeTextField.text ?? ""
            let noteText = noteTextField.text ?? ""
            
            let financeManagerDict: [String: Any] = [
                "FNtitle": titleText,
                "FNamount": amountText,
                "FNtype": typeText,
                "FNtypeTag": typeTagText,
                "FNdateText" : dateText,
                "FNtimetext" : timetext,
                "FNnoteText" : noteText
            ]
            
            LocalDataGlobalHelper().addNewEmpData(dic: financeManagerDict)
        } else {
            financeManagerData?.title = titleTextField.text ?? ""
            financeManagerData?.amount = Double(amountTextField.text ?? "") ?? 0
            financeManagerData?.type = typeTextField.text ?? ""
            financeManagerData?.typeTag = typeTagTextField.text ?? ""
            financeManagerData?.createdAt = dateTextField.text ?? ""
            financeManagerData?.time = timeTextField.text ?? ""
            financeManagerData?.note =  noteTextField.text ?? ""
            
            LocalDataGlobalHelper().editEmpData()
        }
        
        push(from: Storyboard.main.rawValue, identifier: ViewControllerIdentifier.dashboardViewController.rawValue) { (viewController: DashboardViewController) in
        }
    }
}
