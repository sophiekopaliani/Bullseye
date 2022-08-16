//
//  ChecklistItem.swift
//  Bullseye
//
//  Created by Sophio Kopaliani on 11/08/2022.
//

import Foundation

struct CheckListItem {
    let text: String
    var isChecked: Bool
    
}

extension CheckListViewController {
    func getListItems() -> [CheckListItem]{
      let list = [
       CheckListItem(text: "test1", isChecked: true),
       CheckListItem(text: "test2", isChecked: false),
       CheckListItem(text: "test3", isChecked: true),
       CheckListItem(text: "test4", isChecked: false),
       CheckListItem(text: "test5", isChecked: true),
       CheckListItem(text: "test6", isChecked: true)
       ]
      return list
   }
}

