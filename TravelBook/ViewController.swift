//
//  ViewController.swift
//  TravelBook
//
//  Created by Abdullah Oğuz on 14.03.2021.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // harita hassasiyetini ayarlar
        locationManager.requestWhenInUseAuthorization() //uygulamanin ne zaman kullanilacagini ayarliyoruz, burada sadece uygulama calisiyorken konumu kullnacak
        locationManager.startUpdatingLocation() // uygulamanin lokasyon bilgilerini bu degisikliklere gore handle edip calistirir.
    
    }
    
    // kullanicinin lokasyon bilgilerini alir, bu fonksiyon guncellenen lokasyonlari bir dizi icerisinde verir
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude) //bu kisimda odaklayacagimiz koordinat bilgilerini aliyoruz
        // bu fonsiyon icinde yer alan locations : [CLLocation], dizi icinde guncellenen lokasyon bilgilerini verir
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1) // burada ne zoom yapilacak alan seciliyor
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }


}

