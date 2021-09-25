<x-layout title="ScholarMesh">
  <div class="container-fluid">
    <div class="h2">
      See posts by people you follow
    </div>
    <div class="container-fluid">
      @foreach ($posts as $post)
          <x-post-card :post="$post"/>
      @endforeach
    </div>
  </div>
</x-layout>