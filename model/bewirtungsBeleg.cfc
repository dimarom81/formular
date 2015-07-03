component persistent="true" entityname="bewirtungsBeleg" table="aki_bewirtungsbeleg" accessors="true" {
	
	
	property name="ID" 					notnull="true"	fieldtype="id" generator="native" setter="false";
	property name="mealDate"			notnull="false"  ormtype="date";
	property name="location1"			notnull="false"  ormtype="string";
	property name="location2"			notnull="false"  ormtype="string";
	property name="occasion"			notnull="false"  ormtype="string";
	property name="participants"		notnull="false"  ormtype="string";
	property name="price"				notnull="false"  ormtype="integer";
	property name="restaurant"			notnull="false"  ormtype="boolean";
	property name="currentDate"			notnull="false"  ormtype="date";
	property name="currentLocation"		notnull="false"  ormtype="string";
	
			
	BewirtungsBeleg function init() {
		return this;
	}	
	
	//this.constraints TODO
}