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
VALUES ('Big Elk River Brewing Co',16,'BigElkBeer@fakeemail.com','555-666-7777','https://www.instagram.com/BigElkBeer/','https://www.Facebook.com/BigElkBeer','We love Cecil County!  Brad and Jessica Carrillo love beer and they love going to breweries to taste beer. They also love Cecil County. They wanted to combine their loves and bring good beer to Cecil County. Originally from Colorado, they grew up in a great beer culture. They have been a part of Elkton for over 16 years, raising their family here and they look forward to spending the rest of their lives living in Cecil County, drinking good, Cecil County beer. Proud Members of the Elkton Alliance. #WeAreElkton',
'11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '123 Main St. Noel, MO. 64854', '36.601856', '-94.447206','', true), (
'Mirror Twin Brewing',7,'info@mirrortwinbrewing.com','859-447-8146','https://www.instagram.com/mirrortwinbrewing/','https://www.facebook.com/Mirrortwinbrewingco','WHO WE ARE What started as an homage to Derek DeFranco’s life as a mirror twin, or an identical twin with asymmetrical features, Mirror Twin Brewing has turned into a twist on traditional taproom offerings. The twin draft system embodies what Mirror Twin is all about: bringing people from all walks of life together to cultivate a sense of community through a shared interest: damn good beer. The brewery serves up customers from both sides of life: the tried-and-true beer purists and the anything-goes experimental adventure seekers. This variety allows MTB to take an innovative approach to brewing through utilizing various hop agents/variants usually resulting in a product unlike any other in Lexington, KY.',
 '11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '725 National Ave, Lexington, KY 40502', '38.0404142', '-84.4784980','ChIJP8XQkB9FQogRlFMT5O3ezIc', false),(
 'New District Brewing Company',13,'info@newdistrictbrewing.com','703-888-5820','https://www.instagram.com/newdistrictbrew/','https://www.facebook.com/newdistrictbrewing/','The first production brewery in Arlington, Virginia in one hundred years, New District Brewing Co. is a family and friend business devoted to community and high quality craft beer. ',
  '11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '901 N Glebe Rd #105, Arlington, VA 22203', '38.8814934', '-77.1153352','ChIJRYKNITu0t4kRReaVLyxsr3s', true),(
  'Board Room Brewing Company',8,'erica@theboardroomva.com','703-248-9439','http://instagram.com/boardroomva','https://www.facebook.com/theboardroomva','Located in Arlington’s buzzing Clarendon neighborhood, The Board Room Game Bar & Brewery is at the top of its game. Our brews, food, wines and spirits play to win. ',
    '11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '925 N Garfield St, Arlington, VA 22201', '38.8838800', '-77.0932289','ChIJf2KjD4W2t4kRKlxzoY6Y8zs', false),(
    'Crafthouse Arlington',14,'arlington@crafthouseusa.com','571-483-0421','https://www.instagram.com/CrafthouseArlingtonVA/','https://www.facebook.com/CraftHouseUSA','We strive to offer the best selection of craft beer whether it’s from across town or the other side of the globe. Whether you are a new beer lover or a beer, bourbon, or wine connoisseur, our friendly and knowledgeable staff is here to guide you through every selection.',
    '11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '901 N Glebe Rd #105, Arlington, VA 22203', '38.8814934', '-77.1153352','ChIJRYKNITu0t4kRReaVLyxsr3s', true), (
    'The Brew Shop',15,'info@arlbrew.com','703-746-9001','http://instagram.com/arlbrew','http://www.facebook.com/arlbrew','The Brew Shop is a local specialty beer store serving the greater DC area with an eye towards all things brew, including beer, wine, homebrew supplies, and locally roasted prepackaged coffee.',
'11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '2004 Wilson Blvd, Arlington, VA 22201',  '38.8921709', '-77.0822744','-77.0822744', true),(
 'Meridian Pint',9,'info@meridianpint.com','703-300-9655','https://www.instagram.com/meridianpint/','https://www.facebook.com/MeridianPintArlington','Serving Arlington and surrounding areas with great beer, food, and fun! Join us for Happy Hour every day from 4PM to 7PM!',
'11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '6035 Wilson Blvd, Arlington, VA 22205', '38.8739519', '-77.1405619','ChIJfXZE-2a0t4kRvJrVkYu9C0s', true),(
'Nighthawk Brewery & Pizza',10,'info@nighthawkbrewery.co','571.416.8100','https://www.instagram.com/nighthawkbrewery/','https://www.facebook.com/nighthawkbreweryco','Welcome to Nighthawk Brewery & Pizza, the newest brewpub in Arlington that serves more than just pizza! We serve Midwest Tavern pie. That means our pies are thin and crispy, great for enjoying with our extensive list of both juicy and crispy beers brewed on-site! We also offer super-thick squares for those pizza lovers that like something a little bigger to bite into. ',
'11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '1201 S Joyce St C10, Arlington, VA 22202', '38.8635402', '-77.0632430','Ei0xMjAxIFMgSm95Y2UgU3QgYzEwLCBBcmxpbmd0b24sIFZBIDIyMjAyLCBVU0EiHxodChYKFAoSCWNf3v7btreJEQTEP5XW9eFhEgNjMTA', false), (
'Aslin Beer Company',11,'aslinbeerco@gmail.com','571-431-7603','https://www.instagram.com/aslinbeerco','https://www.facebook.com/aslinbeerco','Aslin Beer Co. was founded in 2015 by Andrew Kelley and Kai Leszkowicz. The name, Aslin, comes from the family that connected Andrew and Kai through marriage; they each married a daughter from the Aslin Family. Andrew’s professional background was in finance and consulting, while Kai worked in public service. They bonded over a shared interest of craft beer and home-brewing, which eventually lead to the idea that “We can do this too.”',
'11:30am - 1:00am', '2:00pm - 11:00pm','2:00pm - 11:00pm','CLOSED','2:00pm - 11:00pm','11:30am - 2:00am','11:30am - 2:00am','https://www.shutterstock.com/image-photo/glasses-different-sorts-craft-beer-on-1212903172', '847 S Pickett St, Alexandria, VA 22304', '38.8041736', '-77.1383727','ChIJ4TfnRFqyt4kRNE-gVIytAEc', true), (
'West Sixth Beer Company',12,'westsixth@fakeemail.com','859-705-0915','https://instagram.com/westsixthfarm','https://facebook.com/westsixthfarm','We focus our brewing talents on a wide variety of beers, starting when we opened with the West Sixth IPA and now canning upwards of 30 beers throughout the year with countless bottles being released. WE share these beers in our taprooms throughout the state of Kentucky - In Lexington at our home brewery on West Sixth Street in the bread Box, in Louisville at 817 E Market Street in NuLu, and at the West Sixth Farm (a 125 acre property with trails and a seasonal taproom) in Frankfort, KY. We are a growing team of over 50 employees, focusing on brewing beers with high quality and creativity that we’re proud to serve to our friends and family, but most importantly; that we like to drink!
',
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
('Blueberry Lime Sour', 'Nighthawk Sour',4.5,'Sour','Citrusy','https://www.washingtonian.com/wp-content/uploads/2022/03/NighthawkImagesFirstSet-199-994x663.jpg',8, true),
('Pilsner', 'Nighthawk Pilsner',5.2,'Pilsner','Refreshing,Crisp','https://image.shutterstock.com/image-vector/textured-craft-beer-pub-brewery-600w-758936941.jpg',8, true),
('Incognito Hazy IPA', 'Nighthawk IPA',6.0,'IPA','Citrusy,Refreshing,Strong','https://image.shutterstock.com/image-vector/textured-craft-beer-pub-brewery-600w-758936941.jpg',8, true),
('Big Elk Sky High IPA', 'IPA inspired by big outdoor flavors. Grapefruit, with a hint of vanilla',7.2,'Ale','Strong,Citrusy','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',1, true),
('With Great Sour...', 'Comes great drinkability',6.3,'Sour','Mild,Refreshing','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',1, false),
('Cowabunga Dude!!', 'A dark, roasty, stout where we add lactose sugar to bring creamy mouthfeel to this chocolaty malt beverage. Medium bitter to balance out the roasty malt flavor.',5.6,'Stout','Nutty,Smooth,Creamy','\images\mirrorwin\ds.jpg',2, true),
('D''s Nutty Brown Ale', 'True to the name, this beer has a slight nutty flavor and a fuller body. It has hints of caramel and chocolate but finishes clean. The german noble hops balance the sweetness to make this an incredibly drinkable beer. Have one or five, we suggest the latter.'
,5.5,'Brown Ale','Nutty,Smooth,Mild','\images\mirrorwin\ds.jpg',2, true),
('You, Me & Mr. PB', 'Chocolate Peanut Butter Milk Stout',5.6,'Stout','Smooth,Strong','\images\mirrorwin\MrPB.png',2, true),
('1821 Dark', 'A dark lager with roasted chocolate and coffee notes. Part of the 1821 series which includes a super special, super secret ingredient from NDBC owners’ family village in Greece. You can guess what it is, but we’ll never tell…'
,8.5,'Lager','Smooth','\images\newdistrictbrewery\1821-logo.png',3, true),
('Sour Shortcake', 'Slightly pink in color with strawberry and vanilla on the nose. Flavor starts off tart with notes of strawberry that leads into a white chocolate and vanilla smooth, rounded finish to cut the sourness.',5.1,'Sour','Refreshing','\images\newdistrictbrewery\SourShortcake-1.png',3, true),
('Fashionably Late', 'This is a true pumpkin beer made with real pumpkins and you can taste them in every sip. Even non-pumpkin beer fans have fallen in love!',5.5,'Ale','Strong','\images\newdistrictbrewery\fashionablylate.png',3, true),
('Java The Hutt Porter', 'Traditional American porter flavored with La Colombe cold brew. Chocolate malts and roasted barley add richness and a smooth mouthfeel while the coffee flavor Lingers on the palette',
5.6,'Porter','Nutty,Smooth,Strong','\images\boardroombrewing\javathehutt.jpg',4, true),
('Czech Mate Pils', 'Light and refreshing traditional Czech style Pilsner dry-hopped with all Saaz hops',4.7,'Pilsner','Refreshing','\images\boardroombrewing\czhecmatepils.jpeg',4, true),
('The Bishop Brown', 'Chocolate and victory malts give this brown ale hints of dark chocolate, hazelnuts and toasted bread.',5.0,'Brown Ale','Nutty,Smooth,Mild','\images\boardroombrewing\bishopbrown.jpg',4, true),
('Wheelhouse Wheat Ale', 'Crafthouses finest wheat ale',5.8,'Pale Ale','Crisp,Refreshing','https://image.shutterstock.com/image-vector/textured-craft-beer-pub-brewery-600w-758936941.jpg',5, true),
('Monkey Business', 'Goin''Bananas',7.0,'Pilsner','Smooth','https://image.shutterstock.com/image-vector/textured-craft-beer-pub-brewery-600w-758936941.jpg',5, true),
('Arlington Special Ale', 'Crafthouse special ale',6.1,'Pale Ale','Nutty,Smooth,Mild','https://image.shutterstock.com/image-vector/textured-craft-beer-pub-brewery-600w-758936941.jpg',5, true),
('Yachtside Party Dweller', 'crusher melds our beloved German pilsner Sunnyside Dweller with their equally beloved light American lager Yacht Party.'
,4.7,'Lager','Smooth,Crisp','\images\thebrewshop\yachtside2.jpg',6, true),
('Caribou', 'A decadent dessert brew, Caribou is loaded with peanut butter, vanilla beans, cocoa nibs & milk sugar, all layered within the creamy richness of a delicious Sweet Stout.'
,8.0,'Stout','Nutty,Strong','\images\thebrewshop\cariboulogo.jpeg',6, true),
('Flying Blind', 'We recently got together with Charlotte-based Resident Culture to brew up this incredible hazy IPA. Flying Blind IPA is dry-hopped with a sky-high amount of Citra Spectrum & Motueka hops!⁠'
,6.9,'IPA','Citrusy','\images\thebrewshop\flyingblindlogo.jpeg',6, true),
('High Barbary', 'From the tap, it pours a golden amber color with a nice just off-white head that slowly reduces and leaves nice lacing. The nose gets a pleasant scent of caramel malts and honey combination and the taste follows with a pleasant bite of bitterness followed by a toasty malt flaovr.',6.3,'Ale','Nutty,Smooth,Mild','\images\highbarbary.jpg',7, true),
('Moose Drool', 'Base of German and Vienna and a touch of dark Munich malts. Sweet toasted malt flavor and aroma. Tettnanger hops in the mid boil and a finishing addition of Saaz hops for a hint of spice to the clean finish'
,5.4,'Lager','Light','https://bigskybrew.com/wp-content/uploads/2022/03/CANMD192web.png',7, true),
('Dance of Days', 'Dance of Days is a pale ale generously hopped with beautiful and bright Citra and Mosaic hops.'
,5.7,'Pale Ale','Smooth','\images\nighthawk\danceofdays.jpg',7, true),
('Suburban Beverage', 'Gose-style ale with Valencia Oranges, Key Lime and Meyer Lemon.'
,4.2,'Sour','Strong','\images\aslin\suburbanbeverage.png',9, true),
('Boxcar Brown Ale', 'Gold Medal Winner 2016 Virginia Craft Brewer''s Cup, robust with hints of rich chocolate, dark fruit notes, smooth finish'
,5.3,'Brown Ale','Nutty,Smooth,Mild','\images\aslin\boxcarbrown.jpg',9, true),
('838 Irish Stout', 'A light stout with a robust appearance. Roasted and chocolate malt flavors.'
,4.9,'Stout','Nutty,Mild,Strong','\images\aslin\838irishstout.jpeg',9, true),
('Smithtown Brown', 'Our American Brown is malt forward with a complex grain bill, with just enough balance coming from earthy and spicy hops.'
,5.5,'Brown Ale','Nutty,Smooth,Mild','\images\westsixth\smithtownbrown-1.jpg',10, true),
('Laurel River Pilsner', 'A bright and refreshing lager with light cracker malt notes, noble hops and a clean and sharp balancing bitterness.'
,5.5,'Pilsner','Bright,Refreshing','\images\westsixth\LaurelRiverPilsner-1.jpg',10, true),
('Peaks Mill Pale Ale', 'A bright and refreshing pale ale, light hop flavors that read mostly herbal and floral are balanced by a subtle cracker and bready focused malt profiles'
,5.3,'Pale Ale','Bright,Refreshing','\images\westsixth\peaksmillepaleale.jpg',10, true);
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



