component persistent="true" entityname="bildBewirtung" table="aki_bild_bewirtung" accessors="true" {
	
	property name="id" column="BILDID" fieldtype="id" generator="increment";
	property name="bildName"		notnull="false"	 ormtype="string";
	property name="UUID"			notnull="false"	 ormtype="string";
	property name="UUIDpreview"		notnull="false"	 ormtype="string";
	
	property name="belegBewirtung" 
			 fieldtype="many-to-one" 
			 fkcolumn="BELEGID" 
			 cfc="belegBewirtung";
	
			
	BildBewirtung function init() {
		return this;
	}	
	
	//this.constraints TODO
}