//
//  TransactionCell.swift
//  WalletExample
//
//  Created by Sacha DSO on 11/12/2017.
//  Copyright © 2017 freshos. All rights reserved.
//

import UIKit
import Stevia

class TransactionCell: UITableViewCell {

    let id = UILabel()
    let from = UILabel()
    let to = UILabel()
    let amount = UILabel()
    let confirmations = UILabel()
    let date = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let stack = UIStackView(arrangedSubviews: [
            id,
            from,
            to,
            amount,
            date,
            confirmations
        ])
        stack.axis = .vertical
        
        sv(
            stack
        )
        
        stack.fillContainer(20)
        
        id.lineBreakMode = .byTruncatingMiddle
        from.lineBreakMode = .byTruncatingMiddle
        to.lineBreakMode = .byTruncatingMiddle
        
        let labels = [
            id,
            from,
            to,
            date,
            confirmations,
            amount
        ]
        
        for l in labels {
            l.font = UIFont.systemFont(ofSize: 13)
        }

    }
}
