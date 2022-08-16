//
//  ViewController.swift
//  Bullseye
//
//  Created by Sophio Kopaliani on 01/08/2022.
//

import UIKit

class CheckListViewController: UIViewController {
    private lazy var items = getListItems() // model
    
    let contactsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
      //  setUpNavigation()
        
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        contactsTableView.allowsMultipleSelectionDuringEditing = false
        
        contactsTableView.register(CategoryListCell.self, forCellReuseIdentifier: "contactCell")
        
        
        view.addSubview(contactsTableView)
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactsTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true

    }

}

extension CheckListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! CategoryListCell
        cell.label.text = items[indexPath.row].text
        cell.accessoryType = items[indexPath.row].isChecked ? .checkmark : .none
        return cell
    }

//    func tableView(
//      _ tableView: UITableView,
//      commit editingStyle: UITableViewCell.EditingStyle,
//      forRowAt indexPath: IndexPath
//    ){
//        
//        if editingStyle == .delete {
//            //  you have to delete data at row in getListItems()
//            // ex: objects.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
////    // 1
////      items.remove(at: indexPath.row)
////    // 2
////      let indexPaths = [indexPath]
////      tableView.deleteRows(at: indexPaths, with: .automatic)
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //  you have to delete data at row in getListItems()
            // ex: objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
        
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

}

extension CheckListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if let cell = tableView.cellForRow(at: indexPath) {
            items[indexPath.row].isChecked.toggle()
            cell.accessoryType = items[indexPath.row].isChecked ? .checkmark : .none
        }
          tableView.deselectRow(at: indexPath, animated: true)
    }
}


