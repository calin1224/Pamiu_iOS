//
//  MainViewController.swift
//  Pamiu
//
//  Created by gh.com on 2017/12/6.
//  Copyright © 2017年 studio.com. All rights reserved.
//

import UIKit
//import CoreLocation

class MainViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//         Do any additional setup after loading the view.
        
//        let locationManager = CLLocationManager.init()
//        // 1. 還沒有詢問過用戶以獲得權限
//        if CLLocationManager.authorizationStatus() == .notDetermined {
//            locationManager.requestAlwaysAuthorization()
//        }else if CLLocationManager.authorizationStatus() == .authorizedAlways {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
//            locationManager.startUpdatingLocation()
//        }
        
        
//        self.webView.loadRequest(URLRequest.init(url: NSURL.init(string: "http://188.166.186.159/app#/")! as URL))
        
        
        
        DispatchQueue.main.async(execute: { () -> Void in
            let vc = AgreeViewController()
            self.present(vc, animated: true, completion: nil)
        })
        
        
        
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

}

//extension MainViewController: CLLocationManagerDelegate {
//
//
//
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            print(location.coordinate)
//        }
//    }
//
//
//
//}

















