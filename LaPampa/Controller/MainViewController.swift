import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var picturesLabel: UILabel!
}

// MARK: - LifeCicle
extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        settingLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - Functions
extension MainViewController {
    
    
    private func settingLabels() {
        settingLayout(object: menuLabel)
        settingLayout(object: picturesLabel)
    }
}

