//
//  ViewController.swift
//  KronometreUygulamasi
//
//  Created by Ceren Acay on 22.12.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var baslangicZamani = TimeInterval()
    
    @objc func guncellemeZamani ()
    {
        let simdikiZaman = NSDate.timeIntervalSinceReferenceDate
        
        var gecenZaman : TimeInterval = simdikiZaman - baslangicZamani
        
        let dakika = UInt8(gecenZaman/60.0)
        gecenZaman -= (TimeInterval (dakika)*60.0)
        
        let saniye = UInt8(gecenZaman)
        gecenZaman -= TimeInterval(saniye)
                       
        let salise = UInt8(gecenZaman*100)
    
        
        let strdakika = String(format:"%02d",dakika)
        let strsaniye = String(format:"%02d",saniye)
        let strsalise = String(format:"%02d",salise)
        
        lblSaat.text = "\(strdakika):\(strsaniye):\(strsalise)"
    }

    var zamanlayici = Timer()

    @IBOutlet weak var lblSaat: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnBasla(_ sender: Any) {
        
        let aSelector: Selector = #selector(ViewController.guncellemeZamani)
        zamanlayici = Timer.scheduledTimer(timeInterval:0.01, target:self, selector:aSelector, userInfo:nil, repeats:true)
        baslangicZamani = NSDate.timeIntervalSinceReferenceDate
    }
    
    @IBAction func btnDur(_ sender: Any) {
        
        zamanlayici.invalidate()
    }
}

