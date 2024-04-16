<form action="index.php?page=checkout_checkout" method="post">
  <button type="submit">Place Order</button>
		
		{{foreach products}}

		<div class="flex justify-center gap-4 flex-wrap flex-col">
				<label for="nombre">Nombre</label>
				<input type="text" id="nombre"  name="nombre" value="{{Nombre}}" readonly>

				<label for="precio">Precio</label>
				<input type="text" id="precio" name="precio" value="{{Precio}}" readonly>

				<label for="cantidad">Cantidad</label>
				<input type="text" id="cantidad" name="cantidad" value="{{Cantidad}}" readonly>

				<label for="categoria">Categoria</label>
				<input type="text" id="categoria" name="categoria" value="{{Categoria}}" readonly>

				<label for="ID">ID</label>
				<input type="text" id="ID" name="id" value="{{ID}}" readonly>

				<label for="descripcion">Descripcion</label>
				<input type="text" id="descripcion" name="descripcion" value="{{Descripcion}}" readonly>
				
				
		</div> 

		
		
		
		
		
		
		{{endfor products}}
		
</form>
