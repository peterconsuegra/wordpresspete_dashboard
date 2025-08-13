@if($errors->any())
    <div class="alert alert-danger"><ul class="mb-0 small">@foreach($errors->all() as $e)<li>{{ $e }}</li>@endforeach</ul></div>
@endif

@php
    $installer = $installer ?? new \App\Models\PeteInstaller();
@endphp

<div class="row g-3">
    <div class="col-md-6">
        <label for="script_name" class="form-label">Script Name</label>
        <input type="text" id="script_name" name="script_name" class="form-control" required value="{{ old('script_name', $installer->script_name) }}">
        <div class="invalid-feedback">Required.</div>
    </div>
    <div class="col-md-6">
        <label for="url" class="form-label">Repository / File URL</label>
        <input type="url" id="url" name="url" class="form-control" value="{{ old('url', $installer->url) }}">
    </div>
</div>

<div class="mb-3 mt-4">
    <label for="linux" class="form-label">Linux Script</label>
    <textarea id="linux" name="linux" rows="8" class="form-control font-monospace" placeholder="# bash script here">{{ old('linux', $installer->linux) }}</textarea>
</div>

<div class="d-flex justify-content-end gap-2 mt-4">
    <a href="{{ url()->previous() }}" class="btn btn-outline-secondary">Cancel</a>
    <button type="submit" class="btn btn-pete d-inline-flex align-items-center gap-1"><i class="bi bi-save"></i> Save</button>
</div>

@push('scripts')
<script>
(()=>{
    'use strict';
    const forms=document.querySelectorAll('.needs-validation');
    Array.from(forms).forEach(form=>{
        form.addEventListener('submit',e=>{if(!form.checkValidity()){e.preventDefault();e.stopPropagation();}form.classList.add('was-validated');},false);
    });
})();
</script>
@endpush