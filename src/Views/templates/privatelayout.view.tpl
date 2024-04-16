<!DOCTYPE html>
<html>

<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>{{SITE_TITLE}}</title>
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

		<!--<link rel="stylesheet" href="/{{BASE_DIR}}/public/css/appstyle.css"/> -->
		<script src="https://kit.fontawesome.com/{{FONT_AWESOME_KIT}}.js" crossorigin="anonymous"></script>
		<!-- material icons -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

		<link rel="stylesheet" href="/{{BASE_DIR}}/public/output.css"/>
		{{foreach SiteLinks}}
		<link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}"/>
		{{endfor SiteLinks}}
		{{foreach BeginScripts}}
		<script src="/{{~BASE_DIR}}/{{this}}"></script>
		{{endfor BeginScripts}}
</head>

<body>

<!--
<header>
    <input type="checkbox" class="menu_toggle" id="menu_toggle"/>
    <label for="menu_toggle" class="menu_toggle_icon">
        <div class="hmb dgn pt-1"></div>
        <div class="hmb hrz"></div>
        <div class="hmb dgn pt-2"></div>
    </label>
    <h1>{{SITE_TITLE}}</h1>
    <nav id="menu">
        <ul>
            <li><a href="index.php?page={{PRIVATE_DEFAULT_CONTROLLER}}"><i class="fas fa-home"></i>&nbsp;Inicio</a></li>
            {{foreach NAVIGATION}}
            <li><a href="{{nav_url}}">{{nav_label}}</a></li>
            {{endfor NAVIGATION}}
            <li><a href="index.php?page=sec_logout"><i class="fas fa-sign-out-alt"></i>&nbsp;Salir</a></li>
        </ul>
    </nav>
    {{with login}}
    <span class="username">{{userName}} <a href="index.php?page=sec_logout"><i
            class="fas fa-sign-out-alt"></i></a></span>
    {{endwith login}}
</header>
-->


<nav class="bg-primary">

		<div class="w-full flex flex-wrap items-center justify-evenly mx-auto p-4">

				<a href="index.php" class="flex items-center space-x-3 rtl:space-x-reverse">
						<picture>
								<source srcset="/{{BASE_DIR}}/public/img/webp/logo.webp" type="image/webp">
								<source srcset="/{{BASE_DIR}}/public/img/logo.jpg" type="image/jpeg">
								<img loading="lazy" class="w-32" src="/{{BASE_DIR}}/public/img/logo.jpg" alt="logo">
						</picture>
				</a>

				<div class="md:order-1 w-3/5">
						<button type="button" data-collapse-toggle="navbar-search" aria-controls="navbar-search"
						        aria-expanded="false"
						        class="md:hidden text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-2.5 me-1">
								<svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
								     viewBox="0 0 20 20">
										<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
										      d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
								</svg>
								<span class="sr-only">Search</span>
						</button>

						<div class="relative hidden md:block w-3/5 mx-auto">
								<div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
										<svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true"
										     xmlns="http://www.w3.org/2000/svg"
										     fill="none" viewBox="0 0 20 20">
												<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
												      d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
										</svg>
										<span class="sr-only">Search icon</span>
								</div>
								<input type="text" id="search-navbar"
								       class="block w-full p-2 ps-10 text-sm text-gray-900 border-0 rounded-full bg-secundary focus:text-white"
								       placeholder="Buscar Juegos...">
						</div>
						<button data-collapse-toggle="navbar-search" type="button"
						        class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
						        aria-controls="navbar-search" aria-expanded="false">
								<span class="sr-only">Open main menu</span>
								<svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
								     viewBox="0 0 17 14">
										<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
										      d="M1 1h15M1 7h15M1 13h15"/>
								</svg>
						</button>
				</div>

				<div class="flex align-center md:order-2">
						<a href="index.php?page=Carrito_Carrito">
								<button type="button"
								        class="text-white bg-secundary hover:bg-gray-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center me-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
										<svg class="w-3.5 h-3.5 me-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
										     fill="currentColor"
										     viewBox="0 0 18 21">
												<path d="M15 12a1 1 0 0 0 .962-.726l2-7A1 1 0 0 0 17 3H3.77L3.175.745A1 1 0 0 0 2.208 0H1a1 1 0 0 0 0 2h.438l.6 2.255v.019l2 7 .746 2.986A3 3 0 1 0 9 17a2.966 2.966 0 0 0-.184-1h2.368c-.118.32-.18.659-.184 1a3 3 0 1 0 3-3H6.78l-.5-2H15Z"/>
										</svg>
										Carrito
								</button>
						</a>

						<a href="index.php?page=Ordenes_Ordenes" class="mx-2">
								<button type="button"
								        class="text-white bg-secundary hover:bg-gray-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center me-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
										<i class="material-icons" style="font-size: 20px; ">assignment</i>
										Mis Ordenes
								</button>
						</a>


						<button type="button" class="text-white bg-terciary hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
								<i class="material-icons" style="font-size: 20px; ">account_circle</i>
								{{with login}}
								<span class="username">{{userName}} <a href="index.php?page=sec_logout"><i
												class="fas fa-sign-out-alt"></i></a></span>
								{{endwith login}}
						</button>
				</div>

		</div>

		<div class="w-full flex justify-evenly items-center bg-secundary p-4">

				<li class="list-none">
						<a class="text-white" href="index.php?page={{PUBLIC_DEFAULT_CONTROLLER}}"><i class="fas fa-home"></i>&nbsp;Inicio</a>
				</li>

				<li class="list-none">
						<a class="text-white" href="index.php?page=Servicios_Ofertas"><i
										class="fas fa-home"></i>&nbsp;Ofertas</a>
				</li>

				<li class="list-none">
						<a class="text-white" href="index.php?page=Servicios_Juegos"><i
										class="fas fa-home"></i>&nbsp;Juegos</a>
				</li>

				<li class="list-none">
						<a class="text-white" href="index.php?page=Servicios_GiftCards"><i class="fas fa-home"></i>&nbsp;
								GiftCards</a>
				</li>


				{{foreach NAVIGATION}}
				<li class="list-none">
						<a class="text-white" href="{{nav_url}}">{{nav_label}}</a>
				</li>
				{{endfor NAVIGATION}}
				<li class="list-none" 
				><a href="index.php?page=sec_logout"><i class="material-icons" style="color: white" >exit_to_app</i></a></li>

		</div>
</nav>


<main>
		{{{page_content}}}
</main>
<footer>
		<div>Todo los Derechos Reservados {{~CURRENT_YEAR}} &copy;</div>
</footer>
{{foreach EndScripts}}
<script src="/{{~BASE_DIR}}/{{this}}"></script>
{{endfor EndScripts}}
</body>
</html>

