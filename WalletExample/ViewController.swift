//
//  ViewController.swift
//  WalletExample
//
//  Created by Sacha DSO on 10/12/2017.
//  Copyright © 2017 freshos. All rights reserved.
//

import UIKit
import Ark

class ViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var publicKeyLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    let account = Account(address: "AK3wUpsmyFrWvgytFRoaHatEKj3uxUBZE6")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Account"
        refreshButton.layer.cornerRadius = 8
        addressLabel.text = account.address
        balanceLabel.text = "unkown"

        refresh()
        account.fetchDelegates().then { delegates in
            print(delegates)
        }
        
//        Block.fetchSupply().then { supply in
//            print(supply)
//        }
//
//        Block.fetchMilestone().then { milestone in
//            print(milestone)
//        }
//
//        Block.fetchReward().then { reward in
//            print(reward)
//        }
//
//        Block.fetchFee().then { fee in
//            print(fee)
//        }
//
//        Block.fetchNethash().then { nethash in
//            print(nethash)
//        }
        
        
        account.fetchTransactions().then { transactions in
            print(transactions)
        }
        
    }
    
    @IBAction func refreshTapped() {
        refresh()
    }
    
    func refresh() {
        account.fetchInfo().then { a in
            self.balanceLabel.text = "\(a.balance!.confirmed.toStandard())"
            self.publicKeyLabel.text = a.publicKey
        }
    }
}

extension Float {
    func toStandard() -> Float {
        return self / Float(100000000)
    }
}
