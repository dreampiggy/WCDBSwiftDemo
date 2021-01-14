//
//  ViewController.swift
//  WCDBSwiftDemo
//
//  Created by 李卓立 on 2021/1/14.
//

import UIKit
import WCDBSwift

enum SampleORMType: Int, ColumnCodable {
    case type1 = 1
    case type2 = 2
    
    static var columnType: ColumnType {
        return .integer64
    }
    
    init?(with value: FundamentalValue) {
        guard let object = SampleORMType(rawValue: Int(truncatingIfNeeded: value.int64Value)) else {
            return nil
        }
        self = object
    }
    
    func archivedValue() -> FundamentalValue {
        return FundamentalValue(Int64(self.rawValue))
    }
}

class SampleORM: TableCodable {
    var identifier: Int = 0
    var desc: String = "nil"
    var value: Double = 0
    var timestamp: String?
    var type: SampleORMType?
    enum CodingKeys: String, CodingTableKey {
        typealias Root = SampleORM
        static let objectRelationalMapping = TableBinding(CodingKeys.self)
        case identifier
        case desc
        case value
        case timestamp
        case type
        static var columnConstraintBindings: [CodingKeys: ColumnConstraintBinding]? {
            return [
                .identifier: ColumnConstraintBinding(isPrimary: true),
                .value: ColumnConstraintBinding(defaultTo: 1.0),
                .timestamp: ColumnConstraintBinding(defaultTo: .currentTimestamp)
            ]
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

