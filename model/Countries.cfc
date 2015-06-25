component persistent="true" entityname="akiCountries" table="aki_countries" accessors="true" {
	
	
	property name="countryID" 		notnull="true"	 fieldtype="id" generator="native" setter="false";
	property name="shortname"		notnull="true"   ormtype="string"  length="3";
	property name="name"		    notnull="true"   ormtype="string"  length="20";
	property name="vat"		        notnull="true"   ormtype="boolean" length="5";
	property name="mwst"		    notnull="false"  ormtype="double"  length="5";
		
			
	Countries function init() {
		return this;
	}	
	
}