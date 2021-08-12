import UIKit

class PicturesViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var albumCollectionView: UICollectionView!
    
    // MARK: - Properties
    var photos: [UIImage] = [#imageLiteral(resourceName: "laPampa2"), #imageLiteral(resourceName: "sanduba"), #imageLiteral(resourceName: "laPampa3"), #imageLiteral(resourceName: "laPampa"), #imageLiteral(resourceName: "sanduba2"), #imageLiteral(resourceName: "carne")]
}

// MARK: - LifeCycle
extension PicturesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - UICollectionViewDelegate
extension PicturesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
}

// MARK: - UICollectionViewDataSource
extension PicturesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photoCell = self.albumCollectionView.dequeueReusableCell(withReuseIdentifier: "photoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        
        photoCell.photoImage.image = photos[indexPath.row]
        
        return photoCell
    }
}
