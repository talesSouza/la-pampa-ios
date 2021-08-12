import UIKit

class MenuItemTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}

// MARK: - Setup
extension MenuItemTableViewCell {
    
    func set(item: Item) {
        itemLabel.text = item.flavour
        priceLabel.text = "R$ \(String(format: "%.2f", item.price))"
    }
}
