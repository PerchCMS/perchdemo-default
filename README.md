Perch Demo: Default site
========================

This is the very  simple demo site option which shows how Perch in a basic configuration would look.

We have included the default Quill Feather to give our few example pages some CSS, however Perch by default does not require even this.

Setup 
-----

To get up and running, you'll need to drop your `perch/core` folder into place, and add each of the add-ons to the `perch/addons` folder. Update the `perch/config.php` file with your own details.

Database
--------

The `sql/default_demo.sql` file contains the following placeholders for the primary user's details. Replace them out in the SQL before importing it.

* `{firstname}`
* `{lastname}` 
* `{email}` 
* `{username}`
* `{password}`

The password can be an MD5 (use `5f4dcc3b5aa765d61d8327deb882cf99` to log in with 'password'). It will be hashed to something more secure the first time it's used.
