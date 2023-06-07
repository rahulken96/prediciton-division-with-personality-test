<header class="z-10 py-4 bg-white shadow-md ">
    <div class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600">
        <!-- Mobile hamburger -->
        <button class="p-1 mr-5 -ml-1 rounded-md md:hidden focus:outline-none focus:shadow-outline-purple"
            @click="toggleSideMenu" aria-label="Menu">
            <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path>
            </svg>
        </button>
        <div class="flex justify-center flex-1 lg:mr-32">
            <div class="relative w-full max-w-xl mr-6 ">
            </div>
        </div>
        <ul class="flex items-center flex-shrink-0 space-x-6">
            <li class="relative">
                <button class="align-middle rounded-full focus:shadow-outline-green focus:outline-none" @click="toggleProfileMenu" @keydown.escape="closeProfileMenu" aria-label="Account" aria-haspopup="true">
                    <div class="object-cover w-8 h-8 p-1 rounded-full text-green-500 dark:text-green-300">
                        <i class="material-icons">account_box</i>
                    </div>
                </button>
                <template x-if="isProfileMenuOpen">
                    <ul x-transition:leave="transition ease-in duration-150" x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0" @click.away="closeProfileMenu" @keydown.escape="closeProfileMenu" class="absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md" aria-label="submenu">
                        <li class="flex">
                            <a class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800" href="{{ route('home') }}">
                                <i class="w-4 mr-3 material-icons">home</i>
                                <span>Halaman Utama</span>
                            </a>
                        </li>
                        <li class="flex">
                            <a class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800" href="{{ route('logout') }}">
                                <i class="w-4 mr-3 material-icons">logout</i>
                                <span>Log out</span>
                            </a>
                        </li>
                    </ul>
                </template>
            </li>
        </ul>
    </div>
</header>
