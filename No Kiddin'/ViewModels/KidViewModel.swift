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
        jules.name = "Self-Heterotopia, Catching Up with Self, Hüseyin Bahri Alptekin"
        jules.kidTintColor = UIColor(rgba: "#64e389")
        jules.kidName = "Jules"
        jules.kidAge = 5
        jules.artSize = CGSize(width: 3680, height: 2456)
        items.append(jules)
        
        let bodil = Art()
        bodil.name = "Brighton, England, Rineke Dijkstra"
        bodil.kidTintColor = UIColor(rgba: "#da759e")
        bodil.kidName = "Bodil"
        bodil.kidAge = 5
        bodil.artSize = CGSize(width: 2074, height: 2591)
        items.append(bodil)
        
        let nora = Art()
        nora.name = "River, Miroslaw Balka"
        nora.kidTintColor = UIColor(rgba: "#ffc200")
        nora.kidName = "Nora"
        nora.kidAge = 6
        nora.artSize = CGSize(width: 3680, height: 2456)
        items.append(nora)
        
        let floris = Art()
        floris.audioFormat = "wav"
        floris.name = "Reflexion, Ruud van Empel"
        floris.kidTintColor = UIColor(rgba: "#6c9f5d")
        floris.kidName = "Floris"
        floris.kidAge = 7
        floris.artSize = CGSize(width: 3544, height: 2468)
        items.append(floris)
        
        let storm = Art()
        storm.audioFormat = "wav"
        storm.name = "Moder at work,  Viviane Sassen"
        storm.kidTintColor = UIColor(rgba: "#da759e")
        storm.kidName = "Storm"
        storm.kidAge = 7
        storm.artSize = CGSize(width: 2687, height: 2097)
        items.append(storm)
        
        let puk = Art()
        puk.name = "Plaster Surrogates, Allan McCollum"
        puk.kidTintColor = UIColor(rgba: "#007dd1")
        puk.kidName = "Puk"
        puk.kidAge = 9
        puk.displayMode = .Dark
        puk.artSize = CGSize(width: 3046, height: 2456)
        items.append(puk)
        
        let guusje = Art()
        guusje.audioFormat = "wav"
        guusje.name = "Enkhuizer Almanak, Nicolas Dings"
        guusje.kidTintColor = UIColor(rgba: "#ff8d37")
        guusje.kidName = "Guusje"
        guusje.kidAge = 10
        guusje.artSize = CGSize(width: 3123, height: 2801)
        items.append(guusje)
        
        let kay = Art()
        kay.name = "Listening Figure, Juan Muñoz"
        kay.kidTintColor = UIColor(rgba: "#c1c5c6")
        kay.kidName = "Kay"
        kay.kidAge = 10
        kay.artSize = CGSize(width: 2456, height: 3680)
        items.append(kay)
        
        let david = Art()
        david.name = "BäTunst, Jörg Immendorff"
        david.kidTintColor = UIColor(rgba: "#adc0ff")
        david.kidName = "David"
        david.kidAge = 11
        david.artSize = CGSize(width: 2930, height: 2941)
        items.append(david)
        
        let roel = Art()
        roel.name = "Sixty Stones, Richard Long"
        roel.kidTintColor = UIColor(rgba: "#cd9fff")
        roel.kidName = "Roel"
        roel.kidAge = 11
        roel.artSize = CGSize(width: 3680, height: 2456)
        items.append(roel)
        
        let nanne = Art()
        nanne.name = "Dazenie do Doskonalosci, Andrzej Wróblewski"
        nanne.kidTintColor = UIColor(rgba: "#da759e")
        nanne.kidName = "Nanne"
        nanne.kidAge = 12
        nanne.artSize = CGSize(width: 3085, height: 2162)
        items.append(nanne)
        
        let sam = Art()
        sam.audioFormat = "wav"
        sam.name = "Apolonia, Erwin Olaf"
        sam.kidTintColor = UIColor(rgba: "#adc0ff")
        sam.kidName = "Sam"
        sam.kidAge = 13
        sam.artSize = CGSize(width: 2512, height: 3353)
        items.append(sam)
        
        let isabel = Art()
        isabel.name = " Landschap, Jan Sluijters"
        isabel.kidTintColor = UIColor(rgba: "#64e389")
        isabel.kidName = "Isabel"
        isabel.kidAge = 14
        isabel.displayMode = .Dark
        isabel.artSize = CGSize(width: 3570, height: 2661)
        items.append(isabel)
        
        let nina = Art()
        nina.name = "Zelfportret II, Ad Snijders"
        nina.kidTintColor = UIColor(rgba: "#c1c5c6")
        nina.kidName = "Nina"
        nina.kidAge = 14
        nina.artSize = CGSize(width: 2248, height: 3267)
        items.append(nina)
        
        let lieve = Art()
        lieve.name = "Le bain des vagabonds, Jean Brusselmans"
        lieve.kidTintColor = UIColor(rgba: "#ff8d37")
        lieve.kidName = "Lieve"
        lieve.kidAge = 15
        lieve.displayMode = .Dark
        lieve.artSize = CGSize(width: 2632, height: 2614)
        items.append(lieve)
        
        let ires = Art()
        ires.name = "Buste de femme, Pablo Picasso"
        ires.kidTintColor = UIColor(rgba: "#ffc200")
        ires.kidName = "Ires"
        ires.kidAge = 16
        ires.artSize = CGSize(width: 804, height: 1000)
        items.append(ires)
        
        return items
    }
}