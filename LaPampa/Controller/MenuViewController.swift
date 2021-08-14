import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var menuTableView: UITableView!
    
    // MARK: - Stored Properties
    let menuService = MenuService()
    var menuItems: [MenuItem] = []
    var selectedItem: Item?
}

// MARK: - LifeCycle
extension MenuViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let menuItems = menuService.getMenu() {
            self.menuItems = menuItems
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - Navigation
extension MenuViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let vc = segue.destination as? ItemInfoViewController,
              let selectedItem = selectedItem else { return }
        vc.item = selectedItem
    }
}

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems[section].items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = menuItems[indexPath.section].items[indexPath.row]
        performSegue(withIdentifier: "goToItemInfo", sender: self)
    }
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.menuTableView.dequeueReusableCell(withIdentifier: "menuItemCell") as? MenuItemTableViewCell
        else {
            return UITableViewCell()
        }
        
        let menuItem = menuItems[indexPath.section]
        let item = menuItem.items[indexPath.row]
        
        cell.set(item: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = menuItems[section].category
        return title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuItems.count
    }
}
