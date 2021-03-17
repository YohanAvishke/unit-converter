//
//  HistoryViewController.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var history = History().weight
    var icon: UIImage = converterViews[0].image
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Reload the table view
        DispatchQueue.main.async { self.tableView.reloadData() }
        toggleDeleteVisibility()
    }
    
    /**
     This function is triggered when the segmented control tab is changed.
     This assigns the respective conversion type and icon and fetches the
     conversion history.
     - Parameter sender: The UISegmentedControl.
     */
    @IBAction func handleSegmentControlIndexChange(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            history = History().weight
            icon = converterViews[0].image
        case 1:
            history = History().temperature
            icon = converterViews[1].image
        case 2:
            history = History().distance
            icon = converterViews[2].image
        case 3:
            history = History().speed
            icon = converterViews[3].image
        case 4:
            history = History().volume
            icon = converterViews[4].image
        default:
            break
        }
        DispatchQueue.main.async { self.tableView.reloadData() }
        toggleDeleteVisibility()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    /// This function generates the table cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            as! HistoryTableViewCell
        cell.data.text = history[indexPath.row]
        cell.icon.image = icon
        return cell
    }
    
    /// This function handles the clear history button click. It checks
    /// if history us available and clears the corresponding history and
    /// sets a success alert once done.
    ///
    /// - Parameter sender: The clear button.
    @IBAction func handleHistoryClearButtonClick(_ sender: Any) {
        if history.count > 0 {
            history = []
            
            let alert = UIAlertController(title: "Success",
                                          message: "The saved conversions were successfully deleted!",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            DispatchQueue.main.async{ self.tableView.reloadData() }
            toggleDeleteVisibility()
        }
    }
    
    /// This function checks if the history is there and sets the cisibility of
    /// the clear history button
    func toggleDeleteVisibility() {
        if history.count > 0 {
            self.navigationItem.rightBarButtonItem!.isEnabled = true;
        } else {
            self.navigationItem.rightBarButtonItem!.isEnabled = false;
        }
    }
}
