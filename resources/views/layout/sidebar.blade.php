       <!-- Desktop sidebar -->
       <aside class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0">
           <div class="py-4 text-gray-500 dark:text-gray-400">
               <a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200" href="{{ route('home') }}">
                   <span class="ml-2" style="color: #00BFA6">MBTI</span>
               </a>
               @if (Auth::user()->isAdmin == 1)
                   <span class="text-lg font-bold text-gray-800 dark:text-gray-200">Admin</span>
                   <ul class="mt-6">
                       <li class="relative px-6 py-3">
                           <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                               href="{{ route('admin.dashboard') }}">
                               <i class="material-icons">home</i>
                               <span class="ml-4">Dashboard</span>
                           </a>
                       </li>
                   </ul>
                   <ul>
                       <li class="relative px-6 py-3">
                           <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                               href="{{ route('admin.users') }}">
                               <i class="material-icons">group</i>
                               <span class="ml-4">Akun Penjawab</span>
                           </a>
                       </li>
                   </ul>
                   <ul>
                       <li class="relative px-6 py-3">
                           <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                               href="{{ route('admin.report') }}">
                               <i class="material-icons">content_paste</i>
                               <span class="ml-4">Hasil</span>
                           </a>
                       </li>
                   </ul>
                   <div class="px-6 my-6">
                       <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                           href="{{ route('admin.profile') }}">
                           <i class="material-icons">manage_accounts</i>
                           <span class="ml-4">Ubah Profil</span>
                       </a>
                       {{-- <button @click="openModal"
                           class="flex items-center justify-between w-full px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-green-600 border border-transparent rounded-lg active:bg-green-600 hover:bg-green-700 focus:outline-none focus:shadow-outline-green">
                           Tambah Admin
                           <span class="ml-2" aria-hidden="true">+</span>
                       </button> --}}
                   </div>
               @else
                   <span class="text-lg font-bold text-gray-800 dark:text-gray-200">Dashboard</span>
                   <ul class="mt-6">
                       <li class="relative px-6 py-3">
                           <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                               href="{{ route('users.dashboard') }}">
                               <i class="material-icons">home</i>
                               <span class="ml-4">Dashboard</span>
                           </a>
                       </li>
                   </ul>
                   <ul>
                       <li class="relative px-6 py-3">
                           <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                               href="{{ route('users.profile') }}">
                               <i class="material-icons">manage_accounts</i>
                               <span class="ml-4">Ubah Profil</span>
                           </a>
                       </li>
                   </ul>
               @endif
           </div>
       </aside>

       <!-- Mobile sidebar -->
       <!-- Backdrop -->
       <div x-show="isSideMenuOpen" x-transition:enter="transition ease-in-out duration-150"
           x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
           x-transition:leave="transition ease-in-out duration-150" x-transition:leave-start="opacity-100"
           x-transition:leave-end="opacity-0"
           class="fixed inset-0 z-10 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center">
       </div>
       <aside class="fixed inset-y-0 z-20 flex-shrink-0 w-64 mt-16 overflow-y-auto bg-white dark:bg-gray-800 md:hidden"
           x-show="isSideMenuOpen" x-transition:enter="transition ease-in-out duration-150"
           x-transition:enter-start="opacity-0 transform -translate-x-20" x-transition:enter-end="opacity-100"
           x-transition:leave="transition ease-in-out duration-150" x-transition:leave-start="opacity-100"
           x-transition:leave-end="opacity-0 transform -translate-x-20" @click.away="closeSideMenu"
           @keydown.escape="closeSideMenu">
           <div class="py-4 text-gray-500 dark:text-gray-400">
               <a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200" href="{{ route('home') }}">
                   <span class="ml-2" style="color: #00BFA6">MBTI</span>
               </a>
               @if (Auth::user()->isAdmin == 1)
                   <span class="text-lg font-bold text-gray-800 dark:text-gray-200">Admin</span>
                   <ul class="mt-6">
                       <li class="relative px-6 py-3">
                           <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                               href="{{ route('admin.dashboard') }}">
                               <i class="material-icons">home</i>
                               <span class="ml-4">Dashboard</span>
                           </a>
                       </li>
                   </ul>
                   <ul>
                       <li class="relative px-6 py-3">
                           <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                               href="{{ route('admin.users') }}">
                               <i class="material-icons">group</i>
                               <span class="ml-4">Akun Penjawab</span>
                           </a>
                       </li>
                   </ul>
                   <ul>
                       <li class="relative px-6 py-3">
                           <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                               href="{{ route('admin.report') }}">
                               <i class="material-icons">content_paste</i>
                               <span class="ml-4">Hasil</span>
                           </a>
                       </li>
                   </ul>
                   {{-- <div class="px-6 my-6">
                       <button @click="openModal"
                           class="flex items-center justify-between w-full px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-green-600 border border-transparent rounded-lg active:bg-green-600 hover:bg-green-700 focus:outline-none focus:shadow-outline-green">
                           Tambah Admin
                           <span class="ml-2" aria-hidden="true">+</span>
                       </button>
                   </div> --}}
               @else
                   <span class="text-lg font-bold text-gray-800 dark:text-gray-200">Dashboard</span>
                   <ul class="mt-6">
                       <li class="relative px-6 py-3">
                           <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                               href="{{ route('users.dashboard') }}">
                               <i class="material-icons">home</i>
                               <span class="ml-4">Dashboard</span>
                           </a>
                       </li>
                   </ul>
                   <ul>
                       <li class="relative px-6 py-3">
                           <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                               href="{{ route('users.profile') }}">
                               <i class="material-icons">manage_accounts</i>
                               <span class="ml-4">Ubah Profil</span>
                           </a>
                       </li>
                   </ul>
               @endif
           </div>
       </aside>
       <!-- End Mobile sidebar -->

       <!-- Modal backdrop. This what you want to place close to the closing body tag -->
       <div x-show="isModalOpen" x-transition:enter="transition ease-out duration-150"
           x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
           x-transition:leave="transition ease-in duration-150" x-transition:leave-start="opacity-100"
           x-transition:leave-end="opacity-0"
           class="fixed inset-0 z-30 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center">
           <!-- Modal -->
           <div x-show="isModalOpen" x-transition:enter="transition ease-out duration-150"
               x-transition:enter-start="opacity-0 transform translate-y-1/2" x-transition:enter-end="opacity-100"
               x-transition:leave="transition ease-in duration-150" x-transition:leave-start="opacity-100"
               x-transition:leave-end="opacity-0  transform translate-y-1/2" @click.away="closeModal"
               @keydown.escape="closeModal"
               class="w-full px-6 py-4 overflow-hidden bg-white rounded-t-lg dark:bg-gray-800 sm:rounded-lg sm:m-4 sm:max-w-xl"
               role="dialog" id="modal">
               <!-- Modal body -->
               {{-- <form action="{{ route('admin.register') }}" method="post">
                   @csrf
                   <div class="mt-4 mb-6">
                       <!-- Modal title -->
                       <p class="mb-2 text-lg font-semibold text-gray-700 dark:text-gray-300">
                           Daftar Admin
                       </p>
                       <label class="mt-3 block text-sm">
                           <span class="text-gray-700 dark:text-gray-400">Nama</span>
                           <input
                               class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                               type="text" name="nama" class="form-control" placeholder="Nama Lengkap"
                               required />
                           @error('nama')
                               <span class="invalid-feedback text-red-500" role="alert">
                                   <strong>{{ $message }}</strong>
                               </span>
                           @enderror
                       </label>
                       <label class="block mt-4 text-sm">
                           <span class="text-gray-700 dark:text-gray-400">No. HP</span>
                           <input
                               class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                               type="text" name="noHP" class="form-control" placeholder="No. HP" required />
                           @error('noHP')
                               <span class="invalid-feedback text-red-500" role="alert">
                                   <strong>{{ $message }}</strong>
                               </span>
                           @enderror
                       </label>
                       <label class="block mt-4 text-sm">
                           <span class="text-gray-700 dark:text-gray-400">Email</span>
                           <input
                               class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                               type="text" name="email" class="form-control" placeholder="Email" required />
                           @error('email')
                               <span class="invalid-feedback text-red-500" role="alert">
                                   <strong>{{ $message }}</strong>
                               </span>
                           @enderror
                       </label>
                       <label class="block mt-4 text-sm">
                           <span class="text-gray-700 dark:text-gray-400">Password</span>
                           <input
                               class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                               type="password" name="password" class="form-control" placeholder="Password"
                               required />
                           @error('password')
                               <span class="invalid-feedback text-red-500" role="alert">
                                   <strong>{{ $message }}</strong>
                               </span>
                           @enderror
                       </label>
                   </div>
                   <footer
                       class="flex flex-col items-center justify-end px-6 py-3 -mx-6 -mb-4 space-y-4 sm:space-y-0 sm:space-x-6 sm:flex-row bg-gray-50 dark:bg-gray-800">
                       <button type="submit"
                           class="w-full px-5 py-3 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-green-600 border border-transparent rounded-lg sm:w-auto sm:px-4 sm:py-2 active:bg-green-600 hover:bg-green-700 focus:outline-none focus:shadow-outline-green">
                           Daftar
                       </button>
                   </footer>
               </form> --}}
           </div>
       </div>
       <!-- End of modal backdrop -->
