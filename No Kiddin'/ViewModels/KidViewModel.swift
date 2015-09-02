//
//  KidViewModel.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 01-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit

class KidViewModel {
    
    init(viewController: KidsViewController) {
        viewController.items = items()
    }
    
    internal func items() -> Array<Art> {
        var items = Array<Art>()
        
        let jules = Art()
        jules.name = "Huseyinbahri, Self-Heterotopia"
        jules.kidTintColor = UIColor(rgba: "#64e389")
        jules.kidName = "Jules"
        jules.artSize = CGSize(width: 3680, height: 2456)
        items.append(jules)
        
        let bodil = Art()
        bodil.name = "Rieneke Dijkstra, Brighton, England"
        bodil.kidTintColor = UIColor(rgba: "#da759e")
        bodil.kidName = "Bodil"
        bodil.artSize = CGSize(width: 2074, height: 2591)
        items.append(bodil)
        
        let nora = Art()
        nora.name = "MiroslawBalka, River"
        nora.kidTintColor = UIColor(rgba: "#ffc200")
        nora.kidName = "Nora"
        nora.artSize = CGSize(width: 3680, height: 2456)
        items.append(nora)
        
        let floris = Art()
        floris.name = "Ruud van Empel, Reflexion"
        floris.kidTintColor = UIColor(rgba: "#6c9f5d")
        floris.kidName = "Floris"
        floris.artSize = CGSize(width: 3123, height: 2801)
        items.append(floris)
        
        let storm = Art()
        storm.name = "Viviane Sassen, Modder at work"
        storm.kidTintColor = UIColor(rgba: "#da759e")
        storm.kidName = "Storm"
        storm.artSize = CGSize(width: 2687, height: 2097)
        items.append(storm)
        
        let puk = Art()
        puk.name = "Allan McCollum, Plaster Surrogoles"
        puk.kidTintColor = UIColor(rgba: "#007dd1")
        puk.kidName = "Puk"
        puk.displayMode = .Dark
        puk.artSize = CGSize(width: 3046, height: 2456)
        items.append(puk)
        
        let guusje = Art()
        guusje.name = "Nicolas Dings, Enkhuizer Almanak"
        guusje.kidTintColor = UIColor(rgba: "#ff8d37")
        guusje.kidName = "Guusje"
        guusje.artSize = CGSize(width: 3123, height: 2801)
        items.append(guusje)
        
        let kay = Art()
        kay.name = "Juan Mūnoz, Listening Figure"
        kay.kidTintColor = UIColor(rgba: "#c1c5c6")
        kay.kidName = "Kay"
        kay.artSize = CGSize(width: 2456, height: 3680)
        items.append(kay)
        
        let david = Art()
        david.name = "Jörg Immendorff, Bä Tunst"
        david.kidTintColor = UIColor(rgba: "#adc0ff")
        david.kidName = "David"
        david.artSize = CGSize(width: 2930, height: 2941)
        items.append(david)
        
        let roel = Art()
        roel.name = "Richard Long, Sixty Stones"
        roel.kidTintColor = UIColor(rgba: "#cd9fff")
        roel.kidName = "Roel"
        roel.artSize = CGSize(width: 3680, height: 2456)
        items.append(roel)
        
        let nanne = Art()
        nanne.name = "Andrzej Wroblewski, Dazenie do doskonalosci"
        nanne.kidTintColor = UIColor(rgba: "#da759e")
        nanne.kidName = "Nanne"
        nanne.artSize = CGSize(width: 3085, height: 2162)
        items.append(nanne)
        
        let sam = Art()
        sam.name = "Erwin Olaf, Apolonia"
        sam.kidTintColor = UIColor(rgba: "#adc0ff")
        sam.kidName = "Sam"
        sam.artSize = CGSize(width: 2512, height: 3353)
        items.append(sam)
        
        let isabel = Art()
        isabel.name = "Jan Sluijters, Landschap"
        isabel.kidTintColor = UIColor(rgba: "#64e389")
        isabel.kidName = "Isabel"
        isabel.displayMode = .Dark
        isabel.artSize = CGSize(width: 3570, height: 2661)
        items.append(isabel)
        
        let nina = Art()
        nina.name = "Ad Snijders, zelfportret II"
        nina.kidTintColor = UIColor(rgba: "#c1c5c6")
        nina.kidName = "Nina"
        nina.artSize = CGSize(width: 2248, height: 3267)
        items.append(nina)
        
        let lieve = Art()
        lieve.name = "Jean Brusselmans, Le bains des vagabonds"
        lieve.kidTintColor = UIColor(rgba: "#ff8d37")
        lieve.kidName = "Lieve"
        lieve.displayMode = .Dark
        lieve.artSize = CGSize(width: 2632, height: 2614)
        items.append(lieve)
        
        let ires = Art()
        ires.name = "Pablo Picasso, Buste de femme"
        ires.kidTintColor = UIColor(rgba: "#ffc200")
        ires.kidName = "Ires"
        ires.artSize = CGSize(width: 804, height: 1000)
        items.append(ires)
        
        return items
    }
}