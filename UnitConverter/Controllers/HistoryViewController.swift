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
    
    var histories = [HistoryView]()
    var conversionType = HistoryConst.WEIGHT_KEY
    var icon: UIImage = UIImage(named: "weight")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // generate the history of the initial segment
        generateHistory(type: conversionType, icon: icon)
        DispatchQueue.main.async { self.tableView.reloadData() }
        
        // checks if the clear button should be visible
        toggleHistoryClearButtonVisibility()
    }
    
    /// This function is triggered when the segmented control tab is changed.
    /// This assigns the respective conversion type and icon and fetches the
    /// conversion history.
    ///
    /// - Parameter sender: The UISegmentedControl.
    @IBAction func handleSegmentControlIndexChange(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            conversionType = HistoryConst.WEIGHT_KEY
            icon = UIImage(named: "weight")!
        case 1:
            conversionType = HistoryConst.TEMP_KEY
            icon = UIImage(named: "temperature")!
        case 2:
            conversionType = HistoryConst.VOLUME_KEY
            icon = UIImage(named: "volume")!
        case 3:
            conversionType = HistoryConst.SPEED_KEY
            icon = UIImage(named: "speed")!
        default:
            break
        }
        
        // generate the gistory and reload the table
        generateHistory(type: conversionType, icon: icon)
        DispatchQueue.main.async { self.tableView.reloadData() }
        
        // checks if the clear button should be visible
        toggleHistoryClearButtonVisibility()
    }
    
    /// This function generates the saved conversion history.
    /// It gains access to the user defaults and populates the
    /// history array.
    ///
    /// Usage:
    ///
    ///      generateHistory(type: conversionType, icon: icon)
    ///
    /// - Parameter type: Conversion type.
    ///             icon: Icon for the table cell.
    func generateHistory(type: String, icon: UIImage) {
        histories = []
        let historyList = UserDefaults.standard.value(forKey: conversionType) as? [String]
        
        if historyList?.count ?? 0 > 0 {
            for conersion in historyList! {
                let history = HistoryView(type: type,icon: icon,conversion: conersion)
                histories += [history]
            }
        }
    }
    
    /// This function sets the number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /// This function returns the history count and shows a no data placeholder
    /// if there are no data to be shown.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if histories.count == 0 {
            self.tableView.setEmptyMessage("No saved conversions found", UIColor.white)
        } else {
            self.tableView.restore()
        }
        
        return histories.count
    }
    
    /// This function generates the table cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HistoryTableViewCell
        cell.data.text = histories[indexPath.row].getHistoryConversion()
        cell.icon.image = histories[indexPath.row].getHistoryIcon()
        
        // Card(cell) styles
        cell.isUserInteractionEnabled = false
        cell.contentView.layer.masksToBounds = false
        
        return cell
    }
    
    /// This function handles the clear history button click. It checks
    /// if history us available and clears the corresponding history and
    /// sets a success alert once done.
    ///
    /// - Parameter sender: The clear button.
    @IBAction func handleHistoryClearButtonClick(_ sender: Any) {
        if histories.count > 0 {
            UserDefaults.standard.set([], forKey: conversionType)
            
            let alert = UIAlertController(title: "Success", message: "The saved conversions were successfully deleted!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            // refetch hitory and reload table
            generateHistory(type: conversionType, icon: icon)
            DispatchQueue.main.async{ self.tableView.reloadData() }
            toggleHistoryClearButtonVisibility()
        }
    }
    
    /// This function checks if the history is there and sets the cisibility of
    /// the clear history button
    func toggleHistoryClearButtonVisibility() {
        if histories.count > 0 {
            self.navigationItem.rightBarButtonItem!.isEnabled = true;
        } else {
            self.navigationItem.rightBarButtonItem!.isEnabled = false;
        }
    }
}
