component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{

		
	belegBewirtungService function init(){		
		super.init(entityName="belegBewirtung",useQueryCaching=true);
		return this;
	}
	
	public function saveDocumentation(belegBewirtung obj) {
		super.save(obj);
	}
	
	public function getAllDocumentations() {
		//TODO
	}
	
		
}
	