<?php

$field_first_name = $_POST['names'];

$field_email = $_POST['email'];

$field_phone = $_POST['phone'];

$field_message = $_POST['message'];

$mail_to = 'ventas@syscopyperu.com,info@seocreativos.com,reycastillo08@hotmail.com';

$subject = 'Cotizacion Venta de Toners en Lima'.$field_first_name;

$body_message = 'desde: '.$field_first_name."\n";

$body_message .= 'correo: '.$field_email."\n";

$body_message .= 'Telefono: '.$field_phone."\n";

$body_message .= 'Mensaje: '.$field_message."\n";

$headers = 'From: '.$field_email."\r\n";

$headers .= 'Reply-To: '.$field_email."\r\n";

$mail_status = mail($mail_to, $subject, $body_message, $headers);


if ($mail_status) { ?>
	<script language="javascript" type="text/javascript">
		//alert('Gracias por el mensaje. Te contactaremos a la brevedad.');
		window.location = 'index.html';
	</script>
<?php
}
else { ?>
	<script language="javascript" type="text/javascript">
		//alert('Message failed. Please, send an email to webmaster@seocreativos.com');
		window.location = 'index.html';
	</script>
<?php
}
?>