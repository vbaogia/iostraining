//
//  CELL.swift
//  Contact
//
//  Created by MSI GP63 8RD on 02/03/2022.
//

import UIKit

class CELL: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var checkBoxButton: CheckBoxButton!
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImg.layer.cornerRadius = avatarImg.frame.size.width / 2
        avatarImg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(data: PhoneContactModel){
        nameLbl.text = data.name
        phoneLbl.text = data.phone
        avatarImg.image = UIImage(named: "\(data.avatar)")
    }

}
