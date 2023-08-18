## version1
1. quest openweather api
   1. via https://openweathermap.org/current
2. update the page
   1. https://openweathermap.org/weather-conditions#Weather-Condition-Codes-2
3. display the weather data
4. error handling
5. modeling current weather data
   1. as Weather


## version2
package: 
    geolocator
    permission_handler?
1. search by geo location
   1. only user latlng
2. consider update timeing
3. improve search bar suggestion
   1. return suggestion:
      1. check if it's country code
         2. 2 letters
         3. after ,
4. use go router
   1. start from search page, if
      1. last location is null
      2. user location permission is not allow
   2. else, route to data page

## version3
1. integrate hourly api
   1. https://openweathermap.org/forecast5
   2. display curve
2. Style Page
   1. Neumorphism style
   2. background
      1. color gredient?

## version4
package:
    shared_preferences
      1. success search history
         1. geo location
         2. city, country
      2. update timestamp
      3. style setting:
         1. language
         2. unit
         3. dark/light mode 
Search page:
api provided by Geocoding API
1. search city name by country code
   1. display in map page
   2. city name drop down?

## more description:
1. trigger by hover