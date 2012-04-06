## 0.1.0, released 2012-04-05

* Added Brewscribe::Document to represent .bsmx file
* Moved XML to Hash conversion to Brewscribe::Document, leaving Brewscribe::Recipe
  to work based on the resulting Hash.
* Brewscribe::Recipe#create\_accessors removed in favor of explicit attr\_accessors
* Brewscribe#import now returns a Brewscribe::Document

## 0.0.1, released 2012-03-23

* Added Brewscribe.import sugar to Brewscribe::Recipe.new
* Added IngredientList parsing of Brewscribe::Recipe
