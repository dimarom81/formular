component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{

		
	userBewirtungService function init(){		
		super.init(entityName="bewirtungsBeleg",useQueryCaching=true);
		return this;
	}
	
	public function saveDocumentation() {
	
	}
	
	public function getAllDocumentations() {
	
	}
	
		
}
	