import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var menuTableView: UITableView!
    
    // MARK: - Properties
    var menuItens: [MenuItens] = []
}

// MARK: - LifeCycle
extension MenuViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - Functions
extension MenuViewController {
    private func parseJson() {
        if let fileURL = Bundle.main.url(forResource: "MenuItens.json", withExtension: nil) {
            let jsonData = try! Data(contentsOf: fileURL)
            do {
                menuItens = try! JSONDecoder().decode([MenuItens].self, from: jsonData)
            }
        }
    }
}

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItens[section].items.count
    }
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuItemCell = self.menuTableView.dequeueReusableCell(withIdentifier: "menuItemCell") as! MenuItemTableViewCell
        
        
        let menuItemAtIndex = menuItens[indexPath.section]
        let itemAtIndex = menuItemAtIndex.items[indexPath.row]
        let flavourAtIndex = itemAtIndex.flavour[indexPath.section]
        menuItemCell.itemLabel.text = flavourAtIndex
        
        
        menuItemCell.itemLabel.text = menuItens[indexPath.row].items[indexPath.row].flavour[indexPath.row]
        menuItemCell.priceLabel.text = "R$ \((menuItens[indexPath.row].items[indexPath.row].price[indexPath.row]))"
        
        return menuItemCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let menuItens = menuItens[section].category
        return menuItens
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuItens.count
    }
}
