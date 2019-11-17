//
//  CurrencyTableViewController.swift
//  currencyconverter
//
//  Created by MacStudent on 2019-11-08.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit


class CountryListViewController : UITableViewController    // Controller that showes the list of countries
{
    var val : String = "USD"
    
    let CountryNames = ["USD" , "INR" , "EUR" , "CAD"]    // array to store the names of countries
    let images = [#imageLiteral(resourceName: "usa"), #imageLiteral(resourceName: "India"), #imageLiteral(resourceName: "Euro.jpg"), #imageLiteral(resourceName: "canada")]                        // array to store images of countries
    
    override func viewDidLoad()                          // function override from parent class
    {
        super.viewDidLoad()
        
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {      // returns the number of sections in table view
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  // returns the number of rows
    {
        return CountryNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",for: indexPath)   // cell = identifier 
        //cell.textLabel?.text = "hgjghjghj"
        cell.textLabel?.text = CountryNames[indexPath.row]
        cell.imageView?.image = images[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        self.val = CountryNames[indexPath.row]
        
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is CurrencyViewController
        {
            let vc = segue.destination as? CurrencyViewController
            if(vc!.check){
                vc?.value = self.val
            } else{
                vc?.value1 = self.val
            }
            
        }    }
    @IBAction func Done(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func can(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
}
