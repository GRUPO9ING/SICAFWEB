<?php
/**
 * This example shows making an SMTP connection with authentication.
 */
//Import the PHPMailer class into the global namespace
use PHPMailer\PHPMailer\PHPMailer;
//SMTP needs accurate times, and the PHP time zone MUST be set
//This should be done in your php.ini, but this is how to do it if you don't have access to that
date_default_timezone_set('Etc/UTC');
require 'view/recuperacion/phpmailer/src/PHPMailer.php';
require 'view/recuperacion/phpmailer/src/Exception.php';
require 'view/recuperacion/phpmailer/src/SMTP.php';
require 'view/recuperacion/phpmailer/src/OAuth.php';
require 'view/recuperacion/phpmailer/src/POP3.php';

//Create a new PHPMailer instance
$mail = new PHPMailer;
//Tell PHPMailer to use SMTP
$mail->isSMTP();
//Enable SMTP debugging
// 0 = off (for production use)
// 1 = client messages
// 2 = client and server messages
$mail->CharSet = 'UTF-8';
$message = file_get_contents('view/recuperacion/enviar.html');
$message = str_replace('%codigo%', $_POST['codigo'], $message);
$mail->SMTPDebug = 2;
//Set the hostname of the mail server
$mail->SMTPSecure = 'tls';
$mail->Host = 'smtp-mail.outlook.com';
//Set the SMTP port number - likely to be 25, 465 or 587
$mail->Port = 25;
//Whether to use SMTP authentication
$mail->SMTPAuth = true;
$mail->Timeout = 20;
//Username to use for SMTP authenticationç
$mail->Username = 'ssicafweb@outlook.com';
//Password to use for SMTP authentication
$mail->Password = 'Sicafweb1234';
//Set who the message is to be sent from
$mail->setFrom('ssicafweb@outlook.com', 'Sistema cafetalero web');
//Set an alternative reply-to address
//Set who the message is to be sent to
$mail->addAddress($_POST['correo'] ,$_POST['nombre']);
//Set the subject line
$mail->Subject = 'Correo de recuperacion de contraseña';
//Read an HTML message body from an external file, convert referenced images to embedded,
//convert HTML into a basic plain-text alternative body
$mail->msgHTML($message);
//Replace the plain text body with one created manually
$mail->AltBody = 'This is a plain-text message body';
//send the message, check for errors
if (!$mail->send()) {
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo 'Message sent!';
}
