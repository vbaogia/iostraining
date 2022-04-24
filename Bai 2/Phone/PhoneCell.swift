//
//  PhoneCell.swift
//  Phone
//
//  Created by MSI GP63 8RD on 24/04/2022.
//

import UIKit

class PhoneCell: UITableViewCell {

    @IBOutlet weak var phoneImg: UIImageView!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func didselectedMore(_ sender: Any) {
    }
    
    func config(_ data: PhoneContact){
        phoneLbl.text = data.phone
        titleLbl.text = data.title
        timeLbl.text = data.time
        phoneLbl.textColor = (data.status) ? .black : .red
    }
}


