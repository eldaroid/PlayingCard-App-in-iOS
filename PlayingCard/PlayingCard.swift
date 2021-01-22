//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Эльдар Попов on 21.01.2021.
//

import Foundation

struct PlayingCard: CustomStringConvertible
{
    var description: String { return "\(rank)\(suit)" }
    
    var suit: Suit
    var rank: Rank
    
     // For Swift 4.2 use protocol CaseIterable let use allCases
    enum Suit: String, CaseIterable, CustomStringConvertible {
        case spades = "♠️"
        case hearts = "❤️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        var description: String { return rawValue }
    }
    
    enum Rank: CustomStringConvertible {
        var description: String {
            switch self {
            case .ace: return "A"
            case .numeric(let pips): return String(pips)
            case .face(let kind): return kind
            }
        }
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"),.face("Q"),.face("K")]
            return allRanks
        }
    }
}

//struct PlayingCard{
//    var suit: Suit
//    var rank: Rank
//
//    enum Suit: String {
//        case spades = "♠️"
//        case hearts = "♥️"
//        case diamonds = "♦️"
//        case clubs = "♣️"
//
//        static var all = [Suit.spades, .clubs, .diamonds, .hearts]
//    }
//
//
//    enum Rank {
//        case aсe
//        case face(String)
//        case numeric(Int)
//
//        var order: Int {
//            switch self {
//                case .aсe: return 1
//                case .numeric(let pips): return pips
//                case .face(let kind) where kind == "J": return 11
//                case .face(let kind) where kind == "Q": return 12
//                case .face(let kind) where kind == "K": return 13
//                default: return 0
//            }
//        }
//
//        static var all: [Rank] {
//            var allRank = [Rank.aсe]
//            for pips in 2...10 {
//                allRank.append(Rank.numeric(pips))
//            }
//            allRank += [Rank.face("J"), Rank.face("Q"), Rank.face("K")]
//            return allRank
//        }
//    }
//}
