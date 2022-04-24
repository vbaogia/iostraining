//
//  BillCell.swift
//  BaoBeo
//
//  Created by anhtdt on 24/04/2022.
//

import UIKit

class BillCell: UITableViewCell {
    
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var moneyLbl: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var payBtn: UIButton!
    
    @IBOutlet weak var bgView: UIView!
    var onClick: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.gray.cgColor
        bgView.layer.cornerRadius = 8
    }
    
    func config(_ data: Contact){
        nameLbl.text = data.name
        descriptionLbl.text = data.desc
        moneyLbl.text = data.money
        if data.money == ""{
            checkBtn.isHidden = false
            payBtn.isHidden = true
            moreBtn.isHidden = false
        } else {
            checkBtn.isHidden = true
            payBtn.isHidden = false
            moreBtn.isHidden = true
        }
    }
    
    @IBAction func didSelectInfor(_ sender: Any) {
        self.onClick?()
    }
}
