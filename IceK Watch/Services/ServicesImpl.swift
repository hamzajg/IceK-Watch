//
//  ServicesImpl.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-05.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import Foundation

class ServicesImpl {
    var movies : [Item] = []
    var animes : [Item] = []
    var series : [Item] = []
    static let MoviesInstance = ServicesImpl(type: 1)
    static let SeriesInstance = ServicesImpl(type: 2)
    static let AnimesInstance = ServicesImpl(type: 3)
    fileprivate init(type: Int) {
        switch type {
        case 1:
            getAllMovies()
            break
        case 2:
            getAllSeries()
            break
        case 3:
            getAllAnimes()
            break
        default:
            break
        }
        
    }
    
    func getAllMovies() {
        var m : [Item] = []
        //m = HTTP Get All Movies
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        m.append(Item(itemId: Int64(1), itemTitle: "Test", itemDesc: "Test", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        self.movies = m
        
    }
    func getAllAnimes() {
        var a : [Item] = []
        //m = HTTP Get All Animes
        a.append(Item(itemId: Int64(1), itemTitle: "Naruto Shippidden", itemDesc: "Naruto Shippidde", itemRating: 10, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        self.animes = a
        
    }
    func getAllSeries() {
        var s : [Item] = []
        //m = HTTP Get All Series
        s.append(Item(itemId: Int64(1), itemTitle: "Silicon Valley", itemDesc: "Silicon Valley", itemRating: 3, itemImage: "Test", itemMediaURL: "http://esioslive6-i.akamaihd.net/hls/live/202892/AL_P_ESP1_FR_FRA/playlist.m3u8", itemType: "Test"))
        self.series = s
        
    }
    
}
