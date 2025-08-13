@if($errors->any())
    <div class="alert alert-danger">
        <ul class="mb-0 small">
            @foreach($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

@php
    $plugin = $plugin ?? new \App\Models\Wp_plugin();
@endphp

<div class="row g-3">
    <div class="col-md-6">
        <label for="title" class="form-label">Title</label>
        <input type="text" id="title" name="title" class="form-control" required value="{{ old('title', $plugin->title) }}">
        <div class="invalid-feedback">Required.</div>
    </div>
    <div class="col-md-6">
        <label for="version" class="form-label">Version</label>
        <input type="text" id="version" name="version" class="form-control" value="{{ old('version', $plugin->version) }}">
    </div>
</div>

<div class="mb-3 mt-3">
    <label for="description" class="form-label">Description</label>
    <textarea id="description" name="description" rows="5" class="form-control">{{ old('description', $plugin->description) }}</textarea>
</div>

<div class="mb-3">
    <label for="url" class="form-label">Download URL</label>
    <input type="url" id="url" name="url" class="form-control" required value="{{ old('url', $plugin->url) }}">
    <div class="invalid-feedback">Please provide a valid URL.</div>
</div>

<div class="mb-3">
    <label class="form-label">Image</label>
    <input type="file" id="image" name="image" class="form-control" accept="image/*">
    @if($plugin->image)
        <div class="mt-2"><img src="{{ asset('wp_plugins_images/' . $plugin->image) }}" alt="Current image" class="img-thumbnail" style="max-height: 120px;"></div>
    @endif
</div>

<div class="d-flex justify-content-end gap-2 mt-4">
    <a href="{{ url()->previous() }}" class="btn btn-outline-secondary">Cancel</a>
    <button type="submit" class="btn btn-pete d-inline-flex align-items-center gap-1"><i class="bi bi-save"></i> Save</button>
</div>

@push('scripts')
<script>
(()=>{
    'use strict';
    const forms = document.querySelectorAll('.needs-validation');
    Array.from(forms).forEach(form=>{
        form.addEventListener('submit',event=>{
            if(!form.checkValidity()){event.preventDefault();event.stopPropagation();}
            form.classList.add('was-validated');
        },false);
    });
})();
</script>
@endpush
