import UIKit

class ItemInfoViewController: UIViewController {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setItemLayouts()
    }
    
    func setItemLayouts() {
        if let item = item {
            itemLabel.text = item.flavour
            itemImage.image = UIImage(named: item.flavour)
            
            itemImage.setupBorder()
            switch item.flavour {
            case "Almôndega suína":
                itemDescription.text = "Esse sanduba conta com um molho barbecue feito na casa, juntamente com o frescor de rúcula fresquinha, e claro, a estrela do prato: Almôndegas suínas."
            case "Filé Mignon":
                itemDescription.text = "Cebolas marinadas, queijo gorgonzola e deliciosos 200g de filé mignon - de verdade - pra abalar tudo que você tinha como referência de qualidade!"
                
            default:
                itemDescription.text = ""
            }
            
        }
    }
}
