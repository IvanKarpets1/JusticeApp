import Foundation
import UIKit

class TypeCell: UICollectionViewCell {
    
    @IBOutlet var typeLabel: UILabel!
    
    @IBOutlet var typeImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
