//
//  FixtureModel.swift
//  FootballFixtures
//
//  Created by Longzhu  on 07/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

//  Model object for fixture
class FixtureModel {
    
    /// Home team information based on TeamModel object.
    var homeTeam = TeamModel.init()
    
    /// Away team information based on TeamModel object.
    var awayTeam = TeamModel.init()
    
    init(home: TeamModel, away: TeamModel) {
        self.homeTeam = home
        self.awayTeam = away
    }
}
