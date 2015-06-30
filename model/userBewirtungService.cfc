component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{

		
	userBewirtungService function init(){		
		super.init(entityName="userBewirtung",useQueryCaching=true);
		return this;
	}
	
	public function saveUser() {
		
		var user = entityNew("userBewirtung");
		//var testUser = user.new(referenceID="TEST");
		
		user.setReferenceID("TEST");
		
		user.init();
		
		writeDump(user);abort;
		//super.save("user");
		//writeOutput("hier");
	}
	
	public function getUserName() {
		
	}
	
		
}
	