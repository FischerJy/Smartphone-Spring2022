//
//  ViewController.swift
//  AlertController
//
//  Created by admin on 3/24/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblAlert: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func press(_ sender: Any) {
        var txtField : UITextField?
        
        let alertController = UIAlertController(title: "Sample Alert Controller", message: "Simple Message", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title: "OK", style: .default) { action in
            print("OK Button pressed")
            self.lblAlert.text = txtField?.text
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .default) { action in
            print("Cancel button pressed")
        }
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        alertController.addTextField{lblTextField in
            lblTextField.placeholder = "Type Something"
            txtField = lblTextField
            
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

