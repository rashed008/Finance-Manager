import XCTest
@testable import Personal_Finance_Manager

final class Personal_Finance_ManagerTests: XCTestCase {
    var dashboardVC: DashboardViewController!
    var mockFinanceData: [FinanceManager]!

    override func setUpWithError() throws {
        try super.setUpWithError()
        dashboardVC = DashboardViewController()
        mockFinanceData = [FinanceManager]()
    }

    override func tearDownWithError() throws {
        dashboardVC = nil
        mockFinanceData = nil
        try super.tearDownWithError()
    }

    func testScheduleLocalNotification() throws {
        dashboardVC.scheduleLocalNotification(title: "Test", body: "This is a test notification", timeInterval: 5)
    }

    func testTableViewDataSource() throws {
        let tableView = UITableView()
        tableView.dataSource = dashboardVC
        dashboardVC.financeManagerDataArray = mockFinanceData
        XCTAssertEqual(dashboardVC.tableView(tableView, numberOfRowsInSection: 0), 1 + mockFinanceData.count)
    }

    func testPerformanceExample() throws {
        measure {
            dashboardVC.getFinanceManagerData()
        }
    }
}


