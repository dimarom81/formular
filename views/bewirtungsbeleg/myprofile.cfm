
<!---TODO kann nicht verändert werden--->

<div class="container">
  <h3>Meine Daten (werden von Facebook zur Verfügung gestellt)</h3>                     
  <table class="table table-striped">
    <thead>
    </thead>
    <tbody>
      <tr>
        <td>First name</td>
        <td><cfoutput>#prc.name#</cfoutput></td>
      </tr>
      <tr>
        <td>Last name</td>
        <td><cfoutput>#prc.lastname#</cfoutput></td>
      </tr>
      <tr>
        <td>Gender</td>
        <td><cfoutput>#prc.gender#</cfoutput></td>
      </tr>
	  <tr>
        <td>Social network</td>
        <td><cfoutput>#prc.network#</cfoutput></td>
      </tr>
	  <tr>
        <td>e-mail</td>
        <td><cfoutput>#prc.email#</cfoutput></td>
      </tr>
    </tbody>
  </table>
</div>

