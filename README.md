## Epicodus Work

### Ruby

#### Week 1

Monday

* Ping Pong
* Title Case
* Leetspeak
* Queen Attack
* Clock Angle

Tuesday

* Scrabble
* Number to word converter(numberword)

Wednesday

* Title Case
* Scrabble Score (scrabble)
* Rock Paper Scissors
* Find and Replace

Thursday

* Coin Combinations (make-change)
* Anagrams
* Allergens

Friday

* Word Count (Independent Project)

#### Week 2

Monday

* Triangles https://github.com/lukeephilips/triangle_counter
* Parcels   https://github.com/lukeephilips/parcel_calc
* Hashy     https://github.com/lukeephilips/Hashy

#### Week 3

* To Do List      https://github.com/accua/to_do_list_psql
* Animal Shelter  https://github.com/kftwotwo/animal_shelter
* Express         https://github.com/margie-ynm/express
* Hair Salon      https://github.com/lawlietblack/salon

### Drupal (Self-Study)

#### Week 1

* Cameron's Coffee(hipster-haus)
* Fan Site(universe)
* Portfolio(lawlietblack)







### Drupal Setup Instructions:

1. Download Drupal version 7.51

2. Replace the sites folder with the enclosed sites folder

3. Import the Database Dump

  a. Open phpMyAdmin and click on the "Import" tab.

  b. Leave all the default settings and make sure the character set is "utf-8"

  c. Now click on the "Choose File" button next to "Browse your computer" and select the .sql.zip file we included in our sites/db-backup folder. It's okay to leave it zipped.

  d. Then click the "Go" button on the bottom left.

4. Create the Database User (not needed if using Acquia Dev Desktop)

  a. Lastly, we must recreate the database username/password that Drupal uses to store things in the database. We do this the same way we did when we created the database.

  b. After importing the .sql.zip file, select the "Privileges" tab and click on "Add User".

  c. Use the same username and password from before. (If we have forgotten what that was, we can always find that information in settings.php, or in the PDO Exception error message we saw displayed in the browser.)

  d. After importing the database, if you have any trouble logging in with your Site Maintenance account, clear your browser's cookies by clearing the browser history.
