component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{

		
	belegBewirtungService function init(){		
		super.init(entityName="belegBewirtung",useQueryCaching=true);
		return this;
	}
	
	public function saveDocumentation(belegBewirtung obj) {
		super.save(obj);
	}
	
	public function getAllDocumentations(any referenceID) {
		var belege = this.findAllWhere( criteria = { referenceID = arguments.referenceID } );	
		return belege[1].getUser().getBelege();
	}
	
	public function getMealDate(any belegID) {
		var beleg = this.findAllWhere( criteria = { belegID = arguments.belegID} );	
		return beleg[1].getMealDate();//dateTimeFormat(xxx , "dd.MM.yyyy")
	}
	
		
}
	