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
        jules.tintColor = UIColor(rgba: "#64e389")
        jules.kidName = "Jules"
        items.append(jules)
        
        let bodil = Art()
        bodil.name = "Rieneke Dijkstra, Brighton, England"
        bodil.tintColor = UIColor(rgba: "#da759e")
        bodil.kidName = "Bodil"
        items.append(bodil)
        
        let nora = Art()
        nora.name = "MiroslawBalka, River"
        nora.tintColor = UIColor(rgba: "#ffc200")
        nora.kidName = "Nora"
        items.append(nora)
        
        let puk = Art()
        puk.name = "Allan McCollum, Plaster Surrogoles"
        puk.tintColor = UIColor(rgba: "#6c9f5d")
        puk.kidName = "Puk"
        items.append(puk)
        
        let mertcan = Art()
        mertcan.name = "Juan Muñoz, Listening Figure"
        mertcan.tintColor = UIColor(rgba: "#da759e")
        mertcan.kidName = "Mertcan"
        items.append(mertcan)
        
        let lola = Art()
        lola.name = "Carl Andre, Twenty-fifth steel Cardinal"
        lola.tintColor = UIColor(rgba: "#007dd1")
        lola.kidName = "Lola"
        items.append(lola)
        
        let david = Art()
        david.name = "Jörg Immendorff, Bä Tunst"
        david.tintColor = UIColor(rgba: "#ff8d37")
        david.kidName = "David"
        items.append(david)
        
        let roel = Art()
        roel.name = "Richard Long, Sixty Stones"
        roel.tintColor = UIColor(rgba: "#c1c5c6")
        roel.kidName = "Roel"
        items.append(roel)
        
        let nanne = Art()
        nanne.name = "Andrzej Wroblewski, Dazenie do doskonalosci (ladders)"
        nanne.tintColor = UIColor(rgba: "#adc0ff")
        nanne.kidName = "Nanne"
        items.append(nanne)
        
        let esmee = Art()
        esmee.name = "Karel Appel, A beast-drawn man"
        esmee.tintColor = UIColor(rgba: "#cd9fff")
        esmee.kidName = "Esmee"
        items.append(esmee)
        
        let nina = Art()
        nina.name = "Ad Snijders, zelportret II"
        nina.tintColor = UIColor(rgba: "#da759e")
        nina.kidName = "Nina"
        items.append(nina)
        
        let lieke = Art()
        lieke.name = "Marc Chagall, Hommage a appollinaire"
        lieke.tintColor = UIColor(rgba: "#adc0ff")
        lieke.kidName = "Lieke"
        items.append(lieke)
        
        let isabel = Art()
        isabel.name = "Jan Sluijters, Landschap"
        isabel.tintColor = UIColor(rgba: "#64e389")
        isabel.kidName = "Isabel"
        items.append(isabel)
        
        let lieve = Art()
        lieve.name = "Jean Brusselmans, Le bains des vagabonds"
        lieve.tintColor = UIColor(rgba: "#c1c5c6")
        lieve.kidName = "Lieve"
        items.append(lieve)
        
        let ires = Art()
        ires.name = "Pablo Picasso, Buste de femme"
        ires.tintColor = UIColor(rgba: "#ff8d37")
        ires.kidName = "Ires"
        items.append(ires)
        
        let ivo = Art()
        ivo.name = "Carel Willink, Painting with wife"
        ivo.tintColor = UIColor(rgba: "#ffc200")
        ivo.kidName = "Ivo"
        items.append(ivo)
        
        return items
    }
}