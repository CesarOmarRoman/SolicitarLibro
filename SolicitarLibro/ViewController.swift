//
//  ViewController.swift
//  SolicitarLibro
//
//  Created by César Omar Román Domínguez on 21/11/16.
//  Copyright © 2016 César Omar Román Domínguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelText: UITextField!
    @IBOutlet weak var labelVIew: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        labelText.clearButtonMode = UITextFieldViewMode.always
        labelText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + labelText.text!
        let url = URL(string: urls)
        let datos = NSData(contentsOf: url! as URL)
        
        if datos != nil {
            self.labelVIew.text = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)! as String
        } else {
            let alertController = UIAlertController(title: "Error", message: "Ha habido un problema conectando con el servidor", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        return false
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.labelVIew.text = ""
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

