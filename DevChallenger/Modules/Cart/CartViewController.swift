//
//  CartViewController.swift
//  DevChallenger
//
//  Created by Fernando González on 22/08/23.
//

import UIKit

class CartViewController: UIViewController {    
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var cartItemManager: CartItemManager = CartItemManager()
    var cartItemDataModel: CartItemDataModel = CartItemDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.totalLabel.text = self.cartItemDataModel.getTotalPriceAsString()
        
        self.cartTableView.dataSource = self
        self.cartItemManager.delegate = self
        
        self.cartTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        self.cartTableView.register(UINib(nibName: "AddIsolateTableViewCell", bundle: nil), forCellReuseIdentifier: "AddIsolateTableViewCell")
    }
    
    private func reloadTable() {
        self.cartTableView.reloadData()
        self.totalLabel.text = self.cartItemDataModel.getTotalPriceAsString()
    }
    
}

// MARK: - UITableViewDataSource

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cartItemDataModel.getCount() + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < self.cartItemDataModel.getCount() {
            let cell: ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
            
            let index: Int = indexPath.row
            
            cell.setup(for: self.cartItemDataModel.getCartItem(at: index), index: index, manager: self.cartItemManager)
            
            return cell
        } else {
            let cell: AddIsolateTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AddIsolateTableViewCell", for: indexPath) as! AddIsolateTableViewCell

            cell.setup(manager: self.cartItemManager)
            
            return cell
        }
    }
    
}

// MARK: - CartItemManagerDelegate

extension CartViewController: CartItemManagerDelegate {
    
    func didUpdateItemDetail(_ cartItemManager: CartItemManager) {
        self.reloadTable()
    }
    
    func didDuplicateItem(_ cartItemManager: CartItemManager, cartItem: CartItem) {
        let newCartItem: CartItem = CartItem(image: cartItem.image, name: cartItem.name, price: cartItem.price, color: cartItem.color)
        self.cartItemDataModel.appendNewItem(with: newCartItem)
        self.reloadTable()
    }
    
    func didDeleteItem(_ cartItemManager: CartItemManager, at: Int) {        self.cartItemDataModel.deleteItem(at: at)
        self.reloadTable()
    }
    
    func didAddItem(_ cartItemManager: CartItemManager) {
        self.cartItemDataModel.addNextItem()
        self.reloadTable()
    }
    
}


