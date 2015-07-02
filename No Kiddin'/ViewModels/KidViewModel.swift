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
        items.append(jules)
        
        let bodil = Art()
        bodil.name = "Rieneke Dijkstra, Brighton, England"
        bodil.kidTintColor = UIColor(rgba: "#da759e")
        bodil.kidName = "Bodil"
        items.append(bodil)
        
        let nora = Art()
        nora.name = "MiroslawBalka, River"
        nora.kidTintColor = UIColor(rgba: "#ffc200")
        nora.kidName = "Nora"
        items.append(nora)
        
        let puk = Art()
        puk.name = "Allan McCollum, Plaster Surrogoles"
        puk.kidTintColor = UIColor(rgba: "#6c9f5d")
        puk.kidName = "Puk"
        puk.displayMode = .Dark
        items.append(puk)
        
        let mertcan = Art()
        mertcan.name = "Juan Muñoz, Listening Figure"
        mertcan.kidTintColor = UIColor(rgba: "#da759e")
        mertcan.kidName = "Mertcan"
        items.append(mertcan)
        
        let lola = Art()
        lola.name = "Carl Andre, Twenty-fifth steel Cardinal"
        lola.kidTintColor = UIColor(rgba: "#007dd1")
        lola.kidName = "Lola"
        items.append(lola)
        
        let david = Art()
        david.name = "Jörg Immendorff, Bä Tunst"
        david.kidTintColor = UIColor(rgba: "#ff8d37")
        david.kidName = "David"
        items.append(david)
        
        let roel = Art()
        roel.name = "Richard Long, Sixty Stones"
        roel.kidTintColor = UIColor(rgba: "#c1c5c6")
        roel.kidName = "Roel"
        items.append(roel)
        
        let nanne = Art()
        nanne.name = "Andrzej Wroblewski, Dazenie do doskonalosci"
        nanne.kidTintColor = UIColor(rgba: "#adc0ff")
        nanne.kidName = "Nanne"
        items.append(nanne)
        
        let esmee = Art()
        esmee.name = "Karel Appel, A beast-drawn man"
        esmee.kidTintColor = UIColor(rgba: "#cd9fff")
        esmee.kidName = "Esmee"
        esmee.displayMode = .Dark
        items.append(esmee)
        
        let nina = Art()
        nina.name = "Ad Snijders, zelfportret II"
        nina.kidTintColor = UIColor(rgba: "#da759e")
        nina.kidName = "Nina"
        items.append(nina)
        
        let lieke = Art()
        lieke.name = "Marc Chagall, Hommage a appollinaire"
        lieke.kidTintColor = UIColor(rgba: "#adc0ff")
        lieke.kidName = "Lieke"
        items.append(lieke)
        
        let isabel = Art()
        isabel.name = "Jan Sluijters, Landschap"
        isabel.kidTintColor = UIColor(rgba: "#64e389")
        isabel.kidName = "Isabel"
        isabel.displayMode = .Dark
        items.append(isabel)
        
        let lieve = Art()
        lieve.name = "Jean Brusselmans, Le bains des vagabonds"
        lieve.kidTintColor = UIColor(rgba: "#c1c5c6")
        lieve.kidName = "Lieve"
        lieve.displayMode = .Dark
        items.append(lieve)
        
        let ires = Art()
        ires.name = "Pablo Picasso, Buste de femme"
        ires.kidTintColor = UIColor(rgba: "#ff8d37")
        ires.kidName = "Ires"
        items.append(ires)
        
        let ivo = Art()
        ivo.name = "Carel Willink, Painting with wife"
        ivo.kidTintColor = UIColor(rgba: "#ffc200")
        ivo.kidName = "Ivo"
        items.append(ivo)
        
        return items
    }
}