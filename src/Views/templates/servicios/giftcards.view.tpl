<!-- hero --><section class="relative h-[75vh] w-full">    <img src="/{{BASE_DIR}}/public/imgs/paginaGiftcards/banner.svg" alt="banner ofertas"         class="absolute h-full w-full object-cover">    <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-white text-2xl">        <p class="text-7xl uppercase italic font-bold">Giftcards</p>    </div></section><section>    <!-- offer header -->    <div class="w-full flex justify-center items-center px-6 py-12 text-center md:px-12 lg:text-left">        <div class="flex items-center">            <img src="/{{BASE_DIR}}/public/imgs/ofertas/Gift.svg" alt="" srcset="">            <h1 class="uppercase text-2xl px-4 text-cuaternary">PlayStation</h1>        </div>    </div>    <!--offer header end-->    <img class="mx-auto -mt-10 w-full" src="/{{BASE_DIR}}/public/imgs/ofertas/Line.svg" alt="">		<!--games wrapper-->		<div class="flex flex-center items-center mx-auto px-12 py-12 gap-8 justify-between flex-wrap">				{{foreach products}}				<!--card -->				<div class="w-54 max-w-sm bg-white border border-gray-200 rounded-lg shadow ">						<a href="#">								<img class="p-8 rounded-t-lg mx-auto object-cover max-h-64" src="/{{~BASE_DIR}}/imagenes/{{productoImagen}}" alt="product image" />						</a>						<div class="px-5 pb-5">								<a href="#">										<h5 class="text-xl text-center font-semibold tracking-tight text-gray-900 dark:text-white">												{{productoNombre}} - {{plataformaNombre}} </h5>								</a>								<div class="flex items-center mt-2.5 mb-5 justify-center">										<div class="flex items-center space-x-1 rtl:space-x-reverse">												<svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"												     fill="currentColor" viewBox="0 0 22 20">														<path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>												</svg>												<svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"												     fill="currentColor" viewBox="0 0 22 20">														<path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>												</svg>												<svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"												     fill="currentColor" viewBox="0 0 22 20">														<path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>												</svg>												<svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"												     fill="currentColor" viewBox="0 0 22 20">														<path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>												</svg>												<svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true"												     xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">														<path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>												</svg>										</div>										<span class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3">5.0</span>								</div>								<div class="flex items-center justify-between flex-col">										<span class="text-3xl font-bold text-gray-900 dark:text-white pb-5">${{productoPrecio}}.00</span>										<div>												<!--												<a href="#" class="text-white bg-primary hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-full text-sm px-12 py-2 text-center ">														Add to cart												</a>												-->												<button type="button"												        class="text-white bg-secundary font-medium rounded-full text-sm px-12 py-2 text-center inline-flex items-center me-2 ">														<svg class="w-3.5 h-3.5 me-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"														     fill="currentColor" viewBox="0 0 18 21">																<path d="M15 12a1 1 0 0 0 .962-.726l2-7A1 1 0 0 0 17 3H3.77L3.175.745A1 1 0 0 0 2.208 0H1a1 1 0 0 0 0 2h.438l.6 2.255v.019l2 7 .746 2.986A3 3 0 1 0 9 17a2.966 2.966 0 0 0-.184-1h2.368c-.118.32-.18.659-.184 1a3 3 0 1 0 3-3H6.78l-.5-2H15Z"/>														</svg>														Comprar												</button>										</div>								</div>						</div>				</div>				<!--card end-->				{{endfor products}}		</div>		<!--games wrapper end--></section>