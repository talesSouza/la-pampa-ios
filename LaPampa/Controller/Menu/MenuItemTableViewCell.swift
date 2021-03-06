import UIKit

class MenuItemTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemsQtyLabel: UILabel!
    @IBOutlet weak var qtyStepper: UIStepper!
    
    // MARK: - Actions
    var qtyDidChangeAction: ((Double) -> ()) = { _ in }
}

// MARK: - Setup
extension MenuItemTableViewCell {
    func set(item: Item) {
        itemLabel.text = item.flavour
        priceLabel.text = "R$ \(String(format: "%.2f", item.price))"
    }
}
    
// MARK: - Functions
extension MenuItemTableViewCell {
    
    private func setQtyLabel() {
        if qtyStepper.value != 0 {
            itemsQtyLabel.isHidden = false
            itemsQtyLabel.text = "\(String(format: "%.0f", qtyStepper.value))"
        } else {
            itemsQtyLabel.isHidden = true
        }
    }
}

// MARK: - IBActions
extension MenuItemTableViewCell {
    @IBAction private func addItemValueChanged (_ sender: UIStepper) {
        setQtyLabel()
        qtyDidChangeAction(sender.value)
    }
}

