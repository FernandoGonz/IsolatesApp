//
//  CartViewController.swift
//  DevChallenger
//
//  Created by Fernando González on 22/08/23.
//

import UIKit

class CartViewController: UIViewController {    
    
    @IBOutlet weak var cartTableView: UITableView!
    
    var cartItemManager: CartItemManager = CartItemManager()
    var cartItemDataModel: CartItemDataModel = CartItemDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.cartTableView.dataSource = self
        self.cartItemManager.delegate = self
        
        self.cartTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        self.cartTableView.register(UINib(nibName: "AddIsolateTableViewCell", bundle: nil), forCellReuseIdentifier: "AddIsolateTableViewCell")
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
        self.cartTableView.reloadData()
    }
    
    func didDuplicateItem(_ cartItemManager: CartItemManager, cartItem: CartItem) {
        let newCartItem: CartItem = CartItem(image: cartItem.image, name: cartItem.name, price: cartItem.price, color: cartItem.color)
        self.cartItemDataModel.appendNewItem(with: newCartItem)
        self.cartTableView.reloadData()
    }
    
    func didDeleteItem(_ cartItemManager: CartItemManager, at: Int) {        self.cartItemDataModel.deleteItem(at: at)
        self.cartTableView.reloadData()
    }
    
    func didAddItem(_ cartItemManager: CartItemManager) {
        let newCartItem: CartItem = CartItem(image: UIImage(named: "Narrow-Heel-Extra-EVA-Blue.png")!, name: "Fernando's Insoles", price: "US$224.95", color: "Red")
        self.cartItemDataModel.appendNewItem(with: newCartItem)
        self.cartTableView.reloadData()
    }
    
}


