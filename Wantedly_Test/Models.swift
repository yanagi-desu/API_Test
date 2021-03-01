//
//  Models.swift
//  Wantedly_Test
//
//  Created by Bofan Yang on 2021/03/01.
//

import Foundation

struct jobData: Codable, Identifiable{
    
//    struct Image_url: Codable{
//        var url:String
//    }
    var id: Int
    var title: String
    var published_at: String
    var support_count: Int
    var page_view: Int
    var candidate_count: Int
    var location: String
    var location_suffix: String
    var description: String
    var looking_for: String
    
    var image:[String:String?]
    var company: Company
    
    var staffings_count:Int
}

struct Company: Codable {
    var id: Int
    var name: String
    var founder: String
    var founded_on: String
    var payroll_number: Int
    var address_prefix: String
    var address_suffix: String
    var latitude: Float
    var longitude: Float
    var url: String
    var font_color_code: String
    var avatar:[String:String]
}

struct Results: Codable{
    var data: [jobData]
}
