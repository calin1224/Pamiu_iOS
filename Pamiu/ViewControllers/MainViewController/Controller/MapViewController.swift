//
//  MapViewController.swift
//  Pamiu
//
//  Created by gh.com on 2017/12/12.
//  Copyright © 2017年 studio.com. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager.init()
    let annotation = MKPointAnnotation()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.initView()
        
        locationManager.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 1. 還沒有詢問過用戶以獲得權限
        if CLLocationManager.authorizationStatus() == .notDetermined || CLLocationManager.authorizationStatus() == .denied {
            self.locationManager.requestWhenInUseAuthorization()
        }else if CLLocationManager.authorizationStatus() == .authorizedAlways || CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            self.startUpdatingLocation()
        }
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
        
        self.mapView.addAnnotation(self.annotation)
        
    }
    
    func startUpdatingLocation() -> Void {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
        locationManager.startUpdatingLocation()
    }

}





extension MapViewController: CLLocationManagerDelegate {
    
    //權限授權回調
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.denied { //拒絕
            
        }else if status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse {
            self.startUpdatingLocation()
        }
    }
    
    //取得當前經緯度
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location.coordinate)

            
            self.annotation.coordinate = location.coordinate
//            annotation.title = "title"
//            annotation.subtitle = "subtitle"
            self.mapView.setRegion(MKCoordinateRegion.init(center: self.annotation.coordinate, span: MKCoordinateSpan.init(latitudeDelta: 0.003, longitudeDelta: 0.003)), animated: true)
            
            //經緯度轉地址
            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                
                if error != nil{
                    print("error: \(String(describing: error))")
                    return
                }
                
                //name         街道地址
                //country      國家
                //province     省
                //locality     市
                //sublocality  縣.區
                //route        街道、路
                //streetNumber 門牌號碼
                //postalCode   郵遞區號
                if placemarks != nil && (placemarks?.count)! > 0 {
                    let placemark = placemarks![0] as CLPlacemark
                    //這邊拼湊轉回來的地址
                    //placemark.name
                    print("地址: \((placemark.name)!)")
                    self.annotation.title = placemark.name
                }
                
            })
        }
    }
    
    
}




