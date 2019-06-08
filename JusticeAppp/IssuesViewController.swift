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
        
        categories = [Issue( name: "Inclusive", status: .submitted, number: "#123", date: "21.12.19 12:00"), Issue(name: "s45678fvhjd",status: .transmitted, number: "#1222", date: "21.12.19 12:00")]
        
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
        cell.numberOfTheIssueLabel?.text = path.number
        cell.dateLabel?.text = path.date
        cell.statusLabel?.text = path.statusText
        
        cell.statusBarView.backgroundColor = getStatusColor(status: path.status)
        
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showIssueDetail" {
            let formVC = segue.destination as! IssueDetailViewController
            
            let cell = sender as! IssueCell
            
            let indexPath = self.collectionView!.indexPath(for: cell) 
            
            let title = categories[(indexPath?.row)!].shortName
            
            formVC.navTitle.title = title
            
        }
    }
    
    
    
}
