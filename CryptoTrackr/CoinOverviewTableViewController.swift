//
//  CoinOverviewTableViewController.swift
//  CryptoTrackr
//
//  Created by Kavilan Nair on 2017/07/11.
//  Copyright © 2017 Kavilan Nair. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class CoinOverviewTableViewController: UITableViewController {

    var cryptoList = [CryptoModel]()
    var numberOfCrypto = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(("https://api.coinmarketcap.com/v1/ticker/?limit=" + "\(numberOfCrypto)"), method: .get, parameters: ["":""], encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    
                    if let result = response.result.value {
                       let JSON = result as! NSArray
                    print(JSON)
                        
                        guard let cryptoModels = [CryptoModel].from(jsonArray: result as! [JSON]) else {
                            // handle decoding failure here
                            return
                        }
                        
                        self.cryptoList = cryptoModels
                        self.tableView.reloadData()
                        
                    }}
                
                    break
                
            case .failure(_):
                print(response.result.error!)
                break
            }
        
        }
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
        return self.cryptoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CoinOverviewTableViewCell
        
        cell.crytoLogo.image = UIImage(named: ((self.cryptoList[indexPath.row].name)! + ".png"))
        cell.cryptoName.text = self.cryptoList[indexPath.row].name
        cell.cryptoPrice.text = ("$" + self.cryptoList[indexPath.row].price_usd!)
        cell.cryptoRank.text = self.cryptoList[indexPath.row].rank!
        
        
        return cell
    }
    



}
