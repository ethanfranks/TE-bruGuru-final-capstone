BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;
DROP TABLE IF EXISTS favorite_beers;
DROP TABLE IF EXISTS favorite_breweries;
DROP TABLE IF EXISTS favorite_beers;
DROP TABLE IF EXISTS brewery_reviews;
DROP TABLE IF EXISTS beer_reviews;
DROP TABLE IF EXISTS beers;
DROP TABLE IF EXISTS breweries;


CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

CREATE TABLE breweries (
	brewery_id SERIAL NOT NULL,
	brewery_name varchar(100) NOT NULL,
	email varchar(100),
	phone varchar(50),
	ig_link varchar(100),
	fb_link varchar(100),
	about_us varchar(3000),
	hours_of_operation varchar(1000),
	img_url varchar(1000),
	street_address varchar(500),
	gps_coords varchar(100),
	food_available boolean,
	CONSTRAINT PK_brewery PRIMARY KEY (brewery_id)

);

INSERT INTO breweries (brewery_name,email,phone,ig_link,fb_link,about_us,hours_of_operation,img_url,street_address,gps_coords,food_available)
VALUES ('Big Elk River Brewing Co','BigElkBeer@fakeemail.com','555-666-7777','https://www.instagram.com/BigElkBeer/','https://www.Facebook.com/BigElkBeer','Test description for a fake brewery! Big Elk ipso lorum yadda yadda', 
'Tuesday-Sunday 11:30am - 1:00am', 'https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '123 Main St. Noel, MO. 64854', 'Latitude: 36.601856 / N 36° 36'' 6.682, Longitude: -94.447206 / W 94° 26'' 49.943''', true);

CREATE TABLE beers (
	beer_id SERIAL,
	beer_name varchar(50) NOT NULL,
	beer_description varchar(300),
	beer_abv numeric(2,1),
	beer_style varchar(50) NOT NULL,
	image_url varchar(300),
	flavor_profile varchar(300),
	brewery_id int,
	CONSTRAINT PK_beers PRIMARY KEY (beer_id),
	CONSTRAINT FK_beers FOREIGN KEY (brewery_id) REFERENCES breweries(brewery_id)
);

INSERT INTO beers (beer_name,beer_description,beer_abv,beer_style,flavor_profile,image_url,brewery_id)
VALUES ('Big Elk Brown Ale', 'Our brown ale is made from the finest brown ale stuff money can buy',6.3,'Ale','Nutty,Smooth,Mild','https://www.shutterstock.com/image-vector/craft-beer-ads-exquisite-bottled-3d-1018235908',1);


CREATE TABLE beer_reviews (
	beer_review_id SERIAL,
	beer_id int NOT NULL,
	user_id int NOT NULL,
	beer_review varchar(1000) NOT NULL,
	beer_rating int NOT NULL,
	brewery_id int NOT NULL,
	CONSTRAINT PK_beer_reviews PRIMARY KEY (beer_review_id),
	CONSTRAINT FK_beer_review_user FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT FK_beer_review_beer_id FOREIGN KEY (beer_id) REFERENCES beers(beer_id)
	
);

INSERT INTO beer_reviews (beer_id,user_id,beer_review,beer_rating,brewery_id)
VALUES (1,1,'Superb! Made with bits of real Elk, so you know it''s good!',5,1);

CREATE TABLE brewery_reviews (
	brewery_review_id SERIAL,
	brewery_review varchar(2000) NOT NULL,
	brewery_rating int NOT NULL,
	user_id int NOT NULL,
	brewery_id int NOT NULL,
	CONSTRAINT PK_brewery_reviews PRIMARY KEY (brewery_review_id),
	CONSTRAINT FK_brewery_reviews_brewery_id FOREIGN KEY (brewery_id) REFERENCES breweries(brewery_id),
	CONSTRAINT FK_brewery_reviews_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO brewery_reviews (brewery_review,brewery_rating,user_id,brewery_id)
VALUES ('Love this place! A local favorite for over 20 years.', 5,1,1);

COMMIT TRANSACTION;
