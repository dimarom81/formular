component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{

		
	userBewirtungService function init(){		
		super.init(entityName="userBewirtung",useQueryCaching=true);
		return this;
	}
	
	public function saveUser(referenceID,first,last,gender,locale,socialservice,email) {
		
		//writeOutput(referenceID);abort;
		
		var user = findAllWhere( entityName="userBewirtung", criteria = { referenceID = arguments.referenceID });
		//writeDump(user);abort;
				
		if(ArrayisEmpty(user)){
			var temp = entityNew("userBewirtung");
			temp.setReferenceID(referenceID);
			temp.setFirst(first);
			temp.setLast(last);
			temp.setGender(gender);
			temp.setLocale(locale);
			temp.setSocialservice(socialservice);
			super.save(temp);
		}
		
		
		
		//var user = entityNew("userBewirtung");
						
		//user.setReferenceID("123");
		
		
		//super.save(user);
		
	}
	
	public function getUserName() {
		
	}
	
		
}
	