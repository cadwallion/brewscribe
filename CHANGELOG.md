## 0.3.0, released 2013-03-08

* Added ABV/ABW calculation methods to Brewscribe::Recipe
* Added SRM calculation method to Brewscribe::Recipe
* Added IBU calculation method to Brewscribe::Recipe
* Fixed typo

## 0.2.0, released 2012-04-13

* Added Brewscribe::Mash
* Added Brewscribe::Carbonation
* Added Brewscribe::Equipment
* Added Brewscribe::Style
* Brewscribe::Recipe now follows the type conversion system
* Brewscribe::Document now parses Style listings

## 0.1.0, released 2012-04-05

* Added Brewscribe::Document to represent .bsmx file
* Moved XML to Hash conversion to Brewscribe::Document, leaving Brewscribe::Recipe
  to work based on the resulting Hash.
* Brewscribe::Recipe#create\_accessors removed in favor of explicit attr\_accessors
* Brewscribe#import now returns a Brewscribe::Document

## 0.0.1, released 2012-03-23

* Added Brewscribe.import sugar to Brewscribe::Recipe.new
* Added IngredientList parsing of Brewscribe::Recipe
