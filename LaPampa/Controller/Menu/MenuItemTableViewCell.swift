import UIKit

class MenuItemTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}

// MARK: - LifeCYcle
extension MenuItemTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

