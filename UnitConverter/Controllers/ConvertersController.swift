//
//  ConvertersController.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-12.
//

import Foundation
import UIKit

class ConvertersController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return converterViews.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            as! ConverterTableViewCell
        cell.selectionStyle = .none
        cell.converterName.text = converterViews[indexPath.row].name
        cell.converterImage.image = converterViews[indexPath.row].image
        cell.converterDescription.text = converterViews[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: converterViews[indexPath.row].segueID, sender: self)
    }
}
