//
//  ValuesViewController.swift
//  a05
//
//  Created by Ziming Gong on 3/2/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class ValuesViewController: UIViewController {

    @IBOutlet weak var txtCompanySysbol: UITextField!
    @IBOutlet weak var lblCompanyValues: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func getValues(_ sender: Any) {
        
        guard let sysbol = txtCompanySysbol.text else {return}
        
        let targetUrl = "\(url)\(sysbol.uppercased())?limit=1&apikey=\(apiKeys)"
        
        
        SwiftSpinner.show("Getting company Value for \(sysbol)")
        
        AF.request(targetUrl).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error  != nil{
                print(response.error)
                return
            }
        
        
            let infos = JSON(response.data!).array
            
            guard let values = infos!.first else {
                return
            }
            
            let i = Info()
            
            i.symbol = values["symbol"].stringValue
            i.EnterpriseValue = values["enterpriseValue"].floatValue
            
            self.lblCompanyValues.text = "\(i.symbol) :$ \(i.EnterpriseValue)"
        }
        
    }
    
}
