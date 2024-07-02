//
//  Personal_Finance_Manager_Expense.swift
//  Personal Finance ManagerTests
//
//  Created by RASHED on 7/2/24.
//

import XCTest
@testable import Personal_Finance_Manager

final class Personal_Finance_Manager_Expense: XCTestCase {

    var expenseViewController: ExpenseViewController!
    var financeManagerData: FinanceManager!

    override func setUpWithError() throws {
        try super.setUpWithError()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        expenseViewController = storyboard.instantiateViewController(withIdentifier: "ExpenseViewController") as? ExpenseViewController
        expenseViewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        expenseViewController = nil
        financeManagerData = nil
        try super.tearDownWithError()
    }

    func testSetUpUIForAdd() throws {
        expenseViewController.buttonName = "Add"
        expenseViewController.setUpUI()

        XCTAssertEqual(expenseViewController.addExpenseButton.title(for: .normal), "Add Expense")
        XCTAssertEqual(expenseViewController.titleText.text, "Add Details")
        XCTAssertTrue(expenseViewController.titleTextField.text?.isEmpty ?? false)
    }

    func testSetUpUIForEdit() throws {
        financeManagerData = FinanceManager()
        financeManagerData.title = "Sample Title"
        financeManagerData.amount = 100.0
        financeManagerData.type = "EXPENSE"
        financeManagerData.typeTag = "FOOD"
        financeManagerData.createdAt = "2024-07-01"
        financeManagerData.time = "12:00 PM"
        financeManagerData.note = "Sample Note"
        expenseViewController.buttonName = "Edit"
        expenseViewController.financeManagerData = financeManagerData
        expenseViewController.setUpUI()

        XCTAssertEqual(expenseViewController.addExpenseButton.title(for: .normal), "Edit Expense")
        XCTAssertEqual(expenseViewController.titleText.text, "Edit Details")
        XCTAssertEqual(expenseViewController.titleTextField.text, "Sample Title")
        XCTAssertEqual(expenseViewController.amountTextField.text, "100.0")
        XCTAssertEqual(expenseViewController.typeTextField.text, "EXPENSE")
        XCTAssertEqual(expenseViewController.typeTagTextField.text, "FOOD")
        XCTAssertEqual(expenseViewController.dateTextField.text, "2024-07-01")
        XCTAssertEqual(expenseViewController.timeTextField.text, "12:00 PM")
        XCTAssertEqual(expenseViewController.noteTextField.text, "Sample Note")
    }
}
