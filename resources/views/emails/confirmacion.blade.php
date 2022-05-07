<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SYSCOPY PERU</title>
	<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
	<div class="container m-5">
		<img src="http://syscopyperu.com/img/logo.png" class="mb-5">
		<h1 class="text-xl font-bold text-red-800">Libro de Reclamaciones</h1>
		<p class="mb-4">A continuación se observa el detalle de lo que ingresó en su formulario.</p>

		<h1 class="text-xl font-bold mb-4 text-red-800">Datos del Proveedor</h1>

		<h1 class="text-xl font-bold uppercase">razon social</h1>
		<p class="mb-4">{{ $libro->tienda->empresa }}</p>

		<h1 class="text-xl font-bold uppercase">ruc</h1>
		<p class="mb-4">{{ $libro->tienda->ruc }}</p>

		<h1 class="text-xl font-bold uppercase">direccion</h1>
		<p class="mb-4">{{ $libro->tienda->direccion }}</p>

		<h1 class="text-xl font-bold uppercase">codigo de serie</h1>
		<p class="mb-4">{{ $libro->ano.'WEB-'.$libro->id }}</p>

		<h1 class="text-xl font-bold uppercase">Fecha y Hora</h1>
		<p class="mb-8">{{ $libro->fecha.' '.$libro->hora }}</p>

		<h1 class="text-xl font-bold mb-4 text-red-800">Datos del consumidor</h1>

		<h1 class="text-xl font-bold uppercase">nombres y apellidos</h1>
		<p class="mb-4">{{ $libro->cliente }}</p>

		<h1 class="text-xl font-bold uppercase">Documento de Identidad</h1>
		<p class="mb-4">{{ $libro->tipodocumento->nombre.' '.$libro->documento }}</p>

		<h1 class="text-xl font-bold uppercase">domicilio</h1>
		<p class="mb-4">{{ $libro->domicilio }}</p>

		<h1 class="text-xl font-bold uppercase">distrito</h1>
		<p class="mb-4">{{ $libro->distrito->nombre }}</p>

		<h1 class="text-xl font-bold uppercase">e-mail</h1>
		<p class="mb-4">{{ $libro->email }}</p>

		<h1 class="text-xl font-bold uppercase">teléfono celular</h1>
		<p class="mb-4">{{ $libro->celular }}</p>

		<h1 class="text-xl font-bold uppercase">teléfono</h1>
		<p class="mb-8">{{ $libro->telefono }}</p>

		<h1 class="text-xl font-bold mb-4 text-red-800">Datos del bien contratado</h1>

		<h1 class="text-xl font-bold uppercase">producto/servicio</h1>
		<p class="mb-4">{{ ($libro->bien == 'P') ? 'Producto' : 'Servicio' }}</p>

		<h1 class="text-xl font-bold uppercase">descripción</h1>
		<p class="mb-4">{{ ($libro->concepto->tipo == 'R') ? 'Reclamo' : 'Queja' }}</p>

		<h1 class="text-xl font-bold uppercase">monto reclamado</h1>
		<p class="mb-8">{{ $libro->importe }}</p>

		<h1 class="text-xl font-bold mb-4 text-red-800">Datos de la reclamación y pedido del consumidor</h1>

		<h1 class="text-xl font-bold uppercase">reclamo</h1>
		<p class="mb-4">{{ $libro->concepto->nombre }}</p>

		<h1 class="text-xl font-bold uppercase">canal del pedido</h1>
		<p class="mb-4">{{ $libro->canal->nombre }}</p>

		<h1 class="text-xl font-bold uppercase">detalle</h1>
		<p class="mb-4">{{ $libro->detalle }}</p>

		<h1 class="text-xl font-bold uppercase">pedido del consumidor</h1>
		<p class="mb-10">{{ $libro->pedido }}</p>

		<p class="text-center mb-8">Este e-mail es un anuncio de syscopyperu.com. Te enviamos este e-mail porque inscribiste tu dirección de correo en nuestros registros para recibir novedades, ofertas, promociones y más.<br>Por favor, no responder este correo, si necesitas más información comuníquese al 761-1603.</p>

		<div class="flex justify-center mb-8">
			<div class="px-8"><span class="text-blue-700"><a href="https://api.whatsapp.com/send/?phone=%2B51996311447&text=Bienvenido+a+%2ASyscopy%2A+%2APer%C3%BA%2A+Puedes+ubicarnos+en+Jr.+Lampa+1170+y+1038%2C+Estamos+Para+Ayudarte+%21%21%21&app_absent=0" target="_blank"><svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" class="text-blue-700" viewBox="0 0 24 24"><path d="M12.031 6.172c-3.181 0-5.767 2.586-5.768 5.766-.001 1.298.38 2.27 1.019 3.287l-.582 2.128 2.182-.573c.978.58 1.911.928 3.145.929 3.178 0 5.767-2.587 5.768-5.766.001-3.187-2.575-5.77-5.764-5.771zm3.392 8.244c-.144.405-.837.774-1.17.824-.299.045-.677.063-1.092-.069-.252-.08-.575-.187-.988-.365-1.739-.751-2.874-2.502-2.961-2.617-.087-.116-.708-.94-.708-1.793s.448-1.273.607-1.446c.159-.173.346-.217.462-.217l.332.006c.106.005.249-.04.39.298.144.347.491 1.2.534 1.287.043.087.072.188.014.304-.058.116-.087.188-.173.289l-.26.304c-.087.086-.177.18-.076.354.101.174.449.741.964 1.201.662.591 1.221.774 1.394.86s.274.072.376-.043c.101-.116.433-.506.549-.68.116-.173.231-.145.39-.087s1.011.477 1.184.564.289.13.332.202c.045.072.045.419-.1.824zm-3.423-14.416c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm.029 18.88c-1.161 0-2.305-.292-3.318-.844l-3.677.964.984-3.595c-.607-1.052-.927-2.246-.926-3.468.001-3.825 3.113-6.937 6.937-6.937 1.856.001 3.598.723 4.907 2.034 1.31 1.311 2.031 3.054 2.03 4.908-.001 3.825-3.113 6.938-6.937 6.938z"/></svg></a></span></div>
			<div class="px-8"><span class="text-blue-700"><a href="https://www.facebook.com/syscopyperu" target="_blank"><svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24"><path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm3 8h-1.35c-.538 0-.65.221-.65.778v1.222h2l-.209 2h-1.791v7h-3v-7h-2v-2h2v-2.308c0-1.769.931-2.692 3.029-2.692h1.971v3z"/></svg></a></span></div>
			<div class="px-8"><span class="text-blue-700"><a href="http://syscopy.imarxle.com/" target="_blank"><svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24"><path d="M17.033 6.966c.584.583.584 1.529 0 2.112l-7.955 7.956c-.583.583-1.529.583-2.112 0-.583-.583-.583-1.529 0-2.112l7.956-7.956c.582-.583 1.528-.583 2.111 0zm-9.138 13.386c-1.171 1.171-3.076 1.171-4.248 0-1.171-1.171-1.171-3.077 0-4.248l5.639-5.632c-1.892-.459-3.971.05-5.449 1.528l-2.147 2.147c-2.254 2.254-2.254 5.909 0 8.163 2.254 2.254 5.909 2.254 8.163 0l2.147-2.148c1.477-1.477 1.986-3.556 1.527-5.448l-5.632 5.638zm6.251-18.662l-2.146 2.148c-1.478 1.478-1.99 3.553-1.53 5.445l5.634-5.635c1.172-1.171 3.077-1.171 4.248 0 1.172 1.171 1.172 3.077 0 4.248l-5.635 5.635c1.893.459 3.968-.053 5.445-1.53l2.146-2.147c2.254-2.254 2.254-5.908 0-8.163-2.253-2.254-5.908-2.254-8.162-.001z"/></svg></a></span></div>
		</div>
		<div class="flex justify-center">
			<div>
				<p class="leading-10 text-center italic text-red-600">SYSCOPY COPYRIGHT © 2021 - TODOS LOS DERECHOS RESERVADOS<br>Ubicanos en:<br>Jr. Lampa 1083 - Cercado de Lima - Lima</p>
			</div>
		</div>
	</div>
</body>
</html>
