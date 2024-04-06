<section class="bg-gray-50 dark:bg-gray-900 py-3 sm:py-5 md:py-16">
    <div class="px-4 mx-auto max-w-screen-2xl lg:px-12">
        <div class="relative overflow-hidden bg-white shadow-md dark:bg-gray-800 sm:rounded-lg">
 
                <div class="flex flex-col flex-shrink-0 space-y-3 md:flex-row md:items-center justify-end md:space-y-3 md:space-x-3">
                    <a href="index.php?page=Admin_Formulario&mode=INS">
                        <button type="button"
                            class="flex items-center justify-center px-4 py-2 text-sm font-medium text-white rounded-lg bg-secundary ">
                            <svg class="h-3.5 w-3.5 mr-2" fill="currentColor" viewbox="0 0 20 20"
                                xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                <path clip-rule="evenodd" fill-rule="evenodd"
                                    d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" />
                            </svg>
                            Agregar Nuevo Servicio
                        </button>
                    </a>
                </div>
                
            
            <div class="overflow-x-auto">
                <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                        <tr>
                            <th scope="col" class="p-4 py-3">ID</th>
                            
                            <th scope="col" class="px-4 py-3">Producto</th>
                            <th scope="col" class="px-4 py-3">Categoria</th>
                            <th scope="col" class="px-4 py-3">Stock</th>
                            <th scope="col" class="px-4 py-3">Precio</th>
                            <th scope="col" class="px-4 py-3">Plataforma</th>
                            <th scope="col" class="px-4 py-3">Tipo Producto</th>
                            <th scope="col" class="px-4 py-3"></th>

                        </tr>
                    </thead>
                    <tbody>

                        {{foreach servicios}}
                        <tr class="border-b dark:border-gray-600 hover:bg-gray-100 dark:hover:bg-gray-700">
                            <td class="w-4 px-4 py-3">
                                {{servicioId}}
                            </td>
                            <th scope="row"
                                class="flex items-center px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                <img src="/{{~BASE_DIR}}/imagenes/{{servicioImagen}}" alt="servicio imagen"
                                    class="w-auto h-10 mr-3">
                                {{servicioNombre}}
                            </th>
                            <td class="px-4 py-2">
                                <span
                                    class="bg-primary-100 text-primary-800 text-xs font-medium px-2 py-0.5 rounded dark:bg-primary-900 dark:text-primary-300">{{servicioCategoria}}</span>
                            </td>
                            <td class="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                <div class="flex items-center">
                                    <div class="inline-block w-4 h-4 mr-2 rounded-full {{stockStatus}}"></div>
		                                {{stock}}
                                </div>
                            </td>
                            <td class="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                ${{servicioPrecio}}</td>
                            <td class="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                {{servicioPlataforma}}</td>

                            <td class="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                <div class="flex items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 24 24" fill="currentColor"
                                        class="w-5 h-5 mr-2 text-gray-400" aria-hidden="true">
                                        <path
                                            d="M2.25 2.25a.75.75 0 000 1.5h1.386c.17 0 .318.114.362.278l2.558 9.592a3.752 3.752 0 00-2.806 3.63c0 .414.336.75.75.75h15.75a.75.75 0 000-1.5H5.378A2.25 2.25 0 017.5 15h11.218a.75.75 0 00.674-.421 60.358 60.358 0 002.96-7.228.75.75 0 00-.525-.965A60.864 60.864 0 005.68 4.509l-.232-.867A1.875 1.875 0 003.636 2.25H2.25zM3.75 20.25a1.5 1.5 0 113 0 1.5 1.5 0 01-3 0zM16.5 20.25a1.5 1.5 0 113 0 1.5 1.5 0 01-3 0z" />
                                    </svg>
                                    {{servicioTipo}}
                                </div>
                            </td>

                            <td class="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                <div class="flex items-center justify-evenly" >
                                    <a class="bg-yellow-200 py-1 px-2 rounded-lg text-yellow-800"
                                         href="index.php?page=Admin_Formulario&mode=UPD&id={{servicioId}}">Editar</a>
                                    

                                    <a class="bg-green-200 py-1 px-2 rounded-lg text-green-800"
                                        href="index.php?page=Admin_Formulario&mode=DSP&id={{servicioId}}">Ver</a>
                         

                                    <a class="bg-red-200 py-1 px-2 rounded-lg text-red-800"
                                         href="index.php?page=Admin_Formulario&mode=DEL&id={{servicioId}}">Eliminar</a>
                                 

                                </div>
                            </td>
                    </tbody>
                    {{endfor servicios}}
                </table>
            </div>

        </div>
    </div>
</section>