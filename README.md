# LCC - Laravel Currency Converter
LCC is a currency converter, mobile-ready, built with Larevel and by default linked to [FloatRates](http://www.floatrates.com/json-feeds.html), but other option are supported.

# Project start
 - Open your terminal
 - cd to your project path, where the docker-compose.yml file is located
 - run there docker-compose up
 - Your application will be served on port 8080, so head to http://localhost:8080
 - To finish the setup go to the **DB set-up**

# DB set-up
  - Open your .env file
  - Set the following data
  
  ```
DB_HOST=database
DB_DATABASE=laravel_converter
DB_USERNAME=root
DB_PASSWORD=1234
```
  - Finally, on your browser go to http://localhost:8081 to access phpMyAdmin, and there create a new database called "laravel_converter".
