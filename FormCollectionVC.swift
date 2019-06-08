import Foundation
import UIKit

class FormCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var navTitle: UINavigationItem!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CollectionViewCell1", bundle: nil), forCellWithReuseIdentifier: "cellid1")
        collectionView.register(UINib(nibName: "CollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: "cellid2")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid1", for: indexPath) as! CollectionViewCell1
            return cell
        }
        else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid2", for: indexPath) as! CollectionViewCell2
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid2", for: indexPath) as! CollectionViewCell1
        return cell
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 || indexPath.row == 1 {
            return CGSize(width: 413.0, height: 58.0)
        }
        return CGSize(width: 413.0, height: 58.0)
    }
    
    
}
