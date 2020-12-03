//
//  Post.swift
//  iglistkityogi
//
//  Created by mingyu beom on 2020/11/30.
//

import Foundation
import ObjectMapper
import IGListDiffKit
import SwiftDate


class Post: Mappable, ListDiffable, CustomDebugStringConvertible {
    //object >. CustomDebugStringConvertible issue
    var id: Int!
    var selectedDate: Date!
    var photos: [String] = [] //Not image:  count == 1 && photos[0] = ""
    var memo: String? = nil
    var tags: [String]
    
    //Array[String] to Strings
    var oneHashTags: String {
        get {
            return tags.map{ "#"+$0 }.joined(separator: " ")
        }
    }
    
    func getHashTags() -> [String]{
        return tags.map{"#"+$0}
    }
    
    var debugDescription: String {
        return "empty"
    }
    
    init(id: Int, selectedDate: Date, photos:[String],memo: String, tags: [String]) {
        self.id = id
        self.selectedDate = selectedDate
        self.memo = memo
        self.tags = tags
        self.photos = photos
    }
    
    required convenience init?(map: Map) {
        self.init(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        selectedDate <- (map["selectedDate"], ISODateTransform())
        photos <- map["photos"]
        memo <- map["memo"]
        tags <- map["tags"]
    }
    
    //ListDiffable
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSNumber
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Post else { return false }
        return self.id == object.id && self.memo == object.memo && self.tags == object.tags && self.selectedDate == object.selectedDate && self.photos == object.photos
    }
    //ListDiffable end
}


open class ISODateTransform: TransformType {
    public typealias Object = Date
    public typealias JSON = String

    public init() {
    }

    public func transformFromJSON(_ value: Any?) -> Date? {
        guard let datestring = value as? String else { return nil }


        return datestring.toDate(region: Region.current)?.date
    }

    public func transformToJSON(_ value: Date?) -> String? {
        let isoFormatter = ISO8601DateFormatter()
        let string = isoFormatter.string(from: value!)

        return string
    }
}
