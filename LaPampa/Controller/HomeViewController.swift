import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var picturesButton: UIButton!
    
    // MARK: - Computed Properties
    var buttons: [UIButton] {
        [menuButton, picturesButton]
    }
    
    // MARK: - Stored Properties
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
        buttons.forEach { $0.setupBorder() }
    }
}

