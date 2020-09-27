//
//  ListEntity.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import Foundation

final class List : Codable {
    
    let data: DataListItems?
    let errors : [ErrorsList]?
    let requestId : String?
    let stack : String?
    
    private enum CodingKeys: String, CodingKey {
        case data
        case errors
        case requestId
        case stack
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try? container.decode(DataListItems.self, forKey: .data)
        errors = try? container.decode([ErrorsList].self, forKey: .errors)
        requestId = try? container.decode(String.self, forKey: .requestId)
        stack = try? container.decode(String.self, forKey: .stack)
    }
}

final class ErrorsList : Codable {
    
    let orderBy : String?
    
}

final class DataListItems : Codable {
    
    var items :  [ItemsList]?
    let cursor : String?
    
    private enum CodingKeys: String, CodingKey {
        case items
        case cursor
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try? container.decode([ItemsList].self, forKey: .items)
        cursor = try? container.decode(String.self, forKey: .cursor)
    }
}

final class ItemsList : Codable {
    
    let id : String?
    var replyOnPostId : Int?
    let type : String?
    let status : String?
    let hidingReason : String?
    let coordinates : CoordinatesList?
    let isCommentable : Bool?
    let hasAdultContent : Bool?
    let isAuthorHidden : Bool?
    let isHiddenInProfile : Bool?
    let contents : [ContentsList]?
    let language : String?
    let awards : AwardsList?
    let createdAt : Int?
    let updatedAt : Int?
    let page : String?
    let author : AuthorList?
    let stats : StatsList?
    let isMyFavorite : Bool?
    
}

final class CoordinatesList : Codable {
    
    let latitude : Double?
    let longitude : Double?
    let zoom : String?
    
}

final class ContentsList : Codable {
    
    var type : String?
    let id : String?
    let data : DataListContents?
    
}

final class AwardsList : Codable {
    
    let recent : [String]?
    let statistics : [String]?
    let voices : Int?
    let awardedByMe : Bool?
    
    private enum CodingKeys: String, CodingKey {
        case recent
        case statistics
        case voices
        case awardedByMe
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recent = try? container.decode([String].self, forKey: .recent)
        statistics = try? container.decode([String].self, forKey: .statistics)
        voices = try? container.decode(Int.self, forKey: .voices)
        awardedByMe = try? container.decode(Bool.self, forKey: .awardedByMe)
    }
}

final class AuthorList : Codable {
    
    let id : String?
    let url : String?
    let name : String?
    let banner : BannerListAuthor?
    let photo : BannerListAuthor?
    let gender : String?
    var isHidden : Bool?
    let isBlocked : Bool?
    let isMessagingAllowed : Bool?
    let auth : AuthListAuthor?
    let statistics : StatisticsListAuthor?
    let tagline : String?
    let data : DataAuthor?
    
}

final class StatsList : Codable {
    
    let likes : ListStatsValue?
    let views : ListStatsValue?
    let comments : ListStatsValue?
    let shares : ListStatsValue?
    let replies : ListStatsValue?
    let timeLeftToSpace : ListStatsValue?
    
}

final class DataListContents : Codable {
    
    let extraSmall : DataBannerListValue?
    let small : DataBannerListValue?
    let medium : DataBannerListValue?
    let original : DataBannerListValue?
    let value : String?
    let values : [String]?
}

final class BannerListAuthor : Codable {
    
    let type : String?
    let id : String?
    let data : DataListContents?
    
}

final class AuthListAuthor : Codable {
    
    let rocketId : String?
    let isDisabled : Bool?
    let level : Int?
}

final class StatisticsListAuthor : Codable {
    
    let likes : Int?
    let thanks : Int?
    let uniqueName : Bool? 
    let thanksNextLevel : Int?
}

final class DataAuthor : Codable {
    
}

final class ListStatsValue : Codable {
    
    let count : Int?
    let my : Bool?
    
}

final class DataBannerListValue : Codable {
    
    let url : String?
    let size : SizeBannerListValue?
    
}

final class SizeBannerListValue : Codable {
    
    let width : Int?
    let height : Int?
    
}
