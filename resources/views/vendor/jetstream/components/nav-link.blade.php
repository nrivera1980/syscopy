@props(['active'])

@php
$classes = ($active ?? false)
            ? 'inline-flex items-center px-1 pt-1 border-b-2 border-yellow-300 text-lg font-medium leading-5 text-yellow-300 focus:outline-none focus:border-yellow-300 transition'
            : 'inline-flex items-center px-1 pt-1 border-b-2 border-transparent text-lg font-medium leading-5 text-white hover:text-yellow-200 hover:border-yellow-300 focus:outline-none focus:text-yellow-300 focus:border-yellow-300 transition';
@endphp

<a {{ $attributes->merge(['class' => $classes]) }}>
    {{ $slot }}
</a>
