//
//  MatomoTracker+SharedInstance.swift
//  Test
//
//  Created by Jared on 2020/8/4.
//  Copyright © 2020 Jared. All rights reserved.
//

import Foundation
import MatomoTracker

extension MatomoTracker {
    @objc static let shared: MatomoTracker = {
        let queue = UserDefaultsQueue(UserDefaults.standard, autoSave: true)
        let dispatcher = URLSessionDispatcher(baseURL: URL(string: "https://matomotest.dapengjiaoyu.cn/matomo/matomo/matomo.php")!)
        let matomoTracker = MatomoTracker(siteId: "6", queue: queue, dispatcher: dispatcher)
        matomoTracker.logger = DefaultLogger(minLevel: .verbose)
        matomoTracker.migrateFromFourPointFourSharedInstance()
        return matomoTracker
    }()
    
    private func migrateFromFourPointFourSharedInstance() {
        guard !UserDefaults.standard.bool(forKey: "migratedFromFourPointFourSharedInstance") else { return }
        copyFromOldSharedInstance()
        UserDefaults.standard.set(true, forKey: "migratedFromFourPointFourSharedInstance")
    }
    
    @objc public func startNewSession1() {
        MatomoTracker.shared.startNewSession()
    }
    
    @objc public func trackEvent1(view: [String], url: URL? = nil, customTrackingParameters: [String:String]) {
        MatomoTracker.shared.track(Event(tracker: MatomoTracker.shared, action: view, url: url, customTrackingParameters: customTrackingParameters))
    }
    
}
