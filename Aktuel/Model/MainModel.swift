//
//  MainModel.swift
//  Aktuel
//
//  Created by Turan Çabuk on 28.11.2022.
//

import Foundation

// MARK: - Aktuel
struct Aktuel: Codable {
    let meta: Meta?
    let payload: Payload?
    let pagination: Pagination?
    let filters: Filters?
    let head: Head?
}

// MARK: - Filters
struct Filters: Codable {
    let order: [String]?
    let brand, minPrice, maxPrice: String?

    enum CodingKeys: String, CodingKey {
        case order, brand
        case minPrice
        case maxPrice
    }
}

// MARK: - Head
struct Head: Codable {
    let title, headDescription, image, slug: String?

    enum CodingKeys: String, CodingKey {
        case title
        case headDescription
        case image, slug
    }
}

// MARK: - Meta
struct Meta: Codable {
    let messages: Messages?
}

// MARK: - Messages
struct Messages: Codable {
    let success, warning, error: [JSONAny]?
}

// MARK: - Pagination
struct Pagination: Codable {
    let schema: String?
    let page, pageCount, limit, total: Int?

    enum CodingKeys: String, CodingKey {
        case schema, page
        case pageCount
        case limit, total
    }
}

// MARK: - Payload
struct Payload: Codable {
    let products: [Product]?
    let categories: Categories?
}

// MARK: - Categories
struct Categories: Codable {
    let children: [JSONAny]?
    let parent: Parent?
}

// MARK: - Parent
struct Parent: Codable {
}

// MARK: - Product
struct Product: Codable {
    let rank: Int?
    let listView: ListView?
    let categoryid: Int?
    let productDescription: String?
    let addBasketOption, addBasketSize, addBasketStatus: Int?
    let brand: String?
    let madein: String?
    let id, serialID: Int?
    let serialTitle: SerialTitle?
    let price: Price?
    let slug: String?
    let vatRatio: String?
    let slogan: String?
    let basketUpdateDisable: Bool?
    let visitCount, giftStatus: Int?
    let productCode: String?
    let giftPackStatus: Int?
    let exclusive: Bool?
    let information: String?
    let createdAt: String?
    let orderAddBasketStatus, addBasketDefaultOption: Int?
    let basketIncreaseSize: String?
    let productGroupIdentity, productSerialIdentity: JSONNull?
    let minBasketAddAmount, maxBasketAddAmount, barcode: String?
    let kindName: JSONNull?
    let quantity, cargoDay, installmentStatus: Int?
    let installmentDescriptionMobile: String?
    let fixStatus: Int?
    let title: String?
    let discountRatio: Double?
    let isDiscounted, isStoreRequired, hasMultipleUnits: Bool?
    let productName: String?
    let cargoPrice, oldPrice: Price?
    let categoryBreadcrumb: String?
    let isInFavorite: Bool?
    let favoriteItemID: Int?
    let isInWishlist: Bool?
    let basketQuantity: Int?
    let images: [Image]?
    let imageTypes: ImageTypes?
    let units: Units?
    let campaign: Campaign?

    enum CodingKeys: String, CodingKey {
        case rank
        case listView
        case categoryid
        case productDescription
        case addBasketOption
        case addBasketSize
        case addBasketStatus
        case brand, madein, id
        case serialID
        case serialTitle
        case price, slug
        case vatRatio
        case slogan
        case basketUpdateDisable
        case visitCount
        case giftStatus
        case productCode
        case giftPackStatus
        case exclusive, information
        case createdAt
        case orderAddBasketStatus
        case addBasketDefaultOption
        case basketIncreaseSize
        case productGroupIdentity
        case productSerialIdentity
        case minBasketAddAmount
        case maxBasketAddAmount
        case barcode
        case kindName
        case quantity
        case cargoDay
        case installmentStatus
        case installmentDescriptionMobile
        case fixStatus
        case title
        case discountRatio
        case isDiscounted
        case isStoreRequired
        case hasMultipleUnits
        case productName
        case cargoPrice
        case oldPrice
        case categoryBreadcrumb
        case isInFavorite
        case favoriteItemID
        case isInWishlist
        case basketQuantity
        case images
        case imageTypes
        case units, campaign
    }
}

// MARK: - Campaign
struct Campaign: Codable {
    let id: Int?
    let name, campaignDescription, discountAmount, discountPercent: String?
    let typeID: Int?
    let typeName: TypeName?
    let relationid: Int?
    let price: Price?
    let conditionText: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, name
        case campaignDescription
        case discountAmount
        case discountPercent
        case typeID
        case typeName
        case relationid, price
        case conditionText
    }
}

// MARK: - Price
struct Price: Codable {
    let original: Double?
    let originalStr: String?
    let whole: Int?
    let wholeStr, fraction, fractionStr: String?
    let currency: Currency?
    let currencySymbol: CurrencySymbol?
    let decimalSeperator: DecimalSeperator?
    let thousandsSeparator: ThousandsSeparator?

    enum CodingKeys: String, CodingKey {
        case original
        case originalStr
        case whole
        case wholeStr
        case fraction
        case fractionStr
        case currency
        case currencySymbol
        case decimalSeperator
        case thousandsSeparator
    }
}

enum Currency: String, Codable {
    case tl = "TL"
}

enum CurrencySymbol: String, Codable {
    case empty = "₺"
}

enum DecimalSeperator: String, Codable {
    case empty = ","
}

enum ThousandsSeparator: String, Codable {
    case empty = "."
}

enum TypeName: String, Codable {
    case the25TLÜzeriIndirimli = "25 TL üzeri indirimli"
}

// MARK: - ImageTypes
struct ImageTypes: Codable {
    let mini, thumbnail, original: String?
}

// MARK: - Image
struct Image: Codable {
    let id, productid, productSerialid: Int?
    let url: String?
    let type: Int?
    let title: JSONNull?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case id, productid
        case productSerialid
        case url, type, title, order
    }
}

enum ListView: String, Codable {
    case productFilter = "product_filter"
}

enum SerialTitle: String, Codable {
    case empty = "-"
}

// MARK: - Units
struct Units: Codable {
    let title: Title?
    let isInBasket, isDefault: Bool?
    let availableQuantity, basketQuantity: Int?
    let basketPrice: Price?

    enum CodingKeys: String, CodingKey {
        case title
        case isInBasket
        case isDefault
        case availableQuantity
        case basketQuantity
        case basketPrice
    }
}

enum Title: String, Codable {
    case adet = "Adet"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
