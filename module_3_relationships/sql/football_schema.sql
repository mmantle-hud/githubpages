DROP TABLE IF EXISTS matches;

DROP TABLE IF EXISTS teams;

CREATE TABLE teams(
    team_id INT GENERATED ALWAYS AS IDENTITY,
    team_name VARCHAR(255) UNIQUE NOT NULL,
    CONSTRAINT pk_teams PRIMARY KEY (team_id)
);

CREATE TABLE matches(
    match_id INT GENERATED ALWAYS AS IDENTITY,
    match_date TIMESTAMP,
    home_team_id INT NOT NULL,
    away_team_id INT NOT NULL,
    home_team_score SMALLINT NOT NULL,
    away_team_score SMALLINT NOT NULL,
    CONSTRAINT pk_matches PRIMARY KEY(match_id),
    CONSTRAINT fk_matches_teams_home FOREIGN KEY (home_team_id) REFERENCES teams (team_id),
    CONSTRAINT fk_matches_teams_away FOREIGN KEY (away_team_id) REFERENCES teams (team_id),
    CONSTRAINT chk_different_teams CHECK (home_team_id <> away_team_id),
    CONSTRAINT home_team_score CHECK (home_team_score >= 0),
    CONSTRAINT away_team_score CHECK (away_team_score >= 0)
);