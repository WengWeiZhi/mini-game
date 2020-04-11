//
//  ViewController.swift
//  kelp
//
//

import UIKit

class ViewController: UIViewController {

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

