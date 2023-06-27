    -- List of psql commands 
    -- Done to ensure no errors are made
    
    CREATE DATABASE gamedb

    CREATE TABLE players(
        player_id SERIAL PRIMARY KEY,
        player_name text,
        rank text,
        level_name text
    )

    CREATE TABLE scores(
        score_id SERIAL PRIMARY KEY,
        score integer,
        player_name text
    )

    CREATE TABLE level(
        level_id SERIAL PRIMARY KEY,
        level_name text,
        difficulty text,
        player_name text
    )

    CREATE TABLE role(
        role_id SERIAL PRIMARY KEY,
        role_name text,
        player_name text
    );

    INSERT INTO players (player_name, rank, level_name) values
    ('vics', 'diamond', 'desert');

    INSERT INTO scores (score, player_name) values ('150000', 'vics');
    INSERT INTO scores (score, player_name) values ('7890', 'zero23');
    INSERT INTO scores (score, player_name) values ('36000', 'blox23');
    INSERT INTO scores (score, player_name) values ('999999', 'x_edgelord_x');


    INSERT INTO level (level_name, difficulty, player_name) values ('desert', 'expert', 'vics' );
    INSERT INTO level (level_name, difficulty, player_name) values ('training', 'easy', 'x_edgelord_x' );
    INSERT INTO level (level_name, difficulty, player_name) values ('castle', 'medium', 'blox23' );
    INSERT INTO level (level_name, difficulty, player_name) values ('space', 'master', 'godhand' );

    INSERT INTO role (role_name, player_name) values ('Ranged-DPS', 'vics');
    INSERT INTO role (role_name, player_name) values ('Tank', 'blox23');
    INSERT INTO role (role_name, player_name) values ('Melee-DPS', 'x_edgelord_x');
    INSERT INTO role (role_name, player_name) values ('Healer', 'godhand');

    -- Inner join

    SELECT * FROM players A
    INNER JOIN level B ON A.level_name=B.level_name;

    SELECT * FROM players A
    INNER JOIN role B ON A.player_name = B.player_name
    INNER JOIN level C ON A.player_name = C.player_name
    INNER JOIN scores D ON A.player_name = D.player_name;