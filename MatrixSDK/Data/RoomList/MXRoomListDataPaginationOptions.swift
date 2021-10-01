// 
// Copyright 2021 The Matrix.org Foundation C.I.C
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

public enum MXRoomListDataPaginationOptions {
    public typealias RawValue = Int
    
    private static let NoneValue: RawValue = -1
    private static let DefaultValue: RawValue = 10
    
    public init(rawValue: RawValue) {
        switch rawValue {
        case Self.NoneValue:
            self = .none
        case Self.DefaultValue:
            self = .default
        default:
            self = .custom(rawValue)
        }
    }
    
    public var rawValue: RawValue {
        switch self {
        case .none:
            return Self.NoneValue
        case .default:
            return Self.DefaultValue
        case .custom(let value):
            return value
        }
    }
    
    case none
    case `default`
    case custom(_ value: Int)
}

extension MXRoomListDataPaginationOptions: Equatable {
    public static func ==(lhs: MXRoomListDataPaginationOptions, rhs: MXRoomListDataPaginationOptions) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
