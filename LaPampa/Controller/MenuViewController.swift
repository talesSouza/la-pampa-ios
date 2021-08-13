import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var menuTableView: UITableView!
    
    // MARK: - Stored Properties
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

// MARK: - Navigation
extension MenuViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ItemInfoViewController
        
        let rowIndex = menuTableView.indexPathForSelectedRow!.row
        let sectionIndex = menuTableView.indexPathForSelectedRow!.section
        
        let menuItem = menuItems[sectionIndex].items[rowIndex]
        
        vc.item = menuItem
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
