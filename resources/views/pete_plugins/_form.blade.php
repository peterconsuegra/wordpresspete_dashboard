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
    $plugin = $plugin ?? new \App\Models\PetePlugin();
@endphp

<div class="row g-3">
    <div class="col-md-6">
        <label for="title" class="form-label">Plugin Name</label>
        <input type="text" id="title" name="title" class="form-control" required value="{{ old('title', $plugin->title) }}">
        <div class="invalid-feedback">Required.</div>
    </div>
    <div class="col-md-6">
        <label for="option_name" class="form-label">Option Name</label>
        <input type="text" id="option_name" name="option_name" class="form-control" required value="{{ old('option_name', $plugin->option_name) }}">
        <div class="invalid-feedback">Required.</div>
    </div>
    <div class="col-md-4">
        <label for="version" class="form-label">Version</label>
        <input type="text" id="version" name="version" class="form-control" required value="{{ old('version', $plugin->version) }}">
        <div class="invalid-feedback">Required.</div>
    </div>
    <div class="col-md-4">
        <label for="package_folder" class="form-label">Package Folder</label>
        <input type="text" id="package_folder" name="package_folder" class="form-control" value="{{ old('package_folder', $plugin->package_folder) }}">
    </div>
    <div class="col-md-4">
        <label for="redirect_after_install" class="form-label">Redirect After Install</label>
        <input type="text" id="redirect_after_install" name="redirect_after_install" class="form-control" value="{{ old('redirect_after_install', $plugin->redirect_after_install) }}">
    </div>
</div>

<div class="mb-3 mt-4">
    <label for="description" class="form-label">Description</label>
    <textarea class="form-control" id="description" name="description" rows="5">{{ old('description', $plugin->description) }}</textarea>
</div>

<div class="mb-3">
    <label class="form-label">Image</label>
    <input class="form-control" type="file" id="image" name="image" accept="image/*">
    @if($plugin->image)
        <div class="mt-2">
            <img src="{{ asset('plugins_images/' . $plugin->image) }}" alt="Current image" class="img-thumbnail" style="max-height: 120px;">
        </div>
    @endif
</div>

<hr class="my-4">

<div class="row g-3">
    <div class="col-12 col-lg-6">
        <label for="olinux_install_script" class="form-label">Linux Install Script</label>
        <textarea id="olinux_install_script" name="olinux_install_script" rows="6" class="form-control font-monospace" placeholder="# bash script">{{ old('olinux_install_script', $plugin->olinux_install_script) }}</textarea>
    </div>
    <div class="col-12 col-lg-6">
        <label for="olinux_uninstall_script" class="form-label">Linux Uninstall Script</label>
        <textarea id="olinux_uninstall_script" name="olinux_uninstall_script" rows="6" class="form-control font-monospace" placeholder="# bash script">{{ old('olinux_uninstall_script', $plugin->olinux_uninstall_script) }}</textarea>
    </div>
</div>

{{-- You can add more OS‑specific script fields similarly --}}

<div class="d-flex justify-content-end gap-2 mt-4">
    <a href="{{ url()->previous() }}" class="btn btn-outline-secondary">Cancel</a>
    <button type="submit" class="btn btn-pete d-inline-flex align-items-center gap-1">
        <i class="bi bi-save"></i> Save
    </button>
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
