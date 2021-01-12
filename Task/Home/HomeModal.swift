//
//  HomeModal.swift
//  Task
//
//  Created by Arpit Garg on 11/01/21.
//  Copyright © 2021 OneBanc. All rights reserved.
//

import Foundation

struct HomeModal {
    var cuisines = [CuisineSet]()
    var dishes = [DishSet]()
    
    init() {
        var cset1 = CuisineSet()
        cset1.imagepath = "https://cdn.vox-cdn.com/thumbor/_pR3-9LN35QwAG31yTbeYL-Xa7g=/0x0:2048x1363/1200x800/filters:focal(861x518:1187x844)/cdn.vox-cdn.com/uploads/chorus_image/image/64046300/kiinthaispread.0.0.1505009203.0.jpg"
        cset1.name = "first"
        var cset2 = CuisineSet()
        cset2.imagepath = "https://www.unileverfoodsolutions.com.sg/en/chef-inspiration/western-world-cuisine/3-key-things-to-note-about-western-cuisine/jcr:content/listImage.transform/jpeg-optimized/image.640x640.jpg"
        cset2.name = "second"
        var cset3 = CuisineSet()
        cset3.imagepath = "https://www.classiblogger.com/wp-content/uploads/2014/08/list-of-cuisines-classiblogger.png"
        cset3.name = "third"
        let d1 = DishSet(imagepath: "https://static01.nyt.com/images/2018/10/23/dining/as-white-bean-tomato/as-white-bean-tomato-superJumbo-v2.jpg", price: 20, rating: 4.0)
        let d2 = DishSet(imagepath: "https://upload.wikimedia.org/wikipedia/commons/f/f2/A_traditional_indian_dish_of_bengal%28%22pulao-mangsha%22_with_misti_doi%29.JPG", price: 40, rating: 4.1)
        let d3 = DishSet(imagepath: "https://m.media-amazon.com/images/I/71t3ZbyVamL._AC_SS350_.jpg", price: 30, rating: 3.9)
        let d4 = DishSet(imagepath: "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_412,c_fill,g_auto,h_232,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F181024121221-india-ultimate-food-guide---goa-spices.jpg", price: 50, rating: 4.2)
        let d5 = DishSet(imagepath: "https://upload.wikimedia.org/wikipedia/commons/6/68/Testaroli-Pesto-Pontremoli-2800.jpg", price: 60, rating: 3.0)
        let d6 = DishSet(imagepath: "https://i2.wp.com/vegecravings.com/wp-content/uploads/2018/02/South-Indian-Recipes-List.jpg?fit=2000%2C1600&quality=65&strip=all&ssl=1", price: 70, rating: 4.3)
        let d7 = DishSet(imagepath: "https://static.toiimg.com/thumb/msid-71690015,imgsize-472097,width-800,height-600,resizemode-75/71690015.jpg", price: 80, rating: 3.8)
        let d8 = DishSet(imagepath: "https://www.bonami.com/wp-content/uploads/2018/02/DishScuff_SelectsWEB.jpg", price: 90, rating: 1.0)
        let d9 = DishSet(imagepath: "https://stylecaster.com/wp-content/uploads/2018/08/mina-harissa-moroccan-chicken.jpg", price: 200, rating: 4.8)
        cset1.itDishes.append(d1)
        cset1.itDishes.append(d2)
        cset1.itDishes.append(d3)
        cset2.itDishes.append(d4)
        cset2.itDishes.append(d5)
        cset2.itDishes.append(d6)
        cset3.itDishes.append(d7)
        cset3.itDishes.append(d8)
        cset3.itDishes.append(d9)
        self.cuisines.append(cset1)
        self.cuisines.append(cset2)
        self.cuisines.append(cset3)
        self.dishes.append(d1)
        self.dishes.append(d2)
        self.dishes.append(d3)
        self.dishes.append(d4)
        self.dishes.append(d5)
        self.dishes.append(d6)
        self.dishes.append(d7)
        self.dishes.append(d8)
        self.dishes.append(d9)
    }
}


struct CuisineSet {
    var imagepath: String!
    var name: String!
    var itDishes = [DishSet]()
}

struct DishSet {
    var imagepath: String!
    var price:Double!
    var rating:Double!
    var count = 0
}
