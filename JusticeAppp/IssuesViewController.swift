//
//  IssuesViewController.swift
//  JusticeAppp
//
//  Created by iosdev on 6/8/19.
//  Copyright © 2019 Ivan Karpets. All rights reserved.
//

import UIKit

private let reuseIdentifier = "IssueIdentifier"

class IssuesViewController: UICollectionViewController {

    var categories = [Issue]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = [Issue( name: "Немає доступу до аптеки", status: .submitted, number: "#123", date: "21.12.19 12:00", personCategory: .invalid, sinPerson: #"Аптека "Добра Аптека""#, comment: "Автомобілі перекрили доступ до входу, я не можу увійти"),
                      Issue(name: "Сексуальне залицяння",status: .transmitted, number: "#1222", date: "21.12.19 12:00", personCategory: .elderly, sinPerson: "Мій сусід Василь Бичкарь", comment: "пропонував мені дати йому хабар у вигляді сексу")]
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IssueCell
        let path = categories[indexPath.row]
        cell.shortTitleLabel?.text = path.shortName
        
        cell.dateLabel?.text = path.date
        cell.statusLabel?.text = path.statusText
        
        cell.statusBarView.backgroundColor = getStatusColor(status: path.status)
        
        cell.contentView.layer.cornerRadius = 12.0
        cell.contentView.layer.borderWidth = 0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true;
        
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        return cell
    }
    
    func getStatusColor(status: IssueStatus)-> UIColor{
        switch status {
        case .submitted:
            return UIColor(red:0.31, green:0.18, blue:0.90, alpha:1.0)
        case .transmitted:
            return .gray
        case .considered:
            return UIColor(red:0.90, green:0.79, blue:0.18, alpha:1.0)
        case .done:
            return UIColor(red:0.21, green:0.71, blue:0.22, alpha:1.0)
        case .canceled:
            return UIColor(red:0.91, green:0.29, blue:0.17, alpha:1.0)
        default:
            return UIColor(red:0.31, green:0.18, blue:0.90, alpha:1.0)
        }
    }
    
    func getPersonCategory(category: PersonCategory)-> String{
        switch category {
        case .elderly:
            return "Особи похилого віку"
        case .homeless:
            return "Безхатченки"
        case .invalid:
            return " Особи з інвалідністю"
        default:
            return "інші"
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showIssueDetail" {
            let formVC = segue.destination as! IssueDetailViewController
            
            let cell = sender as! IssueCell
            
            let indexPath = self.collectionView!.indexPath(for: cell) 
            
            let path = categories[(indexPath?.row)!]
          
            formVC.status = path.defineStatusText(status: path.status)
            formVC.color = self.getStatusColor(status: path.status)
            formVC.navTitle.title = path.number
            formVC.shortTitle = path.shortName
            formVC.number = path.number
            formVC.date = path.date
            formVC.statusBar?.backgroundColor = getStatusColor(status: path.status)
            formVC.personCategory = getPersonCategory(category: path.personCategory)
            formVC.sinPerson = path.sinPerson
            formVC.comment = path.comment
            
        }
    }
}
