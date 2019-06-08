import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    @IBOutlet var typeLabel: UILabel!
    
    @IBOutlet var typeImage: UIImageView!
    
    var categories = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()

        createDataModel()
    }
    
    func createDataModel(){
        categories = [Category(image: UIImage(named: "inclusive")!, type: "Інклюзивність"),
                      Category(image: UIImage(named: "building")!, type: "Інфраструктура"),
                      Category(image: UIImage(named: "cash")!, type: "Корупція"),
                      Category(image: UIImage(named: "child")!, type: "Права дітей"),
                      Category(image: UIImage(named: "customer")!, type: "Права споживачів"),
                      Category(image: UIImage(named: "worker")!, type: "Права працівників"),
                      Category(image: UIImage(named: "racism")!, type: "Дискримінація"),
                      Category(image: UIImage(named: "pin")!, type: "Інше")
        ]
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! TypeCell
        cell.typeLabel.text = categories[indexPath.row].type
        cell.typeImage.image = categories[indexPath.row].image
        cell.backgroundColor = pickBackgroundColor(indexPath.row)
        return cell
    }
    
    func pickBackgroundColor(_ index: Int)->UIColor{
        
        switch index {
        case 0:
             return UIColor(red:0.21, green:0.71, blue:0.22, alpha:1.0)
        case 1:
            return UIColor(red:0.65, green:0.21, blue:0.71, alpha:1.0)
        case 2:
            return UIColor(red:0.21, green:0.49, blue:0.71, alpha:1.0)
        case 3:
            return UIColor(red:0.90, green:0.79, blue:0.18, alpha:1.0)
        case 4:
            return UIColor(red:0.91, green:0.29, blue:0.17, alpha:1.0)
        case 5:
            return UIColor(red:0.21, green:0.71, blue:0.57, alpha:1.0)
        case 6:
            return UIColor(red:0.90, green:0.69, blue:0.20, alpha:1.0)
        case 7:
            return UIColor(red:0.31, green:0.18, blue:0.90, alpha:1.0)
    
        default:
            return .white
        }
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "inclusiveForm" {
            let formVC = segue.destination as! FormCollectionVC
           
            let cell = sender as! UICollectionViewCell
            let indexPath = self.collectionView!.indexPath(for: cell)
            
            let title = categories[(indexPath?.row)!].type
            
            formVC.navTitle.title = title
        }
    }
    
    
    
}
