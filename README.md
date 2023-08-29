# Video-Rental-Relational-Database


Relational database example for a movie rental store.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

A VHS and a DVD are both copies of a movie kept in a separate plastic case that is rented out.

The store has several copies of each movie it rents therefore there are several VHSs and DVDs for each movie title.

It has several thousand VHSs and DVDs, which it gets wholesale from about a half dozen distributors. 
The VHS and DVD prices are based on the quantity of their shipment and the past business it has done with each company.

The price of a DVD for a movie might be different than the price of a VHS for the same movie, even from the same distributor.
Each distributor provides different types of movies (e.g., suspense, horror, mystery, comedy, etc.). A single distributor may provide several different types of movies in both VHS and DVD format. 
It is possible to obtain the same movie from multiple distributors, and at different wholesale prices.

Each VHS and DVD has a unique identification number that the owners assign in their inventory, in addition to the distributor's serial number for the item. 
Each movie also has a unique identification number the owners assign in addition to the title, and any movie IDs the distributors use in their electronic catalogs. 
Distributors provide electronic catalogs to the owners and the information from these catalogs must be included in the database.

The owners record when a VHS or DVD is rented, when a VHS or DVD is returned, and all customer charges such as late and damaged fees, failure to rewind fees, and taxes. 
They report which videos are returned late because there are standard and late charges. On occasion there are discount prices for certain movies or types of movies. 
Customers may want to rent movies based on actors or actresses, running length, type of movie, rating, year released, the director, and the academy awards won (by the movie, the actors, the actresses and/or the directors).
Customers also want to know how many videos they have rented in the last month, year, and so forth. The owners keep only basic information on customers in their database, such as name, address, telephone numbers, etc.

There is no limit to the number of VHS and/or DVD copies of a movie that the owners can have in their inventory. 
VHS/DVD ID numbers, movie ID numbers, and distributor ID numbers for VHSs, DVDs, and movies are all different. 

Each movie is able to have an unlimited number of actors, actresses, directors, and academy awards (i.e., Oscars). 
Other types of awards (e.g., Golden Globe, People's Choice, etc.) are not of interest for this application. 
The rental of equipment, sale of VHSs, DVDs, popcorn, etc., is not kept in the database.
