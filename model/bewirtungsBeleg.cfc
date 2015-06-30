component persistent="true" entityname="bewirtungsBeleg" table="aki_bewirtungsbeleg" accessors="true" {
	
	
	property name="ID" 					notnull="true"	 fieldtype="id" generator="native" setter="false";
	property name="meal_date"			notnull="true"  ormtype="date";
	property name="location1"			notnull="true"  ormtype="string";
	property name="location2"			notnull="true"  ormtype="string";
	property name="occasion"			notnull="true"  ormtype="string";
	property name="participants"		notnull="true"  ormtype="string";
	property name="price"				notnull="true"  ormtype="integer";
	property name="restaurant"			notnull="true"  ormtype="boolean";
	property name="current_date"		notnull="true"  ormtype="date";
	property name="current_location"	notnull="true"  ormtype="string";
	
			
	BewirtungsBeleg function init() {
		return this;
	}	
	
	//this.constraints TODO
}