//
//  IssueDetailViewController.swift
//  JusticeAppp
//
//  Created by iosdev on 6/8/19.
//  Copyright © 2019 Ivan Karpets. All rights reserved.
//

import UIKit

class IssueDetailViewController: UIViewController {
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Повідомлення", message: "Ваша скарга видалена", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Продовжити", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var navTitle: UINavigationItem!
    
    @IBOutlet weak var topCell: IssueDetailCell!
    
    @IBOutlet weak var shortTitleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusBar: UIView!
    @IBOutlet weak var personCategroryLabel: UILabel!
    @IBOutlet weak var sinPersonLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    var shortTitle : String?
    var number: String?
    var date : String?
    var status: String?
    var personCategory: String?
    var sinPerson: String?
    var comment: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shortTitleLabel?.text = self.shortTitle
        self.numberLabel?.text = self.number
        self.dateLabel?.text = self.date
        self.statusLabel?.text = self.status
        self.personCategroryLabel?.text = self.personCategory
        self.sinPersonLabel?.text = self.sinPerson
        self.commentLabel?.text = self.comment
        self.statusBar?.backgroundColor = self.color
    }
    
   
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
