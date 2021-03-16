//
//  TableController.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-12.
//

import Foundation
import UIKit

class TableController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
}

extension TableController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return converterViews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            as! TableCellView
        let converter = converterViews[indexPath.row]
        cell.labelName.text = converter.name
        cell.imageConverter.image = converter.image
        cell.labelDescription.text = converter.description
        return cell
    }
}
