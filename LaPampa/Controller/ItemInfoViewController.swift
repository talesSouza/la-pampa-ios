import UIKit

class ItemInfoViewController: UIViewController {

    @IBOutlet weak var itemLabel: UILabel!
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setItemLayouts()
    }
    
    func setItemLayouts() {
        if let item = item {
            itemLabel.text = item.flavour
        }
    }
}
