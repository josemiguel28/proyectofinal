<section class="bg-white dark:bg-gray-900">
		<div class="py-8 px-4 mx-auto max-w-2xl lg:py-16">
				<h2 class="mb-4 text-xl font-bold text-gray-900 dark:text-white">{{modeDsc}}</h2>

				<form action="index.php?page=Admin_Formulario&mode={{mode}}&id={{Id}}" method="post"
				      enctype="multipart/form-data">
						<div class="grid gap-4 sm:grid-cols-2 sm:gap-6">

								<div class="sm:col-span-2" style="display: none">
										<label for="idServicio"
										       class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">ID</label>
										<input type="text" name="servicioId" id="idServicio" value="{{servicioId}}"
										       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 "
										       readonly hidden="hidden">
								</div>

								<div class="sm:col-span-2">
										<label for="nombreServicio"
										       class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nombre del
												Servicio</label>
										<input type="text" name="nombreServicio" id="nombreServicio" value="{{nombreServicio}}"
										       class="border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
										       placeholder="Ingresa un nombre" {{isReadOnly}}>
								</div>


								<div class="w-full">
										<label for="servicioStock"
										       class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Stock</label>
										<input type="number" name="servicioStock" id="servicioStock" value="{{servicioStock}}"
										       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 "
										       placeholder="Ej. 5" required="" {{isReadOnly}}>
								</div>
								<div class="w-full">
										<label for="servicioPrecio"
										       class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Precio</label>
										<input type="number" name="servicioPrecio" id="servicioPrecio" value="{{servicioPrecio}}"
										       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
										       placeholder="$99.00" required="" {{isReadOnly}}>
								</div>
								<div>
										<label for="servicioCategoria"
										       class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Categoria</label>
										<select name="servicioCategoria" id="servicioCategoria"
										        class="bg-gray-50 border border-gray-300 text-black text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5"
										        {{isReadOnly}}>
												<option>--Seleciona una Categoria--</option>
												{{foreach servicioCategoriaOpciones}}
												<option value="{{value}}" {{selected}}>{{text}}</option>
												{{endfor servicioCategoriaOpciones}}
										</select>
								</div>

								<div>
										<label for="plataforma"
										       class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Plataforma</label>
										<select name="servicioPlataforma" id="plataforma"
										        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5"
										        {{isReadOnly}}>
												<option value="">--Seleciona una plataforma--</option>

												{{foreach servicioPlataformaOpciones}}
												<option value="{{value}}" {{selected}}>{{text}}</option>
												{{endfor servicioPlataformaOpciones}}
										</select>
								</div>

								<div>
										<label for="tipoProducto" class="block mb-2 text-sm font-medium text-gray-900">Tipo
												de Producto</label>
										<select name="servicioTipo" id="tipoProducto"
										        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 "
										        {{isReadOnly}}>
												<option selected>--Seleciona el tipo de servicio</option>

												{{foreach servicioTipoOpciones}}
												<option value="{{value}}" {{selected}}>{{text}}</option>
												{{endfor servicioTipoOpciones}}
										</select>
								</div>
								<div class="sm:col-span-2">
										<label for="servicioDescripcion"
										       class="block mb-2 text-sm font-medium text-gray-900">Descripcion</label>
										<textarea id="servicioDescripcion" name="servicioDescripcion"
										          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
										          placeholder="Descripcion del servicio" required=""
										          {{isReadOnly}}>{{servicioDescripcion}}</textarea>

										<div class="sm:col-span-2">
												<label
																class="block mt-2 mb-2 text-sm font-medium text-gray-900 dark:text-white">Imagen</label>
												<input type="file" name="servicioImagen" id="servicioImagen"
												       accept="image/jpeg, image/png, image/svg+xml"
												       class="block py-5 px-5 w-full border border-gray-300 rounded-lg">
												<img src="/{{BASE_DIR}}/imagenes/{{servicioImagen}}" alt="" width="20" height="20">
										</div>
								</div>


						</div>

						<div class="flex w-full gap-2 justify-end pt-5 sm:mt-5">

								{{if showActions}}
								<input type="submit" value="Confirmar"
								       class="bg-terciary hover:bg-gray-800 text-white font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">
								{{endif showActions}}

								<input onclick="location.href='index.php?page=Admin_ListaServicios'" value="Cancelar"
								       class="bg-neutral-400 text-white hover:bg-neutral-600 hover:cursor-default focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm  sm:w-auto text-center">


						</div>
				</form>

		</div>
</section>