# Mental Health and Crime in Chicago

The Cook County Jail, which serves as the primary pretrial detention facility for arrestees in Chicago, is also one of the largest psychiatric treatment centers in the U.S. Starting in 2019, the City of Chicago released a new Framework for Mental Health Equity, investing millions of dollars each year to improve access to treatment.

We are exploring the relationships between access to mental health treatment, crime, and dispositions of criminal cases involving mandatory mental health treatment in the City of Chicago, with a particular emphasis on these relationships on a neighborhood by neighborhood basis.

We have already obtained data on crime and mental health in Chicago through apis from the city (data.cityofchicago.org), the Chicago Health Atlas (chicagohealthatlas.org) and Cook County (datacatalog.cookcountyil.gov).  We are in the process of importing the data into a SQL database and designing map visualizations with geopandas.

One particular area of interest is Cook County's small, but highly effective "problem solving courts" for mental health and drug rehabilitation. We are examining the criminal offenses, locations, and demographics of individuals referred to these programs in relation to case outcomes, and attempting to model potential outcomes if these programs are expanded.

### Agenda
-Problem Statement
-Explain data collection, what does our data contain/what does it mean
-Exploring the Data
-Regression - predicting crime based on MH factors
-Time Series Analysis
-Conclusions

### Problem Statement
Starting point:  The Cook County Jail, which serves as the primary pretrial detention facility for arrestees in Chicago, is also one of the largest psychiatric treatment centers in the U.S. 
In 2019, the City of Chicago released a new Framework for Mental Health Equity, investing millions of dollars each year to improve access to treatment.
We are exploring the relationships between mental health incidence and crime in the City of Chicago, with a particular emphasis on these relationships on a neighborhood by neighborhood basis.

### Visualizing Chicago
Chicago is organized into 77 different
neighborhoods.  Data for crime and mental health is often collected by neighborhood, zip code, or even census tract.  One of our challenges was on catenating data organized on these disparate levels.

### Crimes by Crime Type
The most occurred crimes were theft, battery, motor vehicle theft, assault, and criminal damage which is about 70% of all the crimes reported.
THEFT                                0.20994
BATTERY                              0.17222
MOTOR VEHICLE THEFT                  0.11534
CRIMINAL DAMAGE                      0.11510
ASSAULT                              0.08730
OTHER OFFENSE                        0.06482
DECEPTIVE PRACTICE                   0.06284
ROBBERY                              0.03440
WEAPONS VIOLATION                    0.03368
BURGLARY                             0.02896
CRIMINAL TRESPASS                    0.02048
NARCOTICS                            0.02004
OFFENSE INVOLVING CHILDREN           0.00840
CRIMINAL SEXUAL ASSAULT              0.00562
SEX OFFENSE                          0.00526
PUBLIC PEACE VIOLATION               0.00374
etc

### Crimes by Location
The most common locations to occur the crimes are at street, apartment, sidewalks, residence, where people are ordinarily at.

