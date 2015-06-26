component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{

		
	userBewirtungService function init(){		
		super.init(entityName="akiUserBewirtung",useQueryCaching=true);
		return this;
	}
	
	
		
}
	