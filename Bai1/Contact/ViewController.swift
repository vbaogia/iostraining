//
//  ViewController.swift
//  Contact
//
//  Created by MSI GP63 8RD on 02/03/2022.
//

import UIKit

class PhoneContactModel: NSObject {
    var name: String = ""
    var phone: String = ""
    var avatar: String = ""
    
    
    override init() {
        super.init()
    }
    
    init(name: String , phone: String , avatar: String) {
        self.name = name
        self.phone = phone
        self.avatar = avatar
    }
}

class PhoneBookMultiModel {
    var sectionTitle: String = ""
    var contactArr: [PhoneContactModel] = []
    
    init(sectionTitle: String, contactArr: [PhoneContactModel]) {
        self.sectionTitle = sectionTitle
        self.contactArr = contactArr
    }
    
}

class ViewController: UIViewController {

    var rowWhichAreChecked = [NSIndexPath]()
    @IBOutlet weak var myTable: UITableView!
    var arrContact: [PhoneBookMultiModel] = [PhoneBookMultiModel(sectionTitle: "Danh bạ 1", contactArr: [])]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        for i in 0...10 {
           var a = PhoneContactModel(name: "nguyen van b", phone: "09123432412", avatar: "img_avatar")
            arrContact[0].contactArr.append(a)
        }
        arrContact.append(PhoneBookMultiModel(sectionTitle: "Danh bạ 2", contactArr: [PhoneContactModel(name: "nguyen van d", phone: "09121432412", avatar: "img_avatar"),PhoneContactModel(name: "nguyen van e", phone: "091211432412", avatar: "img_avatar")]))
        
        myTable.allowsMultipleSelection = true
        
    }
    
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label = UILabel(frame: CGRect(x: 5, y: 5, width: 5, height: 5))
//        label.text = arrContact[section].sectionTitle
//
//        return label
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrContact.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrContact[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrContact[section].contactArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as! CELL
        cell.config(data: arrContact[indexPath.section].contactArr[indexPath.row])
        let isRowChecked = rowWhichAreChecked.contains(indexPath as NSIndexPath)
        if (isRowChecked == true){
            cell.checkBoxButton.isChecked = true
            cell.checkBoxButton.ButtonClicked(sender: cell.checkBoxButton)
        } else {
            cell.checkBoxButton.isChecked = false
            cell.checkBoxButton.ButtonClicked(sender: cell.checkBoxButton)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.00
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath) as! CELL
        cell.contentView.backgroundColor = UIColor.white
        //cross checking for checked row
        if (rowWhichAreChecked.contains(indexPath as IndexPath as NSIndexPath) == false) {
            cell.checkBoxButton.isChecked = true
            cell.checkBoxButton.ButtonClicked(sender: cell.checkBoxButton)
        
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath) as! CELL
        cell.checkBoxButton.isChecked = false
        cell.checkBoxButton.ButtonClicked(sender: cell.checkBoxButton)
        //remove indexPath from rowwhichareclicked
        
        if let checkedItemIndex = rowWhichAreChecked.firstIndex(of: indexPath as NSIndexPath){
            rowWhichAreChecked.remove(at: checkedItemIndex)
        }
        
    }
}

