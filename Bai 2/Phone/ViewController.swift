//
//  ViewController.swift
//  Phone
//
//  Created by MSI GP63 8RD on 24/04/2022.
//

import UIKit

class PhoneContact:NSObject{
    var phone: String = ""
    var title: String = ""
    var time: String = ""
    var status: Bool = true
    
    override init() {
        super.init()
    }
    
    init(phone:String , title: String , time: String , status: Bool){
        self.phone = phone
        self.title = title
        self.time = time
        self.status = status
    }

    
}

class ViewController: UIViewController  {
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var sgCall: UISegmentedControl!
    
    @IBOutlet weak var btnFix: UIButton!
    var array: [PhoneContact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fakeData()
        // Do any additional setup after loading the view.
    }

    func fakeData(){
        for i in 0...10{
            let statusPhone: Bool = (i%2 == 0) ? true : false
            let data = PhoneContact(phone: "012345678\(i)", title: "skype \(i)", time: "12:0\(i)", status: statusPhone)
            array.append(data)
        }
    }

}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell") as! PhoneCell
        cell.config(array[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
