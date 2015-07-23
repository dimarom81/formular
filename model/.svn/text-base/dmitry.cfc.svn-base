component persistent="false" accessors="true" {

	property name="name";
	property name="vorname";
	property name="number";

	// object constraints
	this.constraints = {
		// with custom message
		name    =  {required=true, type="string", requiredMessage="name required"},
		vorname =  {required=true, requiredMessage="vorname required"},
		number  =  {required=true, type="numeric", min=0, requiredMessage="name required"}
	};
}