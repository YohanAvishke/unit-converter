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
    var selectedSegment: SegmentType = SegmentType.weight
    var icon: UIImage = converterViews[0].image
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        history = History().segmentToHistoryMapping(segmentType: selectedSegment)
        
        DispatchQueue.main.async { self.tableView.reloadData() }
        toggleDeleteVisibility()
    }
    
    /**
     Trigger on change of `UISegmentedControl` and update the `history`
     
     - Parameter sender: UISegmentedControl.
     */
    @IBAction func onChangeSegmentControlIndex(_ sender: UISegmentedControl) {
        // Update the history accordingly to the selected segment
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            selectedSegment = SegmentType.weight
            icon = converterViews[0].image
        case 1:
            selectedSegment = SegmentType.temperature
            icon = converterViews[1].image
        case 2:
            selectedSegment = SegmentType.distance
            icon = converterViews[2].image
        case 3:
            selectedSegment = SegmentType.speed
            icon = converterViews[3].image
        case 4:
            selectedSegment = SegmentType.volume
            icon = converterViews[4].image
        default:
            break
        }
        history = History().segmentToHistoryMapping(segmentType: selectedSegment)
        
        DispatchQueue.main.async { self.tableView.reloadData() }
        toggleDeleteVisibility()
    }
    
    /**
     Delete history list of a converter's type
     
     - Parameter sender: The clear button.
     */
    @IBAction func onClickDelete(_ sender: Any) {
        if history.count > 0 {
            history = History().deleteHistory(segmentType: selectedSegment)
            
            let alert = UIAlertController(title: "Success",
                                          message: "The saved conversions were successfully deleted!",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            DispatchQueue.main.async{ self.tableView.reloadData() }
            toggleDeleteVisibility()
        }
    }
    
    /// Set the visibility of delete button
    func toggleDeleteVisibility() {
        if history.count > 0 {
            self.navigationItem.rightBarButtonItem!.isEnabled = true;
        } else {
            self.navigationItem.rightBarButtonItem!.isEnabled = false;
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if history.count == 0 {
            self.tableView.setEmptyMessage("Saved Conversions are empty!")
        } else {
            self.tableView.restore()
        }
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            as! HistoryTableViewCell
        cell.data.text = history[indexPath.row]
        cell.icon.image = icon
        return cell
    }
}
