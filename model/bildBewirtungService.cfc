component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{

		
	bildBewirtungService function init(){		
		super.init(entityName="bildBewirtung",useQueryCaching=true);
		return this;
	}
	
	public function savePictures(bildBewirtung obj) {
		super.save(obj);
	}
	
	
	
		
}
	