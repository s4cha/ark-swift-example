//
//  TransactionCell.swift
//  WalletExample
//
//  Created by Sacha DSO on 11/12/2017.
//  Copyright © 2017 freshos. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var confirmationsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let toto = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        toto.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(toto)
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//

}
