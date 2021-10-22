# cowin_tracker

A simple example of a tracker that shows data for covid-19 vaccination centres as you enter the pin code,
and the date when u require to book the slot.

## The Api Used

This project is a starting point for a Flutter application.

- [The Api Link](https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=110059&date=22102121)

https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=110059&date=22102121

## The data reutrned by the API looks like

  {
          "session_id": "5d70b388-f1ea-47eb-8653-5abe9199fb42",
          "date": "24-10-2021",
          "available_capacity": 9,
          "min_age_limit": 18,
          "allow_all_age": true,
          "vaccine": "COVISHIELD",
          "slots": [
            "09:00AM-11:00AM",
            "11:00AM-01:00PM",
            "01:00PM-03:00PM",
            "03:00PM-05:00PM"
          ],
          "available_capacity_dose1": 0,
          "available_capacity_dose2": 9
        },

## ScreenShots

- ![alt text](https://i.ibb.co/xztrRm5/Whats-App-Image-2021-10-22-at-12-56-52-PM.jpg)

- ![alt text](https://i.ibb.co/wdDHxbh/Whats-App-Image-2021-10-22-at-12-57-00-PM.jpg)
