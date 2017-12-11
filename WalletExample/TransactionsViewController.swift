//
//  TransactionsViewController.swift
//  WalletExample
//
//  Created by Sacha DSO on 11/12/2017.
//  Copyright © 2017 freshos. All rights reserved.
//

import UIKit
import Ark

class TransactionsViewController: UITableViewController {
    
    let account = Account(address: "AK3wUpsmyFrWvgytFRoaHatEKj3uxUBZE6")
    var transactions = [Transaction]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        title = "Transactions"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl?.addTarget(self, action:#selector(refresh), for: .valueChanged)
        refresh()
    }
    
    @objc
    func refresh() {
        account.fetchTransactions().then { fetchedTransactions in
            self.transactions = fetchedTransactions
            self.tableView.reloadData()
        }.finally {
            self.refreshControl?.endRefreshing()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transaction = transactions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let cell = cell as? TransactionCell {
            cell.idLabel.text = transaction.id
            cell.confirmationsLabel.text = transaction.confirmations == nil ? "unknown" : "\(transaction.confirmations!)"
            let df = DateFormatter()
            df.dateStyle = .short
            df.timeStyle = .short
            
            cell.dateLabel.text = df.string(from: transaction.date!)
        }
        return cell
    }
}
