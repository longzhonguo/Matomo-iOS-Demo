//
//  File.swift
//  Test
//
//  Created by Jared on 2020/8/4.
//  Copyright © 2020 Jared. All rights reserved.
//

import Foundation
import MatomoTracker

public class HH:NSObject{
    @objc public func show()
    {
        print("Hello")
        
        let matomoTracker = MatomoTracker(siteId: "6", baseURL: URL(string: "https://matomotest.dapengjiaoyu.cn/matomo/matomo/matomo.php")!)
        matomoTracker.userId = "Jared"
//        matomoTracker.track(eventWithCategory: "player", action: "slide", name: "volume", value: 35.1)
//        matomoTracker.trackSearch(query: "Best mobile tracking", category: "Technology", resultCount: 15)
//        matomoTracker.trackContentImpression(name: <#T##String#>, piece: <#T##String?#>, target: <#T##String?#>)
//        matomoTracker.trackContentInteraction(name: <#T##String#>, interaction: <#T##String#>, piece: <#T##String?#>, target: <#T##String?#>)
//
//        let items = [
//          OrderItem(sku: "product_sku_1", name: "iPhone Xs", category: "phone", price: 999.99, quantity: 1),
//          OrderItem(sku: "product_sku_2", name: "iPhone Xs Max", category: "phone", price: 1199.99, quantity: 1)
//        ]
//
//        matomoTracker.trackOrder(id: "order_id_1234", items: items, revenue: 2199.98, subTotal: 2000, tax: 190.98, shippingCost: 9)
        
        
        let baseURL = URL(string: "https://matomotest.dapengjiaoyu.cn/matomo/matomo/matomo.php")!
        let event = Event(tracker: matomoTracker, action: ["Path1", "Path2"], url: baseURL, customTrackingParameters: ["download": "lalala", "name": "Jared", "path": "Path1/Path2"])
        matomoTracker.track(event)
        matomoTracker.dispatch()
    }
    
}
