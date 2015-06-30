component persistent="true" entityname="userBewirtung" table="aki_user_bewirtung" accessors="true" {
	
	
	property name="ID" 		notnull="true"	 fieldtype="id" generator="native" setter="false";
	property name="referenceID"		notnull="true"  ormtype="integer"  length="16";
		
			
	UserBewirtung function init() {
		return this;
	}	
	
	//this.constraints TODO
}