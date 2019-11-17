//
//  ViewController.swift
//  currencyconverter
//
//  Created by MacStudent on 2019-11-08.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class CurrencyViewController : UIViewController
{
    
    
    let usdinr = 71.58
    let usdcad = 1.32
    let usdeur = 0.91
    
    let inrcad = 0.018
    let inreur = 0.013
    
    let cadeur = 0.69
    
    var amt:Double! = 0.0       // variable to store the converted amount
    
    @IBOutlet weak var TextField: UITextField!  //Enter Amount
    
    @IBOutlet weak var Label1: UILabel!  // First Currency
    @IBOutlet weak var Label2: UILabel!  // Second Currency
    @IBOutlet weak var Label3: UILabel!  // Default Rate
    @IBOutlet weak var Label4: UILabel!  // Result
    
    @IBOutlet weak var Image1: UIImageView!   // image of 1st currency
    @IBOutlet weak var Image2: UIImageView!   // image of 2nd currency
    
    var check = true
    
    var value:String! = "USD"                 // by default values  when the user open the app
    var value1:String! = "INR"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneButtonOnKeyboard()             // calling of function to add done button on the numberpad
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindone(_ sender: UIStoryboardSegue) {
        
        guard let vc = sender.source as? CountryListViewController  else{return}
        if(check){
            Label1.text = vc.val
            
            switch Label1.text{
                
            case "USD" :
                Image1.image = #imageLiteral(resourceName: "usa")
                break
                
            case "INR" :
                Image1.image = #imageLiteral(resourceName: "India")
                break
                
            case "EUR" :
                Image1.image = #imageLiteral(resourceName: "Euro.jpg")
                break
                
            case "CAD" :
                Image1.image = #imageLiteral(resourceName: "canada")
                break
                
            default:
                break
            }
            
        }else{
            Label2.text = vc.val
            
            switch Label2.text{
                
            case "USD" :
                Image2.image = #imageLiteral(resourceName: "usa")
                break
                
            case "INR" :
                Image2.image = #imageLiteral(resourceName: "India")
                break
                
            case "EUR" :
                Image2.image = #imageLiteral(resourceName: "Euro")
                break
                
            case "CAD" :
                Image2.image = #imageLiteral(resourceName: "canada")
                break
                
            default:
                break
            }
        }
        
        
        
        
    }
    @IBAction func ChangeButton1(_ sender: Any) // First Currency Change
        
    {
        defaultRate()                           // calling of default rate method
        check = true
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CountryListViewController") as? CountryListViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    @IBAction func ChangeButton2(_ sender: Any)  // Second Currency Change
    {
        defaultRate()                           // calling of default rate method
        check = false
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CountryListViewController") as? CountryListViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
        
    }
    
    
    @IBAction func ConvertButton(_ sender: Any) // Convert the given currency
    {
        
        
        if TextField.text == ""                 // check whether the text field is empty then return
        {
            
            return
        }
        
        var amt:Double! = Double(TextField.text!)           // stores the text field value in variable amt after converting it                                                       into double
        switch Label1.text{
            
        case "USD":
            
            switch Label2.text{
            case "USD":
                amt = amt * 1
                Label3.text = String(1)
                break
                
            case "INR":
                amt = amt * usdinr
                Label3.text = String(usdinr)
                break
                
            case "CAD":
                amt = amt * usdcad
                Label3.text = String(usdcad)
                break
                
            case "EUR":
                amt = amt * usdeur
                Label3.text = String(usdeur)
                break
                
            default:
                break
            }
            
            break
            
        case "INR":
            
            switch Label2.text{
            case "USD":
                amt = amt * 1/usdinr
                Label3.text = String(1/usdinr)
                break
                
            case "INR":
                amt = amt * 1
                Label3.text = String(1)
                break
                
            case "CAD":
                amt = amt * inrcad
                Label3.text = String(inrcad)
                break
                
            case "EUR":
                amt = amt * inreur
                Label3.text = String(inreur)
                break
                
            default:
                break
            }
            
            break
            
        case "CAD":
            
            switch Label2.text{
            case "USD":
                amt = amt * 1/usdcad
                Label3.text = String(1/usdcad)
                break
                
            case "INR":
                amt = amt * 1/inrcad
                Label3.text = String(1/cadeur)
                break
                
            case "CAD":
                amt = amt * 1
                Label3.text = String(1)
                break
                
            case "EUR":
                amt = amt * cadeur
                Label3.text = String(cadeur)
                break
                
            default:
                break
            }
            
            break
            
        case "EUR":
            
            switch Label2.text{
            case "USD":
                amt = amt * 1/usdeur
                Label3.text = String(1/usdeur)
                break
                
            case "INR":
                amt = amt * 1/inreur
                Label3.text = String(1/inreur)
                break
                
            case "CAD":
                amt = amt * 1/cadeur
                Label3.text = String(1/cadeur)
                break
                
            case "EUR":
                amt = amt * 1
                Label3.text = String(1)
                break
                
            default:
                break
            }
            
            break
            
        default:
            break
        }
        
        Label4.text = String(amt)                       // shows the converted amount in label4
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaultRate()
        Label1.text = value
        
        Label2.text = value1
        
        switch Label1.text{
            
        case "USD" :
            Image1.image = #imageLiteral(resourceName: "usa")
            break
            
        case "INR" :
            Image1.image = #imageLiteral(resourceName: "India")
            break
            
        case "EUR" :
            Image1.image = #imageLiteral(resourceName: "Euro")
            break
            
        case "CAD" :
            Image1.image = #imageLiteral(resourceName: "canada")
            break
            
        default:
            break
        }
        
        switch Label2.text{
            
        case "USD" :
            Image2.image = #imageLiteral(resourceName: "usa")
            break
            
        case "INR" :
            Image2.image = #imageLiteral(resourceName: "India")
            break
            
        case "EUR" :
            Image2.image = #imageLiteral(resourceName: "Euro")
            break
            
        case "CAD" :
            Image2.image = #imageLiteral(resourceName: "canada")
            break
            
        default:
            break
        }
        
        
        
    }
    
    
    func defaultRate()              // mathod to set the default rate
    {
        
        switch Label1.text{
            
        case "USD":
            
            
            
            switch Label2.text{
                
            case "USD":
                
                amt = amt * 1
                
                Label3.text = String(1)
                
                break
                
                
                
            case "INR":
                
                amt = amt * usdinr
                
                Label3.text = String(71.58)
                
                break
                
                
                
            case "CAD":
                
                amt = amt * usdcad
                
                Label3.text = String(1.32)
                
                break
                
                
                
            case "EUR":
                
                amt = amt * usdeur
                
                Label3.text = String(0.91)
                
                break
                
                
                
            default:
                
                break
                
            }
            
            
            
            break
            
            
            
        case "INR":
            
            
            
            switch Label2.text{
                
            case "USD":
                
                amt = amt * 1/usdinr
                
                Label3.text = String(1/usdinr)
                
                break
                
                
                
            case "INR":
                
                amt = amt * 1
                
                Label3.text = String(1)
                
                break
                
                
                
            case "CAD":
                
                amt = amt * inrcad
                
                Label3.text = String(inrcad)
                
                break
                
                
                
            case "EUR":
                
                amt = amt * inreur
                
                Label3.text = String(inreur)
                
                break
                
                
                
            default:
                
                break
                
            }
            
            
            
            break
            
            
            
        case "CAD":
            
            
            
            switch Label2.text{
                
            case "USD":
                
                amt = amt * 1/usdcad
                
                Label3.text = String(1/usdcad)
                
                break
                
                
                
            case "INR":
                
                amt = amt * 1/inrcad
                
                Label3.text = String(1/inrcad)
                
                break
                
                
                
            case "CAD":
                
                amt = amt * 1
                
                Label3.text = String(1)
                
                break
                
                
                
            case "EUR":
                
                amt = amt * cadeur
                
                Label3.text = String(1/cadeur)
                
                break
                
                
                
            default:
                
                break
                
            }
            
            
            
            break
            
            
            
        case "EUR":
            
            
            
            switch Label2.text{
                
            case "USD":
                
                amt = amt * 1/usdeur
                
                Label3.text = String(1/usdeur)
                
                break
                
                
                
            case "INR":
                
                amt = amt * 1/inreur
                
                Label3.text = String(1/inreur)
                
                break
                
                
                
            case "CAD":
                
                amt = amt * 1/cadeur
                
                Label3.text = String(1/cadeur)
                
                break
                
                
                
            case "EUR":
                
                amt = amt * 1
                
                Label3.text = String(1)
                
                break
                
                
                
            default:
                
                break
                
            }
            
            
            
            break
            
            
            
        default:
            
            break
            
        }
        
        
        
    }
    
}

extension CurrencyViewController {
    
    
    
    func addDoneButtonOnKeyboard(){
        
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        
        doneToolbar.barStyle = .default
        
        
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        
        
        let items = [flexSpace, done]
        
        doneToolbar.items = items
        
        doneToolbar.sizeToFit()
        
        
        
        TextField.inputAccessoryView = doneToolbar
        
    }
    
    
    
    @objc func doneButtonAction(){
        
        TextField.resignFirstResponder()
    }
}
