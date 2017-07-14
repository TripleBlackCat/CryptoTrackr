//
//  MyPortfolioOverviewTableViewController.swift
//  CryptoTrackr
//
//  Created by Kavilan Nair on 2017/07/11.
//  Copyright © 2017 Kavilan Nair. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class MyPortfolioOverviewTableViewController: UITableViewController {

    var transactionList = [Transaction]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(("https://cryptotrackr.firebaseio.com/.json"), method: .get, parameters: ["":""], encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            if let cryptotrackrDictionary = response.result.value as? [String: AnyObject]{
                
                for (key, value) in cryptotrackrDictionary{
                    print(key)
                    if let singleCryptotrackrDictionary = value as? [String: AnyObject]{
                        let newSingleCryptotrackrDictionary = Transaction.init(json: singleCryptotrackrDictionary)
                        
                        self.transactionList.append(newSingleCryptotrackrDictionary!)
                        self.tableView.reloadData()

                       // print(self.transactionList[0].numberOfCoins)
                        //print(newSingleCryptotrackrDictionary?.coinName as Any)
                    }
                }
            }

            
        }
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.transactionList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "portfolioCell", for: indexPath) as! MyPortfolioTableViewCell
        
        cell.portfolioCryptoName.text = self.transactionList[indexPath.row].coinName!
        cell.portfolioImage.image = UIImage(named: ((self.transactionList[indexPath.row].coinName)! + ".png"))
        cell.numberOfCoins.text = self.transactionList[indexPath.row].numberOfCoins!
        
        if let numberCoins = transactionList[indexPath.row].numberOfCoins, let doubleNumberCoins = Double(numberCoins) {
            
            let priceBTC = 2359.31
            let priceETH = 205.15
            let priceDash = 170.49
            var value = 0;
            if (indexPath.row == 0) {
                value = (Int(priceBTC * doubleNumberCoins))
            }
            else if (indexPath.row == 1) {
                value = (Int(priceETH * doubleNumberCoins))

            } else if (indexPath.row == 2) {
                value = (Int(priceDash * doubleNumberCoins))

            }

            cell.cryptoValue.text = "$\(value)"
            
            print(doubleNumberCoins)  // doubleLat is of type Double now
        }
        
        
            return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
