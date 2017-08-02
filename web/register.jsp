<%-- 
    Document   : register
    Created on : Feb 3, 2017, 1:21:59 PM
    Author     : Earth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!DOCTYPE html>
<html lang=de>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Registration</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="js/jquery-1.11.1.min.js">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.min.js">

</head>

    <body>
       
            <div class="container-narrow">
	<div class="white-box">
		<div class="kinofreund_banner_center">
			<a href="index.jsp"><img src="images/logo.png" width=151 height=90 alt=""></a>
					</div>
			<div class="row centered halfwidth" style="display:none">
		<div class="progress progress-striped">
			<div class="bar" style="width: 25%"></div>
		</div>
	</div>

	<form action="two.jsp" method="post">
		
		<div class=reg_table>
			<div class=selectable>
				<input type="radio" id="form_user_type_0" name="user_type" checked required="required" value="0" />
				<label for="form_user_type_0">
					<h4>Theater Projectionist</h4>
					<p>In the film trailer portal, Distributors show current trailer of their
                                           Feature Films which are available for download in the DCP format.</p>

					<p>To download those trailer’s  a registration is required.
                                           We check each registration and send confirmation 
                                           To the above mentioned e-mail address. If you want,
                                           You can add your current contact details for further communication.</p>
                                        </label>
			</div>
			<div class=selectable>
				<input type="radio" id="form_user_type_1" name="user_type" required="required" value="1" />
				<label for="form_user_type_1">
					<h4>Distributor</h4>
					<p>As a distributor you can go to the portal
                                           To add your film details like Trailer, press material
                                           And Screener.</p>

					<p>You want to bring your movie to the cinema?
                                          The DCP-duplication and delivery to the cinema!</p>

					<p>With the DCP ordering system, you always have an overview
                                           On your orders.</p>
				</label>
			</div>
			<div>
				<div style="color: #E05757; font-weight: bold; margin: 30px auto; height: 20px; font-size: 16pt; text-align: center;">&times;</div>
				<h4>Press representatives</h4>

				<p>For press representatives no registration at Substance Digital is required!</p>

				<p>Pressed downloads can be provided by the lender optionally with a password
                                   Respectively.</p>
				
				<p>Please contact the lender to create a password for protected
                                    Press downloads.</p>
			</div>
		</div>
	<div style="text-align:center; font-size: 8pt; margin-bottom: 1em;">
		Do not fit into any of the above categories? Contact us: <a href="mailto:">xyz@gmail.com</a>
	</div>

		<div style="text-align:center;">
                    <button type="submit" id="form_weiter" name="form[weiter]" class="kf-btn kf-btn1">Enter</button>
                    
                </div>
	<input type="hidden" id="form_username" name="form[username]" /><input type="hidden" id="form_email" name="form[email]" /><input type="hidden" id="form_name" name="form[name]" /><input type="hidden" id="form_contact_person_firstname" name="form[contact_person_firstname]" /><input type="hidden" id="form_contact_person_lastname" name="form[contact_person_lastname]" /><input type="hidden" id="form_contact_person_mail" name="form[contact_person_mail]" /><input type="hidden" id="form_contact_person_phone" name="form[contact_person_phone]" /><input type="hidden" id="form_contact_str" name="form[contact_str]" /><input type="hidden" id="form_contact_zip" name="form[contact_zip]" /><input type="hidden" id="form_contact_city" name="form[contact_city]" /><input type="hidden" id="form_contact_phone" name="form[contact_phone]" /><input type="hidden" id="form_contact_mail" name="form[contact_mail]" /><input type="hidden" id="form_shipping_str" name="form[shipping_str]" /><input type="hidden" id="form_shipping_zip" name="form[shipping_zip]" /><input type="hidden" id="form_shipping_city" name="form[shipping_city]" /><input type="hidden" id="form_shipping_phone" name="form[shipping_phone]" /><input type="hidden" id="form_tech_contact_person_firstname" name="form[tech_contact_person_firstname]" /><input type="hidden" id="form_tech_contact_person_lastname" name="form[tech_contact_person_lastname]" /><input type="hidden" id="form_tech_contact_person_mail" name="form[tech_contact_person_mail]" /><input type="hidden" id="form_tech_contact_person_phone" name="form[tech_contact_person_phone]" /><input type="hidden" id="form__token" name="form[_token]" value="" /></form>
	</div>
</div>

<script type="text/javascript" src="media/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="media/lib/jquery-ui/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="media/lib/jquery-ui/development-bundle/ui/i18n/jquery.ui.datepicker-de.js"></script>
<script type="text/javascript" src="media/lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="media/lib/typeahead.js/typeahead.min.js"></script>
<script type="text/javascript" src="media/lib/phpjs/date.js"></script>
<script type="text/javascript" src="media/lib/fleximg.js/scale.js"></script>
<script type="text/javascript" src="media/lib/bower_components/hammerjs/dist/jquery.hammer.js"></script>
<script type="text/javascript" src="media/lib/bs-switch/js/bootstrap-switch.js"></script>
<script type="text/javascript">scale.init();</script>

<script type="text/javascript">
$(window).ready( function() {
	$('input:radio').change( function() {
		$('input:radio').parent().removeClass('selected');
		$(this).parent().addClass('selected');
	}).first().change();
});
</script>

<script type="text/javascript">
	var _paq = _paq || [];
	_paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
	_paq.push(["setCookieDomain", "*.#"]);
	_paq.push(["trackPageView"]);
	_paq.push(["enableLinkTracking"]);

	(function() {
		var u=(("https:" == document.location.protocol) ? "https" : "http") + "://filme.kinofreund.com/piwik/";
		_paq.push(["setTrackerUrl", u+"piwik.php"]);
		_paq.push(["setSiteId", "1"]);
		var d=document, g=d.createElement("script"), s=d.getElementsByTagName("script")[0]; g.type="text/javascript";
		g.defer=true; g.async=true; g.src=u+"piwik.js"; s.parentNode.insertBefore(g,s);
	})();
</script></body>
    
</html>
