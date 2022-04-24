//
//  PresentViewController.swift
//  BaoBeo
//
//  Created by anhtdt on 24/04/2022.
//

import Foundation
import UIKit

protocol PresentViewProtocol {
    func didSelectCell(_ alert: String)
}

class PresentViewController: UIViewController{
    
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var quitBtn: UIButton!
    
    var delegate: PresentViewProtocol?
    
    var array : [String] = ["Dang ky","Xem","Xoa"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension PresentViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbView.dequeueReusableCell(withIdentifier: "OptionalCell") as! Optionalcell
        cell.detailLbl.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true) {
            self.delegate?.didSelectCell(self.array[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
