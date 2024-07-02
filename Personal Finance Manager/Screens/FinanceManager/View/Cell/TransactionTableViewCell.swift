//
//  TransactionTableViewCell.swift
//  Personal Finance Manager
//
//  Created by RASHED on 6/30/24.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var transactionCellView: UIView!
    @IBOutlet weak var transactionImageView: UIView!
    
    @IBOutlet weak var typeTagLabel: UILabel!
    @IBOutlet weak var taypeLabel: UILabel!
    @IBOutlet weak var outcomeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var financeTransactionData: FinanceManager? {
        didSet {
            financeTransactionDetailsConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI() {
        transactionCellView.layer.cornerRadius = 7
        transactionImageView.layer.cornerRadius = 7
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func financeTransactionDetailsConfiguration(){
        typeTagLabel.text = financeTransactionData?.typeTag
        taypeLabel.text = financeTransactionData?.type
        outcomeLabel.text = "-$" + "0"
        dateLabel.text = financeTransactionData?.createdAt
    }
    
}
