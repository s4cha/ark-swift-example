//
//  TransactionsVC.swift
//  WalletExample
//
//  Created by Sacha DSO on 11/12/2017.
//  Copyright © 2017 freshos. All rights reserved.
//

import UIKit
import Ark

class TransactionsVC: UITableViewController {
    
    let account = Account(address: "AK3wUpsmyFrWvgytFRoaHatEKj3uxUBZE6")
    var transactions = [Transaction]()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Transactions"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        tableView.register(TransactionCell.self, forCellReuseIdentifier: "TransactionCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
        cell.id.text = "Id: " + transaction.id
        cell.confirmations.text = transaction.confirmations == nil ? "unknown" : "\(transaction.confirmations!) confirmations"
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .short
        cell.date.text = df.string(from: transaction.date!)
        cell.from.text = "From: " + transaction.senderId!
        if transaction.type == 3 {
            cell.to.text = "Vote"
        } else {
            cell.to.text = "To: " + transaction.recipientId!
        }
        if transaction.type == 3 {
            cell.amount.text = "-\(transaction.fee!.toStandard()) ARK"
            cell.amount.textColor = UIColor(red: 255/255.0, green: 59/255.0, blue: 48/255.0, alpha: 1)
        } else {
            cell.amount.text = "\(transaction.amount!.toStandard()) ARK"
            cell.amount.textColor = UIColor(red: 76/255.0, green: 217/255.0, blue: 100/255.0, alpha: 1)
        }
        return cell
    }
}
