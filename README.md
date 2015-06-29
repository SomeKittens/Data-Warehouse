# Data Warehouse samples

You can find the main article [here](http://rkoutnik.com/articles/Building-data-warehouses-for-fun-and-profit.html).

## Directories:

#### dataGen:

Code for generating the data to play with later.  You'll need to add a `.env` file that sets `PG_URL` to the url string you want to connect to.

To set up:

 - `npm install` in the dataGen directory
 - [Load `init.sql` into postgres](http://stackoverflow.com/a/12085561/1216976)

To run:

`node index.js`

#### luigi:

Also expects `.env`, this time setting PG_USER and PG_PASSWORD

gustav_park.py contains the Luigi ETL code.  You'll need to [install Luigi](https://github.com/spotify/luigi#getting-luigi) for it to work.  Run it with `python gustav_park.py AllData --local-scheduler`

reset.py will reset your database and data directory to factory settings, allowing Luigi to make a full, clean run.

ddw.sql is the schema for the data warehouse itself.  Load it like you would any other .sql file.  It's optional, as Luigi will create the tables if they don't exist already.

#### redash:

Contains SQL examples for running in re:dash.  You'll need to [install it](http://redash.io/deployment/setup.html) first.

#### sqlDump:

The data I used when building the app.  You might find it useful.