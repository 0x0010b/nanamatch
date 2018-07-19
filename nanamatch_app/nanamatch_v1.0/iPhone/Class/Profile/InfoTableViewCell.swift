//
//  InfoTableViewCell.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 2/07/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblInfoTitle: UILabel!
    @IBOutlet weak var lblInfoContent: UILabel!
    
    var infoContent: String! {
        didSet{
            self.lblInfoContent.text = self.infoContent ?? ""
        }
    }
    var infoTitle: String!{
        didSet{
            self.lblInfoTitle.text = self.infoTitle ?? ""
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }

}
