component persistent="true" entityname="bildBewirtung" table="aki_bild_bewirtung" accessors="true" {
	
	property name="id" column="BILDID" fieldtype="id" generator="increment";
	property name="bildName"		notnull="false"	 ormtype="string";
	property name="UUID"			notnull="false"	 ormtype="string";
	property name="UUIDpreview"		notnull="false"	 ormtype="string";
	
	property name="partialImgPath"  inject="coldbox:setting:partialImgPath";
	
	property name="belegBewirtung" 
			 fieldtype="many-to-one" 
			 fkcolumn="BELEGID" 
			 cfc="belegBewirtung";
	
			
	BildBewirtung function init() {
		return this;
	}
	
	
	function getUUID(boolean fullPath=false){
		if(!arguments.fullPath)
			return variables.uuid;
		else
			return partialImgPath & variables.UUID & '.jpg';
	}
	
	function getUUIDpreview(boolean fullPath=false){
		if(!arguments.fullPath)
			return variables.uuidpreview;
		else
			return partialImgPath & variables.UUIDpreview & '.jpg';
	}	
	
	//this.constraints TODO
}