//
//  InfoVC.swift
//  WalletExample
//
//  Created by Sacha DSO on 11/12/2017.
//  Copyright © 2017 freshos. All rights reserved.
//

import UIKit
import Ark

class InfoVC: UIViewController {
    
    let v = InfoView()
    override func loadView() { view = v }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Info"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Block.fetchSupply().then { supply in
            self.v.supply.text = "Supply: \(supply.toStandard()) ARK"
        }        

        Block.fetchMilestone().then { milestone in
            self.v.milestone.text = "Milestone: \(milestone)"
        }
    
        Block.fetchReward().then { reward in
            self.v.reward.text = "Reward: \(reward.toStandard()) ARK"
        }

        Block.fetchFee().then { fee in
            self.v.fee.text = "Fee: \(fee.toStandard()) ARK"
        }

        Block.fetchNethash().then { nethash in
            self.v.nethash.text = "Nethash: \(nethash)"
        }
        
//        Block.fetchBlocks().then { blocks in
//            print(blocks)
//        }
    }
}
