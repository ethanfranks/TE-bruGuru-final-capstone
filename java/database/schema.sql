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
INSERT INTO users (username,password_hash,role) VALUES ('dave','$2a$10$5Z8FuX3eXmGDWRklDRDwlempKvhzpmzAW8HW66uI8.4/fcwjGDoK.','ROLE_ADMIN,ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('taylor','$2a$10$9ozIJQwk4ItwCu4fPcCyn.gXC6O7XGzZprbwnu7UURBrJx/E8s86m','ROLE_ADMIN,ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('chris','$2a$10$hRhH/GnAVxWjGt38yoc9SeEn90GVeITUdcrELNoiCKAvBYmsOGx7K','ROLE_ADMIN,ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('ethan','$2a$10$JkpBZ5cB.7FcoXlLEJX7m.QuzIgnfwjNQqBreyrK55CmFXCIZw6Xi','ROLE_ADMIN,ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('brew1','$2a$10$fDXenuinB9..4zrx.n.EfeYF3dnDiIOaCaG9DlWzvlwtFUal92OEm','ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('brew2','$2a$10$52AWblXeFGiQpZ7TzpBNQehYEQdq/.0Hs9BlUSTXAB6y1bQYWPx0y','ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('brew3','$2a$10$teZH2BXbkNjOiPhdFAcZZORlBMHkHTjxNhfZL5lMUwhEz.SWF91CG','ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('brew4','$2a$10$xjYy4jWeggFgoHH6ExNZ3.x2YsP4sCdBbU35Ks3jzPy5DjiSsDMKO','ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('brew5','$2a$10$VzbFSpezTSgu1EcctCp9m.5LHkAkC1eT497VSsT.DYvsRMbRBjpVy','ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('brew6','$2a$10$s2RHMqzmNk3bcXvmrTP8x.WgMZcurhsqU/4KuRx3xAhjt1Jt5Iwji','ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('brew7','$2a$10$dU3T7OW7KkfqwaiDV5O.1..2tMwxG.S9qksNHsxTij/TcKl36W1OC','ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('brew8','$2a$10$DmWhN0rLhCc5y2byou6R8.eQZlEm0DJxhyQDqxQjwSOuJzxOuYIta','ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('brew9','$2a$10$/bbnEE0TtdveEngUEr/4S.RKKINhSptKfyAVLItkamSA6xoUOlO/G','ROLE_BEER LOVER,ROLE_BREWER');
INSERT INTO users (username,password_hash,role) VALUES ('brew10','$2a$10$PYNyqB7cG6Q.DWUr6Wpao.2qWss3n48LY5ttp9WPyEBvgHvoduSG.','ROLE_BEER LOVER,ROLE_BREWER');
CREATE TABLE breweries (
    brewery_id SERIAL NOT NULL,
    user_id int NOT NULL,
    brewery_name varchar(100) NOT NULL,
    email varchar(100),
    phone varchar(50),
    ig_link varchar(100),
    fb_link varchar(100),
    about_us varchar(3000),
    sunday_hours varchar(50),
    monday_hours varchar(50),
    tuesday_hours varchar(50),
    wednesday_hours varchar(50),
    thursday_hours varchar(50),
    friday_hours varchar(50),
    saturday_hours varchar(50),
    img_url varchar(1000),
    street_address varchar(500),
    gps_lat numeric(10,7),
    gps_lng numeric(10,7),
    googlePlaceId varchar(200),
    food_available boolean,
    CONSTRAINT PK_brewery PRIMARY KEY (brewery_id),
    CONSTRAINT FK_brewery FOREIGN KEY (user_id) REFERENCES users(user_id)
);
INSERT INTO breweries (brewery_name,user_id,email,phone,ig_link,fb_link,about_us,sunday_hours,monday_hours,tuesday_hours,wednesday_hours,thursday_hours,friday_hours,saturday_hours,img_url,street_address,gps_lat,gps_lng,googlePlaceId,food_available)
VALUES ('Big Elk River Brewing Co',16,'BigElkBeer@fakeemail.com','555-666-7777','https://www.instagram.com/BigElkBeer/','https://www.Facebook.com/BigElkBeer','Test description for a fake brewery! Big Elk ipso lorum yadda yadda',
'11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '123 Main St. Noel, MO. 64854', '36.601856', '-94.447206','', true), (
'Mirror Twin Brewing',7,'info@mirrortwinbrewing.com','555-666-7777','https://www.instagram.com/mirror/','https://www.Facebook.com/mirrortwin','Test description for a fake brewery! mirrrro twin ipso lorum yadda yadda',
 '11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '725 National Ave, Lexington, KY 40502', '38.0404142', '-84.4784980','ChIJP8XQkB9FQogRlFMT5O3ezIc', false),(
 'New District Brewing Company',13,'newdistrict@fakeemail.com','555-666-7777','https://www.instagram.com/newdistrict/','https://www.Facebook.com/newdistrict','Test description for a fake brewery! newdistrict ipso lorum yadda yadda',
  '11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '901 N Glebe Rd #105, Arlington, VA 22203', '38.8814934', '-77.1153352','ChIJRYKNITu0t4kRReaVLyxsr3s', true),(
  'Board Room Brewing Company',8,'boardroom@fakeemail.com','555-666-7777','https://www.instagram.com/BigElkBeer/','https://www.Facebook.com/BigElkBeer','Test description for a fake brewery! Big Elk ipso lorum yadda yadda',
    '11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '925 N Garfield St, Arlington, VA 22201', '38.8838800', '-77.0932289','ChIJf2KjD4W2t4kRKlxzoY6Y8zs', false),(
    'Crafthouse Arlington',14,'crafthouse@fakeemail.com','555-666-7777','https://www.instagram.com/crafthouse/','https://www.Facebook.com/crafthouse','Test description for a fake brewery! crafthouse ipso lorum yadda yadda',
    '11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '901 N Glebe Rd #105, Arlington, VA 22203', '38.8814934', '-77.1153352','ChIJRYKNITu0t4kRReaVLyxsr3s', true), (
    'The Brew Shop',15,'brewshop@fakeemail.com','555-666-7777','https://www.instagram.com/brewshop/','https://www.Facebook.com/brewshop','Test description for a fake brewery! Brewshop ipso lorum yadda yadda',
'11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '2004 Wilson Blvd, Arlington, VA 22201',  '38.8921709', '-77.0822744','-77.0822744', true),(
 'Meridian Pint',9,'meridian@fakeemail.com','555-666-7777','https://www.instagram.com/meridian/','https://www.Facebook.com/meridian','Test description for a fake brewery! meridian ipso lorum yadda yadda',
'11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '6035 Wilson Blvd, Arlington, VA 22205', '38.8739519', '-77.1405619','ChIJfXZE-2a0t4kRvJrVkYu9C0s', true),(
'Nighthawk Brewery & Pizza',10,'nighthawk@fakeemail.com','555-666-7777','https://www.instagram.com/nighthawk/','https://www.Facebook.com/nighthawk','Test description for a fake brewery! nighthawk ipso lorum yadda yadda',
'11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '1201 S Joyce St C10, Arlington, VA 22202', '38.8635402', '-77.0632430','Ei0xMjAxIFMgSm95Y2UgU3QgYzEwLCBBcmxpbmd0b24sIFZBIDIyMjAyLCBVU0EiHxodChYKFAoSCWNf3v7btreJEQTEP5XW9eFhEgNjMTA', false), (
'Aslin Beer Company',11,'aslin@fakeemail.com','555-666-7777','https://www.instagram.com/aslin/','https://www.Facebook.com/aslin','Test description for a fake brewery! aslin ipso lorum yadda yadda',
'11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '847 S Pickett St, Alexandria, VA 22304', '38.8041736', '-77.1383727','ChIJ4TfnRFqyt4kRNE-gVIytAEc', true), (
'West Sixth Beer Company',12,'westsixth@fakeemail.com','555-666-7777','https://www.instagram.com/westsixth/','https://www.Facebook.com/westsixth','Test description for a fake brewery! Big Elk ipso lorum yadda yadda',
'11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '1 Levee Way, Newport, KY 41071', '39.0948213', '-84.4964864','ChIJRdyu126xQYgRO1sF5gh-rl0', true);
CREATE TABLE beers (
    beer_id SERIAL,
    beer_name varchar(50) NOT NULL,
    beer_description varchar(300),
    beer_abv numeric(2,1),
    beer_style varchar(50) NOT NULL,
    image_url varchar(300),
    flavor_profile varchar(300),
    brewery_id int,
    beer_available boolean,
    CONSTRAINT PK_beers PRIMARY KEY (beer_id),
    CONSTRAINT FK_beers FOREIGN KEY (brewery_id) REFERENCES breweries(brewery_id)
);
INSERT INTO beers (beer_name,beer_description,beer_abv,beer_style,flavor_profile,image_url,brewery_id, beer_available)
VALUES ('Moose Drool', 'Our brown ale is made from the finest brown ale stuff money can buy',6.3,'Ale','Nutty,Smooth,Mild','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',1, true),
('Blueberry Lime Sour', 'Nighthawk Sour',4.5,'Sour','Citrusy','https://image.shutterstock.com/image-vector/textured-craft-beer-pub-brewery-600w-758936941.jpg',8, true),
('Pilsner', 'Nighthawk Pilsner',5.2,'Pilsner','Refreshing,Crisp','https://image.shutterstock.com/image-vector/textured-craft-beer-pub-brewery-600w-758936941.jpg',8, true),
('Incognito Hazy IPA', 'Nighthawk IPA',6.0,'IPA','Citrusy,Refreshing,Strong','https://image.shutterstock.com/image-vector/textured-craft-beer-pub-brewery-600w-758936941.jpg',8, true),
('Big Elk Sky High IPA', 'IPA inspired by big outdoor flavors. Grapefruit, with a hint of vanilla',7.2,'Ale','Strong,Citrusy','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',1, true),
('With Great Sour...', 'Comes great drinkability',6.3,'Sour','Mild,Refreshing','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',1, false),
('Cowabunga Dude!!', 'A dark, roasty, stout where we add lactose sugar to bring creamy mouthfeel to this chocolaty malt beverage. Medium bitter to balance out the roasty malt flavor.',5.6,'Stout','Nutty,Smooth,Creamy','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',2, true),
('D''s Nutty Brown Ale', 'True to the name, this beer has a slight nutty flavor and a fuller body. It has hints of caramel and chocolate but finishes clean. The german noble hops balance the sweetness to make this an incredibly drinkable beer. Have one or five, we suggest the latter.'
,5.5,'Brown Ale','Nutty,Smooth,Mild','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',2, true),
('You, Me & Mr. PB', 'Chocolate Peanut Butter Milk Stout',5.6,'Stout','Smooth,Strong','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',2, true),
('1821 Dark', 'A dark lager with roasted chocolate and coffee notes. Part of the 1821 series which includes a super special, super secret ingredient from NDBC owners’ family village in Greece. You can guess what it is, but we’ll never tell…'
,8.5,'Lager','Smooth','https://i1.wp.com/www.newdistrictbrewing.com/wp-content/uploads/2015/01/logo-ndbc-text-white-vert.png?w=800&ssl=1',3, true),
('Sour Shortcake', 'Slightly pink in color with strawberry and vanilla on the nose. Flavor starts off tart with notes of strawberry that leads into a white chocolate and vanilla smooth, rounded finish to cut the sourness.',5.1,'Sour','Refreshing','https://i1.wp.com/www.newdistrictbrewing.com/wp-content/uploads/2015/01/logo-ndbc-text-white-vert.png?w=800&ssl=1',3, true),
('Fashionably Late', 'This is a true pumpkin beer made with real pumpkins and you can taste them in every sip. Even non-pumpkin beer fans have fallen in love!',5.5,'Ale','Strong','https://i1.wp.com/www.newdistrictbrewing.com/wp-content/uploads/2015/01/logo-ndbc-text-white-vert.png?w=800&ssl=1',3, true),
('Java The Hutt Porter', 'Traditional American porter flavored with La Colombe cold brew. Chocolate malts and roasted barley add richness and a smooth mouthfeel while the coffee flavor Lingers on the palette',
5.6,'Porter','Nutty,Smooth,Strong','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',4, true),
('Czech Mate Pils', 'Light and refreshing traditional Czech style Pilsner dry-hopped with all Saaz hops',4.7,'Pilsner','Refreshing','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',4, true),
('The Bishop Brown', 'Chocolate and victory malts give this brown ale hints of dark chocolate, hazelnuts and toasted bread.',5.0,'Brown Ale','Nutty,Smooth,Mild','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',4, true),
('Wheelhouse Wheat Ale', 'Crafthouses finest wheat ale',5.8,'Pale Ale','Crisp,Refreshing','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',5, true),
('Monkey Business', 'Goin''Bananas',7.0,'Pilsner','Smooth','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',5, true),
('Arlington Special Ale', 'Crafthouse special ale',6.1,'Pale Ale','Nutty,Smooth,Mild','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',5, true),
('Yachtside Party Dweller', 'crusher melds our beloved German pilsner Sunnyside Dweller with their equally beloved light American lager Yacht Party.'
,4.7,'Lager','Smooth,Crisp','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',6, true),
('Caribou', 'A decadent dessert brew, Caribou is loaded with peanut butter, vanilla beans, cocoa nibs & milk sugar, all layered within the creamy richness of a delicious Sweet Stout.'
,8.0,'Stout','Nutty,Strong','https://untappd.akamaized.net/site/beer_logos/beer-2808472_a4003_sm.jpeg',6, true),
('Flying Blind', 'We recently got together with Charlotte-based Resident Culture to brew up this incredible hazy IPA. Flying Blind IPA is dry-hopped with a sky-high amount of Citra Spectrum & Motueka hops!⁠'
,6.9,'IPA','Citrusy','https://untappd.akamaized.net/site/beer_logos/beer-4837676_6571e_sm.jpeg',6, true),
('High Barbary', '',6.3,'Ale','Nutty,Smooth,Mild','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',7, true),
('Moose Drool', 'Base of German and Vienna and a touch of dark Munich malts. Sweet toasted malt flavor and aroma. Tettnanger hops in the mid boil and a finishing addition of Saaz hops for a hint of spice to the clean finish'
,5.4,'Lager','Light','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',7, true),
('Dance of Days', 'Dance of Days is a pale ale generously hopped with beautiful and bright Citra and Mosaic hops.'
,5.7,'Pale Ale','Smooth','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',7, true),
('Suburban Beverage', 'Gose-style ale with Valencia Oranges, Key Lime and Meyer Lemon.'
,4.2,'Sour','Strong','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',9, true),
('Boxcar Brown Ale', 'Gold Medal Winner 2016 Virginia Craft Brewer''s Cup, robust with hints of rich chocolate, dark fruit notes, smooth finish'
,5.3,'Brown Ale','Nutty,Smooth,Mild','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',9, true),
('838 Irish Stout', 'A light stout with a robust appearance. Roasted and chocolate malt flavors.'
,4.9,'Stout','Nutty,Mild,Strong','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',9, true),
('Smithtown Brown', 'Our American Brown is malt forward with a complex grain bill, with just enough balance coming from earthy and spicy hops.'
,5.5,'Brown Ale','Nutty,Smooth,Mild','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',10, true),
('Laurel River Pilsner', 'A bright and refreshing lager with light cracker malt notes, noble hops and a clean and sharp balancing bitterness.'
,5.5,'Pilsner','Bright,Refreshing','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',10, true),
('Peaks Mill Pale Ale', 'A bright and refreshing pale ale, light hop flavors that read mostly herbal and floral are balanced by a subtle cracker and bready focused malt profiles'
,5.3,'Pale Ale','Bright,Refreshing','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',10, true);
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



