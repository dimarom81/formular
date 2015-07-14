component persistent="true" entityname="belegBewirtung" table="aki_beleg_bewirtung" accessors="true" {
	
	property name="id" column="BELEGID" fieldtype="id"   generator="increment";
	property name="referenceID"			notnull="false"	 ormtype="string"	length="64";
	property name="mealDate"			notnull="false"  ormtype="date";
	property name="location"			notnull="false"  ormtype="string";
	property name="occasion"			notnull="false"  ormtype="string";
	property name="participants"		notnull="false"  ormtype="string";
	property name="price"				notnull="false"  ormtype="double";
	property name="currency"			notnull="false"  ormtype="string";
	property name="restaurant"			notnull="false"  ormtype="boolean";
	property name="currentDate"			notnull="false"  ormtype="date";
	property name="currentLocation"		notnull="false"  ormtype="string";
	
	property name="user" 
			 fieldtype="many-to-one" 
			 fkcolumn="USERID" 
			 cfc="userBewirtung";
			 
	property name="bilder" 
			 singularname="bild" 
			 type="array" 
			 fieldtype="one-to-many" 
			 cfc="bildBewirtung" 
			 inverse="false" 
			 fkcolumn="BELEGID";
	
	
			
	public BelegBewirtung function init() {
		return this;
	}	
	
	
	this.constraints = {
		mealDate    =  {required=true, type="string", requiredMessage="Please fill the meal date field"},
		location    =  {required=true, type="string", requiredMessage="mealDate required"}
	};
}