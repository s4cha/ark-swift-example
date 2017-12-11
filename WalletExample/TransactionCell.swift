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
    let confirmationsLabel = UILabel()
    let confirmations = UILabel()
    let date = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        let stack = UIStackView(arrangedSubviews: [
            id,
            confirmationsLabel,
            confirmations,
            date
            ])
        
        stack.axis = .vertical
        
        sv(
            stack
        )
        
        stack.fillContainer(20)
        
        id.lineBreakMode = .byTruncatingMiddle
    }
}
