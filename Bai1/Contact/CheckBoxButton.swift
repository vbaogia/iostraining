//
//  CheckBoxButton.swift
//  Contact
//
//  Created by MSI GP63 8RD on 02/03/2022.
//

import Foundation
import UIKit
class CheckBoxButton: UIButton {
    let CheckedImage = UIImage(named: "checkbox_checked")! as UIImage
    let UnCheckedImage = UIImage(named: "checkbox_unchecked")! as UIImage
    //Bool
    
    var isChecked: Bool = false{
        didSet{
            if isChecked == true {
                self.setImage(UnCheckedImage, for: .normal)
            }else{
                self.setImage(CheckedImage, for: .normal)
            }
        }
    }
    //
    override func awakeFromNib() {
        self.isUserInteractionEnabled = true
        self.addTarget(self, action: #selector(CheckBoxButton.ButtonClicked), for: UIControl.Event.touchUpInside)
        
        self.isChecked = false
    }
    
    //button click sunction
    @objc func ButtonClicked(sender: UIButton){
        if sender == self {
            if isChecked == true {
                isChecked = false
            } else{
                isChecked = true
            }
        }
    }
    
}
