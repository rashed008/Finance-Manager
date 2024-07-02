//
//  ChartTableViewCell.swift
//  Personal Finance Manager
//
//  Created by RASHED on 7/1/24.
//

import UIKit
import TomatoPieChartFramework


class ChartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var chartView: UIView!
    var pieChartView: PieChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupPieChartView()
        loadChartData()
    }
    
    private func setupPieChartView() {
        pieChartView = PieChartView(frame: chartView.bounds)
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.addSubview(pieChartView)
        
        NSLayoutConstraint.activate([
            pieChartView.leadingAnchor.constraint(equalTo: chartView.leadingAnchor),
            pieChartView.trailingAnchor.constraint(equalTo: chartView.trailingAnchor),
            pieChartView.topAnchor.constraint(equalTo: chartView.topAnchor),
            pieChartView.bottomAnchor.constraint(equalTo: chartView.bottomAnchor)
        ])
    }
    
    private func loadChartData() {
        let data: [PieChartData] = [
            PieChartData(name: "Food", value: 2.50, color: .red),
            PieChartData(name: "Transport", value: 1.00, color: .purple),
            PieChartData(name: "Medical", value: 1.00, color: .orange)
        ]
        
        pieChartView.data = data
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

