//
//  ShopsTest.swift
//  MadridShopsTests
//
//  Created by Gema on 7/9/17.
//  Copyright © 2017 Gema. All rights reserved.
//

import XCTest
import MadridShops

class ShopsTest: XCTestCase {
    
    func testGivenEmptyShopsNumberShopsIsZero(){
        let sut = Shops()
        XCTAssertEqual(0, sut.count())
    }
    
    func testGivenShopsWithOneElementNumberShopsIsOne() {
        let sut = Shops()
        sut.add(shop: Shop(name: "Shop"))
        XCTAssertEqual(1, sut.count())
    }
    
//    func testGivenShopWithTwoElementGetOneShop(){
//        let sut = Shops()
//        let shop1 = Shop(name: "Shop 1")
//        sut.add(shop: shop1)
//        sut.add(shop: Shop(name: "Shop 2"))
//        
//        XCTAssertEqual(shop1, sut.get(index: 0))
//        
//    }
    
    
}
