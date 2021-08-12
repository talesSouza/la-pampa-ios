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
    private func settingLayout(object: AnyObject, width: CGFloat = 1, color: UIColor = .white, radius: CGFloat = 5) {
        object.layer.borderWidth = width
        object.layer.cornerRadius = radius
        object.layer.borderColor = color.cgColor
    }
    
    private func settingLabels() {
        settingLayout(object: menuLabel)
        settingLayout(object: picturesLabel)
    }
}

