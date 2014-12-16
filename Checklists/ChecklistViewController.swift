//
//  ViewController.swift
//  Checklists
//
//  Created by Fadie on 15/12/2014.
//  Copyright (c) 2014 Fadie. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
//    This declares that items will hold an array of ChecklistItem objects
//    but it doesnt actually create that array
//    At this point, items does not have a value yet
    
    var items: [ChecklistItem]
    
    @IBAction func addItem() {
        let newRowIndex = items.count
        
        let item = ChecklistItem()
        item.text = "I am a new row"
        item.checked = false
        items.append(item)
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
//    This instantiates the array. Now items contains a valid array object,
//    but the array has no ChecklistItem objects inside it yet.
    
    required init(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        
        let row0item = ChecklistItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "Brush My Teeth"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text = "Learn iOS Development"
        row2item.checked = true
        items.append(row2item)
        
        let row3item = ChecklistItem()
        row3item.text = "Footy practice"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text = "Eat Ice Cream"
        row4item.checked = true
        items.append(row4item)
        
        let row5item = ChecklistItem()
        row5item.text = "Clean up Github"
        row5item.checked = true
        items.append(row5item)
        
        super.init(coder: aDecoder)
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        
//        , indexPath: NSIndexPath
        
        if item.checked {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.rowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            
            configureCheckmarkForCell(cell, withChecklistItem: item)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem") as UITableViewCell
        
        let item = items[indexPath.row]
        
        configureTextForCell(cell, withChecklistItem: item)
        configureCheckmarkForCell(cell, withChecklistItem: item)
        
        return cell
    }
    
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as UILabel
        label.text = item.text
    }
    

}

