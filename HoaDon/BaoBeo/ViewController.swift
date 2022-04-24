//
//  ViewController.swift
//  BaoBeo
//
//  Created by anhtdt on 24/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var searchTf: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBtn: UIButton!
    
    var array: [Contact] = [] // strong
    var searchArr: [Contact] = []
    var isSearching: Bool = false
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBtn.layer.cornerRadius = addBtn.bounds.size.width/2
        searchView.layer.cornerRadius = searchView.bounds.size.height/2
        fakeData()
    }


    @IBAction func didselectAdd(_ sender: Any) {
        
    }
    
    func fakeData(){
        for i in 0...10{
            let moneyBill: String = (i%2 == 0) ? "" : "500.00\(i) VND"
            let data = Contact(name: "Nguyen Van A\(i)", desc: "ABC1234\(i)", money: moneyBill)
            array.append(data)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BillCell") as! BillCell
        let data = isSearching ? searchArr[indexPath.row] : array[indexPath.row]
        cell.config(data)
        cell.onClick = { [weak self] in
            self?.index = indexPath.row
            let scr = self?.storyboard?.instantiateViewController(withIdentifier: "MH2") as! PresentViewController
            scr.modalPresentationStyle = .overFullScreen
            scr.delegate = self
            self?.present(scr, animated: true, completion: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? searchArr.count : array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
}

extension ViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == searchTf {
            searchArr.removeAll()
            if let text = textField.text {
                isSearching = (text != "")
                for i in 0..<array.count{
                    if text.lowercased().contains(array[i].name.lowercased()){
                        searchArr.append(array[i])
                    }
                }
                tableView.reloadData()
            }
        }
    }
}

extension ViewController: PresentViewProtocol{
    func didSelectCell(_ alert: String) {
        print("\(alert)")
        if alert == "Xoa" {
            array.remove(at: index)
            tableView.reloadData()
        }
    }
}
