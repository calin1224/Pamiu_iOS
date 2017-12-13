//
//  AgreeViewController.swift
//  Pamiu
//
//  Created by gh.com on 2017/12/13.
//  Copyright © 2017年 studio.com. All rights reserved.
//

import UIKit

class AgreeViewController: UIViewController {

    @IBOutlet weak var btnAgree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func initView() -> Void {
        
        self.btnAgree.layer.cornerRadius = 22
        
        
    }
    
    
    
    
    
    

}
