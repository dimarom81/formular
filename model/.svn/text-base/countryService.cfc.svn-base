component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{

		
	CountryService function init(){		
		super.init(entityName="akiCountries",useQueryCaching=true);
		return this;
	}
	
	public function save( any country ) {
		if( arguments.country.getMwst() gt 0 and isNull( arguments.country.getVat() ) )
			arguments.country.setVat( true );
		else
			arguments.country.setVat( false );
		return super.save( arguments.country );
	}
	
	public function finalPrice(shortname, zahl){
		var country	= this.findAllWhere( criteria = { shortname = arguments.shortname } );
		country = country[ 1 ];	
		return arguments.zahl + arguments.zahl * country.getMwst();
		
	}
		
}
	