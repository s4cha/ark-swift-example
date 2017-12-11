//
//  InfoView.swift
//  WalletExample
//
//  Created by Sacha DSO on 11/12/2017.
//  Copyright © 2017 freshos. All rights reserved.
//

import UIKit
import Stevia

class InfoView: UIView {
    
    let supply = UILabel()
    let milestone = UILabel()
    let reward = UILabel()
    let fee = UILabel()
    let nethash = UILabel()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        let stack = UIStackView(arrangedSubviews: [
            supply,
            milestone,
            reward,
            fee,
            nethash
            ])
        stack.axis = .vertical
        
        sv(
            stack
        )
        
        |-20-stack.centerVertically()-20-|
        
        backgroundColor = .white
        
        nethash.lineBreakMode = .byTruncatingMiddle
    }
}
