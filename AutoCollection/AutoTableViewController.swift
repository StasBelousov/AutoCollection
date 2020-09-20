//
//  AutoTableViewController.swift
//  AutoCollection
//
//  Created by Станислав Белоусов on 19/09/2020.
//  Copyright © 2020 Станислав Белоусов. All rights reserved.
//

import UIKit

class AutoTableViewController: UITableViewController {
    
    var autoCollection: [Auto] = [
        Auto(brand: "lada", model: "2101", year: "1998", type: "Sedan", typeEmoji: "🚙", isFavorite: true),
        Auto(brand: "Audi", model: "A5", year: "2019", type: "Coupe", typeEmoji: "🚗", isFavorite: false),
        Auto(brand: "GAZ", model: "100", year: "2010", type: "Truck", typeEmoji: "🚛", isFavorite: false)]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = "Auto Collectoin"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    @IBAction func unwindSegue (segue:UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else {return}
        let sourseVC = segue.source as! NewAutoTableViewController
        let auto = sourseVC.auto
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            autoCollection[selectedIndexPath.row] = auto
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        } else {
            let newIndexPath = IndexPath(row: autoCollection.count, section: 0)
            autoCollection.append(auto)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          super.prepare(for: segue, sender: sender)
          guard segue.identifier == "Edit" else { return }
          let indexPath = tableView.indexPathForSelectedRow!
          let auto = autoCollection[indexPath.row]
          let navVC = segue.destination as! UINavigationController
          let newAutoTableViewController = navVC.topViewController as! NewAutoTableViewController
          newAutoTableViewController.auto = auto
          newAutoTableViewController.title = "Edit"
      }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return autoCollection.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AutoTableViewCell
        let car = autoCollection[indexPath.row]
        
        cell.setCar(car: car)

        return cell
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            autoCollection.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedCar = autoCollection.remove(at: sourceIndexPath.row)
        autoCollection.insert(movedCar, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favorite = favoriteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions:[favorite])
    }

    func favoriteAction (at indexPath: IndexPath) ->UIContextualAction {
        var object = autoCollection[indexPath.row]
        let favorite = UIContextualAction(style: .normal, title: "Favo"){ (action, view, completion) in
            object.isFavorite = !object.isFavorite
            self.autoCollection[indexPath.row] = object
            completion(true)
        }
        favorite.backgroundColor = object.isFavorite ? .systemPink : .systemGray
        favorite.image = UIImage(systemName: "hand.thumbsup.fill")
        return favorite
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
