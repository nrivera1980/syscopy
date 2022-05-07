{{-- <img src="{{ asset('/img/logo.png') }}" alt="SYSCOPY"> --}}
<div class="mt-6 grid grid-cols-13 gap-4">
    <div>
        <a href="{{route('login.facebook')}}" class="bg-blue-800 rounded-md relative w-64 py-3 flex justify-start text-white text-sm"><span class="w-12 flex justify-center"><i class="fab fa-facebook-f fa-2x"></i></span><p> Registrate con Facebook</p></a>
    </div>
    <div>
        <a href="{{route('login.google')}}" class="bg-blue-500 rounded-md relative py-3 w-64 flex justify-start text-white text-sm"><span class="w-12 flex justify-center"><i class="fab fa-google fa-2x"></i></span><p> Registrate con Google</p></a>
    </div>        
</div>
