import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var picturesLabel: UILabel!
    
    // MARK: - ComputedProperty
    var labels: [UILabel] {
        [menuLabel, picturesLabel]
    }
    
    // MARK: - StoredProperty
}

// MARK: - LifeCicle
extension HomeViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - Setup
extension HomeViewController {
    
    private func setupLayout() {
        labels.forEach { $0.setupBorder() }
    }
}

