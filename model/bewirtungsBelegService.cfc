component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{

		
	bewirtungsBelegService function init(){		
		super.init(entityName="bewirtungsBeleg",useQueryCaching=true);
		return this;
	}
	
	public function saveDocumentation(bewirtungsBeleg obj) {
		super.save(obj);
	}
	
	public function getAllDocumentations() {
	
	}
	
		
}
	