DROP DATABASE IF EXISTS project;
CREATE DATABASE project;

use project;

CREATE TABLE users
(
   user_id int PRIMARY KEY auto_increment,
   user_name varchar(45) not null,
   user_email varchar(105) not null
)
ENGINE = InnoDB
;

CREATE Table club 
(
  club_name varchar(45) PRIMARY KEY,
  nickname varchar(45) NOT NULL,
  found_date date NOT NULL,
  home_ground varchar(45) NOT NULL,
  location varchar(45) NOT NULL
)
ENGINE = InnoDB
;

CREATE TABLE player
(  
   player_id int PRIMARY KEY auto_increment,
   player_name varchar(45) ,
   height int NOT NULL,
   weight int NOT NULL,
   age int NOT NULL,
   birth_date date NOT NULL,
   market_value int NOT NULL,
   player_position varchar(55)
)
ENGINE = InnoDB
;

CREATE TABLE contract
(  
   contract_id int PRIMARY KEY auto_increment,
   contract_club varchar(45) NOT NULL,
   contract_player int not null,
   CONSTRAINT contract_fk_club
    FOREIGN KEY (contract_club) REFERENCES club (club_name),
   CONSTRAINT contract_fk_player
    FOREIGN KEY (contract_player) REFERENCES player (player_id),
   expiration date NOT NULL
)
ENGINE = InnoDB
;

CREATE TABLE game
( 
  game_id int PRIMARY KEY AUTO_INCREMENT,
  game_home varchar(45) not null,
  game_guest varchar(45) not null,
  CONSTRAINT game_fk_home
    FOREIGN KEY (game_home) REFERENCES club (club_name),
  CONSTRAINT game_fk_guest
    FOREIGN KEY (game_guest) REFERENCES club (club_name),
  game_date date NOT NULL,
  result varchar(45) NOT NULL
)
ENGINE = InnoDB
;

CREATE TABLE event
(  
   event_id int PRIMARY KEY auto_increment,
   event_player int not null,
   event_game int not null,
   CONSTRAINT event_fk_player
    FOREIGN KEY (event_player) REFERENCES player (player_id),
   CONSTRAINT event_fk_game
    FOREIGN KEY (event_game) REFERENCES game (game_id),
   event_date date NOT NULL,
   data_type ENUM('goal', 'yellow card','red card', 'injury')
)
ENGINE = InnoDB
;



  
CREATE TABLE comments
(
   comments_id int PRIMARY KEY Auto_increment,
   comments_game int not null,
   comments_user int not null,
   CONSTRAINT comments_fk_game
    FOREIGN KEY (comments_game) REFERENCES game (game_id),
   CONSTRAINT comments_fk_user
    FOREIGN KEY (comments_user) REFERENCES users (user_id),
   user_comment varchar(45)
)
ENGINE = InnoDB
; 
   
CREATE TABLE follows
(  
   follows_id int PRIMARY KEY auto_increment,
   follows_club varchar(45) not null,
   follows_user int not null,
   CONSTRAINT follows_fk_user
    FOREIGN KEY (follows_user) REFERENCES users (user_id),
   CONSTRAINT follows_fk_club
    FOREIGN KEY (follows_club) REFERENCES club (club_name)
)
ENGINE = InnoDB
;

CREATE TABLE ratings
(  
   ratings_id int PRIMARY KEY auto_increment,
   ratings_user int not null,
   ratings_player int not null,
   CONSTRAINT ratings_fk_user
    FOREIGN KEY (ratings_user) REFERENCES users (user_id),
   CONSTRAINT ratings_fk_club
    FOREIGN KEY (ratings_player) REFERENCES player (player_id),
   rating_comment varchar(105) NOT NULL
)
ENGINE = InnoDB
;

