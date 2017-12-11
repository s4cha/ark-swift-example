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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
