//
//  Model.swift
//  BaoBeo
//
//  Created by anhtdt on 24/04/2022.
//

import Foundation

class Contact:NSObject{
    var name: String = ""
    var desc: String = ""
    var money : String = ""
        
    init(name: String,desc: String,money: String){
        self.name = name
        self.desc = desc
        self.money = money
    }
}
