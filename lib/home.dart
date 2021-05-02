import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp, currently, description, humidity, windSpeed, tempC;

  Future getWeather() async {
    //String url="http://api.openweathermap.org/data/2.5/weather?q=London&units=imperial&appid=1ace791a1c7e85ecb2a5045146660b7d";
    http.Response response = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=Lahore&units=imperial&appid=1ace791a1c7e85ecb2a5045146660b7d"));
    var results = jsonDecode(response.body);

    setState(() {
      this.temp = results['main']['temp'];
      tempC = (temp - 32) * 5 / 9;
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff081B25),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff152C39),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Lahore',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),

                    ),
                  ),
                  Text(
                    temp != null ? temp.toString() + "\u00B0" + "F" : "Loading",
                    style: TextStyle(
                      fontFamily: 'Changa',
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      currently != null ? currently.toString() : "Loading",
                      style: TextStyle(
                        fontFamily: 'Changa',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: 80,
                        child: Center(
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.thermometerHalf,
                              color: Colors.redAccent,
                            ),
                            title: Text(
                              "Temperature",
                              style: TextStyle(
                                fontFamily: 'Changa',
                                color: Colors.white,
                              ),
                            ),
                            trailing: Text(
                                temp != null
                                    ? temp.toString() + "\u00B0" + "F"
                                    : "Loading",
                                style: TextStyle(
                                  fontFamily: 'Changa',
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xff152C39),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: 80,
                        child: Center(
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.cloud,
                              color: Colors.blueAccent,
                            ),
                            title: Text("Weather",
                                style: TextStyle(
                                  fontFamily: 'Changa',
                                  color: Colors.white,
                                )),
                            trailing: Text(
                                description != null
                                    ? description.toString()
                                    : "Loading",
                                style: TextStyle(
                                  fontFamily: 'Changa',
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xff152C39),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: 80,
                        child: Center(
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.sun,
                              color: Colors.yellowAccent,
                            ),
                            title: Text("humidity",
                                style: TextStyle(
                                  fontFamily: 'Changa',
                                  color: Colors.white,
                                )),
                            trailing: Text(
                                humidity != null
                                    ? humidity.toString()
                                    : "Loading",
                                style: TextStyle(
                                  fontFamily: 'Changa',
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xff152C39),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: 80,
                        child: Center(
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.wind,
                              color: Color(0xff9E78FA),
                            ),
                            title: Text("Wind Speed",
                                style: TextStyle(
                                  fontFamily: 'Changa',
                                  color: Colors.white,
                                )),
                            trailing: Text(
                                windSpeed != null
                                    ? windSpeed.toString()
                                    : "Loading",
                                style: TextStyle(
                                  fontFamily: 'Changa',
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xff152C39),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
