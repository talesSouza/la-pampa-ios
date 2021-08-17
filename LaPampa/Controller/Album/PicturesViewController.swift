import UIKit

class PicturesViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var pictureCollectionView: UICollectionView!
    
    // MARK: - Stored Properties
    var pictures: [UIImage] = [#imageLiteral(resourceName: "laPampa2"), #imageLiteral(resourceName: "laPampa3"), #imageLiteral(resourceName: "laPampa"), #imageLiteral(resourceName: "carne")]
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
        return pictures.count
    }
}

// MARK: - UICollectionViewDataSource
extension PicturesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.pictureCollectionView.dequeueReusableCell(withReuseIdentifier: "pictureCollectionViewCell", for: indexPath) as? PictureCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.set(picture: pictures[indexPath.row])
        return cell
    }
}
