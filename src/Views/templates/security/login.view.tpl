<section class="fullCenter">


    <form class="space-y-4 md:space-y-6" method="post" action="index.php?page=sec_login{{if redirto}}&redirto={{redirto}}{{endif redirto}}">

        <!--
        <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
            <h1 class="col-12">Iniciar Sesión</h1>
        </section>
        <section class="depth-1 py-5 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
            <div class="row">
                <label class="col-12 col-m-4 flex align-center" for="txtEmail">Correo Electrónico</label>
                <div class="col-12 col-m-8">
                    <input class="width-full" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}"/>
                </div>
                {{if errorEmail}}
                <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorEmail}}</div>
                {{endif errorEmail}}
            </div>
            <div class="row">
                <label class="col-12 col-m-4 flex align-center" for="txtPswd">Contraseña</label>
                <div class="col-12 col-m-8">
                    <input class="width-full" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}"/>
                </div>
                {{if errorPswd}}
                <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorPswd}}</div>
                {{endif errorPswd}}
            </div>
            {{if generalError}}
            <div class="row">
                {{generalError}}
            </div>
            {{endif generalError}}
            <div class="row right flex-end px-4">
                <button class="primary" id="btnLogin" type="submit">Iniciar Sesión</button>
            </div>
        </section>
-->
        
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <a href="#" class="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
                Digital Games
            </a>
            <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                        Inicia Sesion en tu cuenta
                    </h1>

                    <div>
                        <label for="txtEmail"
                               class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tu email</label>
                        <input type="email" name="txtEmail" id="txtEmail"
                               class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                               placeholder="name@company.com" value="{{txtEmail}}" required="">
                    </div>

                    {{if errorEmail}}
                    <div>{{errorEmail}}</div>
                    {{endif errorEmail}}

                    <div>
                        <label for="txtPswd"
                               class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Contraseña</label>
                        <input type="password" name="txtPswd" id="txtPswd" placeholder="••••••••"
                               class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                               value={{txtPswd}} required="">
                    </div>
                    {{if errorPswd}}
                    <div>{{errorPswd}}</div>
                    {{endif errorPswd}}

                    {{if generalError}}
                    <div>
                        {{generalError}}
                    </div>
                    {{endif generalError}}

                    <button id="btnLogin" type="submit"
                            class="w-full text-white bg-primary hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                        Iniciar Sesión
                    </button>
                    <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                        ¿Todavía no tiene una cuenta? 
                        <a href="index.php?page=Sec_Register" class="font-medium text-primary-600 hover:underline dark:text-primary-500">
                            Registrarse
                        </a>
                    </p>

                </div>
            </div>
        </div>
       
    </form>
</section>
