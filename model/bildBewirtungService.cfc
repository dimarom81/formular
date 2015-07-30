component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{

		
	bildBewirtungService function init(){		
		super.init(entityName="bildBewirtung",useQueryCaching=true);
		return this;
	}
	
	public function savePictures(bildBewirtung obj) {
		super.save(obj);
	}
	
	public function deleteImage(bildBewirtung obj) {
		super.delete(obj);
	}
	
	public function belongs( bildBewirtung obj, any referenceID ) {
		if( arguments.obj.getBelegBewirtung().getUser().getReferenceID() == arguments.referenceID){
			return true;
		}
		return false;
	}
}
	