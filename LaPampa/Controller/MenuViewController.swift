import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var menuTableView: UITableView!
    
    // MARK: - StoredProperty
    let menuService = MenuService()
    var menuItems: [MenuItem] = []
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

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems[section].items.count
    }
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.menuTableView.dequeueReusableCell(withIdentifier: "menuItemCell") as! MenuItemTableViewCell
        
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
