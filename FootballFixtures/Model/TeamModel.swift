//
//  TeamModel.swift
//  FootballFixtures
//
//  Created by Longzhu on 08/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

/// Model object for **team**.
/// * Fields should be mapped to item of teams in 'teams.json'.
/// * Extends Codable for JSON serializable.
class TeamModel: Codable {
    
    /// Name of team.
    var name: String = ""
}
