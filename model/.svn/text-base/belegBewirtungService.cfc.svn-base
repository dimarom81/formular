component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{
		
	belegBewirtungService function init(){		
		super.init(entityName="belegBewirtung",useQueryCaching=true);
		return this;
	}
	
	public function saveDocumentation(belegBewirtung obj) {
		super.save(obj);
	}
	
	public function deleteDocumentation(belegBewirtung obj) {
		super.delete(obj);
	}
	
	public function getAllDocumentations(any referenceID) {
		var belege = this.findAllWhere( criteria = { referenceID = arguments.referenceID } );
		if( not ArrayIsEmpty(belege) ){
			return belege[1].getUser().getBelege();
		}		
		return ArrayNew(1);
	}
	
	public function getMealDate(any belegID) {
		var beleg = this.findAllWhere( criteria = { belegID = arguments.belegID} );	
		return beleg[1].getMealDate();//dateTimeFormat(xxx , "dd.MM.yyyy")
	}
	
	public function belongs( belegBewirtung obj, any referenceID ) {
		if( arguments.obj.getReferenceID() == arguments.referenceID){
			return true;
		}
		return false;
	}
		
}
	