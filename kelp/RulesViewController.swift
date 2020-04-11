//
//  RulesViewController.swift
//  kelp
//
//

import UIKit

class RulesViewController: UIViewController {

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    let MainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func button_click(_ sender: UIButton) {
        navigationController?.pushViewController(MainView, animated: true)
    }

}

