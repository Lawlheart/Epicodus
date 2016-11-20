## Epicodus Work

### Ruby

#### Week 1

Monday

* Ping Pong
* Title Case
* Leetspeak
* Queen Attack
* Clock Angle

### Drupal (Self-Study)

#### Week 1

Monday

* Cameron's Coffee(coffee-site)
* Fan Site(gravity falls)
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
