import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var pictureImageView: UIImageView!
}

// MARK: - Seteup
extension PictureCollectionViewCell {
    
    func set(picture: UIImage) {
        pictureImageView.image = picture
    }
}
