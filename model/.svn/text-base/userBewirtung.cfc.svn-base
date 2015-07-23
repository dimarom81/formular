component persistent="true" entityname="userBewirtung" table="aki_user_bewirtung" accessors="true" {
	
	property name="id" column="USERID" fieldtype="id" generator="increment";
	property name="referenceID"		notnull="false"	 ormtype="string"	length="64";
	property name="first"			notnull="false"	 ormtype="string"	length="255";
	property name="last"			notnull="false"	 ormtype="string"	length="255";
	property name="gender"			notnull="false"	 ormtype="string"	length="16";
	property name="locale"			notnull="false"	 ormtype="string"	length="16";
	property name="socialservice"	notnull="false"	 ormtype="string"	length="64";
	property name="email"			notnull="false"	 ormtype="string"	length="255";
	
	property name="belege" 
			 singularname="beleg" 
			 type="array" 
			 fieldtype="one-to-many" 
			 cfc="belegBewirtung" 
			 inverse="false" 
			 fkcolumn="USERID";
	
		
	public UserBewirtung function init() {
		return this;
	}	
	
	//this.constraints TODO
}