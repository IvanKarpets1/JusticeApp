import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {

    var categories = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()
   
        categories = [Category(image: UIImage(named: "inclusive")!, type: "Inclusive")]

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showForm" {
            let formVC = segue.destination as! FormCollectionVC
           
            let cell = sender as! UICollectionViewCell
            let indexPath = self.collectionView!.indexPath(for: cell)
            
            let title = categories[(indexPath?.row)!].type
            
            formVC.navigationController?.title = title
        }
    }
    
    
    
}
