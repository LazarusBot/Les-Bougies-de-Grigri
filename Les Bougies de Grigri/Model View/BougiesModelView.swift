//
//  BougiesModelView.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 11/03/2023.
//

import SwiftUI
import Combine

class BougiesModelView: ObservableObject {
    
    @Published var productType: ProductType = .Nouveautes
    
    @Published var products: [Bougies] = [
    
        Bougies(type: .Nouveautes, title: "Bougies Découverte", subtitle: "Bougie végétale senteur cèdre coulée à la main.", price: 10, rating: "4,1", image: "cedre nv"),
        Bougies(type: .Nouveautes, title: "Bougies Découverte", subtitle: "Bougie végétale senteur citronelle coulée à la main.", price: 10, rating: "4,1", image: "citronelle nv"),
        Bougies(type: .Nouveautes, title: "Bougies Découverte", subtitle: "Bougie végétale senteur flocon coulée à la main.", price: 10, rating: "4,1", image: "flocon nv"),
        Bougies(type: .Nouveautes, title: "Bougies Découverte", subtitle: "Bougie végétale senteur muguet coulée à la main.", price: 10, rating: "4,1", image: "muguet nv"),
        Bougies(type: .Nouveautes, title: "Bougies Découverte", subtitle: "Bougie végétale senteur pastèque coulée à la main.", price: 10, rating: "4,1", image: "pasteque nv"),
        Bougies(type: .Nouveautes, title: "Bougies Découverte", subtitle: "Bougie végétale senteur sapin coulée à la main.", price: 10, rating: "4,1", image: "sapinnoel nv"),
        Bougies(type: .Nouveautes, title: "Bougies Découverte", subtitle: "Bougie gourmande tout en chantilly de cire de soja au parfum chocolat.", price: 13, rating: "4,1", image: "chantillypaques ot"),
        Bougies(type: .Nouveautes, title: "Bougies Découverte", subtitle: "Bougie gourmande fait main.", price: 18, rating: "4,1", image: "pasteque ot"),
        
        Bougies(type: .Bougies, title: "Bougies Sundae", subtitle: "Bougie chantilly en forme de sundae.", price: 22, rating: "4,0", image: "lattechaibr"),
        Bougies(type: .Bougies, title: "Bougies Sundae", subtitle: "Bougie chantilly en forme de sundae.", price: 22, rating: "4,0", image: "barbeapapabr"),
        Bougies(type: .Bougies, title: "Bougies Sundae", subtitle: "Bougie chantilly en forme de sundae.", price: 22, rating: "4,0", image: "cerisebr"),
        Bougies(type: .Bougies, title: "Bougies Sundae", subtitle: "Bougie chantilly en forme de sundae.", price: 22, rating: "4,0", image: "cremecaramelbr"),
        Bougies(type: .Bougies, title: "Bougies Sundae", subtitle: "Bougie chantilly en forme de sundae.", price: 22, rating: "4,0", image: "cookiesbr"),
        Bougies(type: .Bougies, title: "Bougies Sundae", subtitle: "Bougie chantilly en forme de sundae.", price: 22, rating: "4,0", image: "murebr"),
        Bougies(type: .Bougies, title: "Bougies Sundae", subtitle: "Bougie chantilly en forme de sundae.", price: 22, rating: "4,0", image: "nougatbr"),
        
        Bougies(type: .Bougies, title: "Bougies Bonbonnieres", subtitle: "Bougie coulée à la main dans une bonbonnière.", price: 20, rating: "4,2", image: "ananas 1"),
        Bougies(type: .Bougies, title: "Bougies Bonbonnieres", subtitle: "Bougie coulée à la main dans une bonbonnière.", price: 20, rating: "4,2", image: "applepie 1"),
        Bougies(type: .Bougies, title: "Bougies Bonbonnieres", subtitle: "Bougie coulée à la main dans une bonbonnière.", price: 20, rating: "4,2", image: "babie 1"),
        Bougies(type: .Bougies, title: "Bougies Bonbonnieres", subtitle: "Bougie coulée à la main dans une bonbonnière.", price: 20, rating: "4,2", image: "baiesrouge 1"),
        Bougies(type: .Bougies, title: "Bougies Bonbonnieres", subtitle: "Bougie coulée à la main dans une bonbonnière.", price: 20, rating: "4,2", image: "cedrejasmin 1"),
        Bougies(type: .Bougies, title: "Bougies Bonbonnieres", subtitle: "Bougie coulée à la main dans une bonbonnière.", price: 20, rating: "4,2", image: "chocolat 1"),
        Bougies(type: .Bougies, title: "Bougies Bonbonnieres", subtitle: "Bougie coulée à la main dans une bonbonnière.", price: 20, rating: "4,2", image: "citron 1"),
        Bougies(type: .Bougies, title: "Bougies Bonbonnieres", subtitle: "Bougie coulée à la main dans une bonbonnière.", price: 20, rating: "4,2", image: "citronelle 1"),
        Bougies(type: .Bougies, title: "Bougies Bonbonnieres", subtitle: "Bougie coulée à la main dans une bonbonnière.", price: 20, rating: "4,2", image: "coco 1"),
        Bougies(type: .Bougies, title: "Bougies Bonbonnieres", subtitle: "Bougie coulée à la main dans une bonbonnière.", price: 20, rating: "4,2", image: "menthe 1"),
        Bougies(type: .Bougies, title: "Bougies Bonbonnieres", subtitle: "Bougie coulée à la main dans une bonbonnière.", price: 20, rating: "4,2", image: "minuit 1"),
        Bougies(type: .Bougies, title: "Bougies Bonbonnieres", subtitle: "Bougie coulée à la main dans une bonbonnière.", price: 20, rating: "4,2", image: "vanillefraise 1"),

        Bougies(type: .Bougies, title: "Bougies Boudoirs", subtitle: "Bougie parfumée coulée à la main en cire végétale de soja.", price: 13, rating: "4,8", image: "ange boudoir"),
        Bougies(type: .Bougies, title: "Bougies Boudoirs", subtitle: "Bougie parfumée coulée à la main en cire végétale de soja.", price: 13, rating: "4,8", image: "boisderose boudoir"),
        Bougies(type: .Bougies, title: "Bougies Boudoirs", subtitle: "Bougie parfumée coulée à la main en cire végétale de soja.", price: 13, rating: "4,8", image: "cookies boudoir"),
        Bougies(type: .Bougies, title: "Bougies Boudoirs", subtitle: "Bougie parfumée coulée à la main en cire végétale de soja.", price: 13, rating: "4,8", image: "lingefrais boudoir"),
        Bougies(type: .Bougies, title: "Bougies Boudoirs", subtitle: "Bougie parfumée coulée à la main en cire végétale de soja.", price: 13, rating: "4,8", image: "mai boudoir"),
        Bougies(type: .Bougies, title: "Bougies Boudoirs", subtitle: "Bougie parfumée coulée à la main en cire végétale de soja.", price: 13, rating: "4,8", image: "monoifruitee boudoir"),
        Bougies(type: .Bougies, title: "Bougies Boudoirs", subtitle: "Bougie parfumée coulée à la main en cire végétale de soja.", price: 13, rating: "4,8", image: "nougat boudoir"),
        Bougies(type: .Bougies, title: "Bougies Boudoirs", subtitle: "Bougie parfumée coulée à la main en cire végétale de soja.", price: 13, rating: "4,8", image: "pinup boudoir"),
        
        Bougies(type: .Bougies, title: "Bougies Crumble", subtitle: "Bougie Gourmande réalisée à la main.", price: 17, rating: "4,2", image: "caramel crumble"),
        Bougies(type: .Bougies, title: "Bougies Crumble", subtitle: "Bougie Gourmande réalisée à la main.", price: 17, rating: "4,2", image: "chocolat crumble"),
        Bougies(type: .Bougies, title: "Bougies Crumble", subtitle: "Bougie Gourmande réalisée à la main.", price: 17, rating: "4,2", image: "framboise crumble"),
        Bougies(type: .Bougies, title: "Bougies Crumble", subtitle: "Bougie Gourmande réalisée à la main.", price: 17, rating: "4,2", image: "tartecitron crumble"),
        
        Bougies(type: .Bougies, title: "Bougies Cupcake", subtitle: "Bougie gourmande en forme de cupcake - non comestible.", price: 14, rating: "4,2", image: "caramel cupcake"),
        Bougies(type: .Bougies, title: "Bougies Cupcake", subtitle: "Bougie gourmande en forme de cupcake - non comestible.", price: 14, rating: "4,2", image: "chocolat cupcake"),
        Bougies(type: .Bougies, title: "Bougies Cupcake", subtitle: "Bougie gourmande en forme de cupcake - non comestible.", price: 14, rating: "4,2", image: "framboise cupcake"),
        Bougies(type: .Bougies, title: "Bougies Cupcake", subtitle: "Bougie gourmande en forme de cupcake - non comestible.", price: 14, rating: "4,2", image: "grigri cupcake"),
        Bougies(type: .Bougies, title: "Bougies Cupcake", subtitle: "Bougie gourmande en forme de cupcake - non comestible.", price: 14, rating: "4,2", image: "peche cupcake"),
        Bougies(type: .Bougies, title: "Bougies Cupcake", subtitle: "Bougie gourmande en forme de cupcake - non comestible.", price: 14, rating: "4,2", image: "pivoine cupcake"),
        Bougies(type: .Bougies, title: "Bougies Cupcake", subtitle: "Bougie gourmande en forme de cupcake - non comestible.", price: 14, rating: "4,2", image: "prune cupcake"),
        Bougies(type: .Bougies, title: "Bougies Cupcake", subtitle: "Bougie gourmande en forme de cupcake - non comestible.", price: 14, rating: "4,2", image: "violette cupcake"),
        
        Bougies(type: .Bougies, title: "Bougies Macaron", subtitle: "Bougie gourmande en forme de macaron - non comestible.", price: 6, rating: "4,2", image: "caramel macaron"),
        Bougies(type: .Bougies, title: "Bougies Macaron", subtitle: "Bougie gourmande en forme de macaron - non comestible.", price: 6, rating: "4,2", image: "chocolat macaron"),
        Bougies(type: .Bougies, title: "Bougies Macaron", subtitle: "Bougie gourmande en forme de macaron - non comestible.", price: 6, rating: "4,2", image: "concombre macaron"),
        
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "ange Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "explosionfleurs Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "lady Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "minuit Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "cedre Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "lys Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "muguet Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "pivoine Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "roses Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "cerise Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "citron Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "framboise Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "monoifruite Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "mure Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "pasteque Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "peche Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "barbeapapa Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "caramel Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "chamallow Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "chocolatorange Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "cookies Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "etoiles Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "gourmandise Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "lattechai Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "muffin Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "nougat Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "painepice Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "tartecitron Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "babie Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "boisderose Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "citrouille Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "cocooning Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "nagchampa Background Removed"),
        Bougies(type: .Fondants, title: "Fondants", subtitle: "Fondant parfumé fait main disponible au format tablette.", price: 10, rating: "4,2", image: "poudre Background Removed"),
        
        Bougies(type: .Bruleurs, title: "Brûleur électrique", subtitle: "Brûleur électrique pour vos fondants parfumés.", price: 40, rating: "4,2", image: "ondes br"),
        
        Bougies(type: .Bruleurs, title: "Brûleurs céramique", subtitle: "Brûleur en céramique pour vos fondants parfumés.", price: 12, rating: "4,2", image: "beige bru"),
        Bougies(type: .Bruleurs, title: "Brûleurs céramique", subtitle: "Brûleur en céramique pour vos fondants parfumés.", price: 12, rating: "4,2", image: "blanc bru"),
        Bougies(type: .Bruleurs, title: "Brûleurs céramique", subtitle: "Brûleur en céramique pour vos fondants parfumés.", price: 12, rating: "4,2", image: "blancmat bru"),
        Bougies(type: .Bruleurs, title: "Brûleurs céramique", subtitle: "Brûleur en céramique pour vos fondants parfumés.", price: 12, rating: "4,2", image: "gris bru"),
        Bougies(type: .Bruleurs, title: "Brûleurs céramique", subtitle: "Brûleur en céramique pour vos fondants parfumés.", price: 12, rating: "4,2", image: "grismat bru"),
        Bougies(type: .Bruleurs, title: "Brûleurs céramique", subtitle: "Brûleur en céramique pour vos fondants parfumés.", price: 12, rating: "4,2", image: "marbre bru"),
        Bougies(type: .Bruleurs, title: "Brûleurs céramique", subtitle: "Brûleur en céramique pour vos fondants parfumés.", price: 12, rating: "4,2", image: "rose bru"),
        
        Bougies(type: .Bruleurs, title: "Brûleurs à motif", subtitle: "Brûleur en céramique pour vos fondants parfumés.", price: 12, rating: "4,2", image: "coeurs Bru"),
        Bougies(type: .Bruleurs, title: "Brûleurs à motif", subtitle: "Brûleur en céramique pour vos fondants parfumés.", price: 12, rating: "4,2", image: "etoiles Bru"),
        Bougies(type: .Bruleurs, title: "Brûleurs à motif", subtitle: "Brûleur en céramique pour vos fondants parfumés.", price: 12, rating: "4,2", image: "luneetoilee Bru")
        
    ]
    
    @Published var filteredBougies: [Bougies] = []
    
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var searchedProducts: [Bougies]?
    
    var searchCancellable: AnyCancellable?
    
    init() {
        filterBougieByType()
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str != "" {
                    self.filterBougieBySearch()
                } else {
                    self.searchedProducts = nil
                }
            })
    }
    
    func filterBougieByType() {
        
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
                .lazy
                .filter { product in
                    return product.type == self.productType
                }
                .prefix(4)
            
            DispatchQueue.main.async {
                self.filteredBougies = results.compactMap({ product in
                    return product
                })
            }
        }
    }
    
    func filterBougieBySearch() {
        
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
                .lazy
                .filter { [self] product in
                    return product.title.lowercased().contains(self.searchText.lowercased())
                }
            
            DispatchQueue.main.async {
                self.searchedProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
}
