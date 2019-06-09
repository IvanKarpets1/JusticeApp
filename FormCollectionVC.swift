import Foundation
import UIKit

class FormCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var navTitle: UINavigationItem!
   
    
  
    
    
    let kinds = ["Особи з інвалідністю", "Особи похилого віку", "Безхатченки", "Інші"]

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return kinds.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return kinds[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CollectionViewCell1", bundle: nil), forCellWithReuseIdentifier: "cellid1")
        collectionView.register(UINib(nibName: "CollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: "cellid2")
        collectionView.register(UINib(nibName: "CollectionViewCell3", bundle: nil), forCellWithReuseIdentifier: "cellid3")
        collectionView.register(UINib(nibName: "CollectionViewCell4", bundle: nil), forCellWithReuseIdentifier: "cellid4")
        collectionView.register(UINib(nibName: "CollectionViewCell5", bundle: nil), forCellWithReuseIdentifier: "cellid5")
        collectionView.register(UINib(nibName: "CollectionViewCell6", bundle: nil), forCellWithReuseIdentifier: "cellid6")
        collectionView.register(UINib(nibName: "PickerCell", bundle: nil), forCellWithReuseIdentifier: "pickerCell")
    }
    

    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid1", for: indexPath) as! CollectionViewCell1
            return cell
        }
        else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid2", for: indexPath) as! CollectionViewCell2
            return cell
        }else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid3", for: indexPath) as! CollectionViewCell3
            let pickerView = UIPickerView(frame: cell.frame)
            pickerView.delegate = self
            pickerView.dataSource = self
            cell.addSubview(pickerView)
            return cell
        }else if indexPath.row == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid4", for: indexPath) as! CollectionViewCell4
            return cell
        }else if indexPath.row == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid5", for: indexPath) as! CollectionViewCell5
            return cell
        }else if indexPath.row == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid6", for: indexPath) as! CollectionViewCell6
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid2", for: indexPath) as! CollectionViewCell1
        return cell
        
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 || indexPath.row == 1 {
            return CGSize(width: 413.0, height: 58.0)
        }else if indexPath.row == 5 || indexPath.row == 4 || indexPath.row == 6 {
            return CGSize(width: 413.0, height: 40.0)
        }else if indexPath.row == 3 || indexPath.row == 7{
            return CGSize(width: 413.0, height: 100.0)
        }else if indexPath.row == 2 {
            return CGSize(width: 413.0, height: 100.0)
        }
        return CGSize(width: 413.0, height: 58.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let vc = MapViewController() //your view controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
