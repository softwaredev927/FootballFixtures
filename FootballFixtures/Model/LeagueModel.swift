//
//  LeagueModel.swift
//  FootballFixtures
//
//  Created by Longzhu on 07/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

/// Model object for **league**.
/// * Fields should be mapped to 'teams.json'.
/// * Extends Codable for JSON serializable.
class LeagueModel: Codable {
    
    /// Name of league.
    var league: String
    
    /// Name of season.
    var season: String
    
    /// Season start date in 'yyyy-MM-dd' format.
    var start: String
    
    /// Season end date in 'yyyy-MM-dd' format.
    var end: String
    
    /// Array of teams based TeamModel.
    var teams: [TeamModel]
}
