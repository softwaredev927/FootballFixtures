//
//  FixturesVC.swift
//  FootballFixtures
//
//  Created by Longzhu on 07/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import UIKit

/// View Controller to show **fixtures**.
/// * Extends UITableViewDataSource to show fixtures in UITableView.
/// * Extends UITableViewDelegate to customize header label.
/// * Should connect datasource & delegate of UITableView control to this object in storyboard.
class FixturesVC :  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /// **Title** of league including league name and season.
    /// * Should be connected in storyboard with UILabel control.
    @IBOutlet weak var leagueTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        /// Init title of league.
        leagueTitle.text = LeagueManager.instance()?.getLeagueTitle()
    }
    
    /// Return number of available dates.
    func numberOfSections(in tableView: UITableView) -> Int {
        // Return available dates by getting from LeagueManager.
        return LeagueManager.instance()?.getAvailableDatesCount() ?? 0
    }
    
    /// Return date string placing on header of label.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let df = DateFormatter.init()
        // Get date at section-th position from LeagueManager.
        guard let dt = LeagueManager.instance()?.getAvaialbeDateAt(pos: section) else {
            return "Error"
        }
        // Convert date format from 'yyyy-MM-dd' to 'd MMM yyyy'.
        df.dateFormat = "yyyy-MM-dd"
        guard let date = df.date(from: dt) else {
            return "Parse-Error"
        }
        df.dateFormat = "MMM d yyyy"
        return df.string(from: date)
    }
    
    /// Customize header label to center align.
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textAlignment = NSTextAlignment.center
    }

    /// Return number of scheduled matches in section-th date.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LeagueManager.instance()?.getFixturesAt(pos: section).count ?? 0
    }
    
    /// Return cell for match at indexPath.row-th & indexPath.section-th date.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// Cell dequeued from stroybard.
        /// * In storyboard set identifier of fixture cell as 'fixture_cell'.
        let cell = tableView.dequeueReusableCell(withIdentifier: "fixture_cell") as! FixtureCell
        if let fixture = LeagueManager.instance()?.getFixturesAt(pos: indexPath.section) {
            cell.homeTeamName.text = fixture[indexPath.row].homeTeam.name
            cell.awayTeamName.text = fixture[indexPath.row].awayTeam.name
        }
        return cell
    }

}

/// The object to customize fixture cell of fixtures' table view.
/// * In storyboard, set customize class of fixture cell with this.
class FixtureCell: UITableViewCell {
    
    /// The **home team** label - should be connected in stroyboard.
    @IBOutlet weak var homeTeamName: UILabel!
    
    /// The **away team** label - should be connected in stroyboard.
    @IBOutlet weak var awayTeamName: UILabel!
    
}
