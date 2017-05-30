//
//  BasicInfoTableViewCell.swift
//  SMA
//
//  Created by Sunil Gurung on 5/9/17.
//  Copyright © 2017 Impactit. All rights reserved.
//

import UIKit

class BasicInfoTableViewCell: UITableViewCell {


    @IBOutlet weak var lblparentname: UILabel!
    @IBOutlet weak var lblparentnameetails: UILabel!
    
    @IBOutlet weak var lblsibiling: UILabel!
    @IBOutlet weak var lblsibilingdetails: UILabel!
    
    @IBOutlet weak var lblpastschool: UILabel!
    @IBOutlet weak var lblpastschooldetails: UILabel!
    
    @IBOutlet weak var lblspecialneed: UILabel!
    @IBOutlet weak var lblspecialneeddetails: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
