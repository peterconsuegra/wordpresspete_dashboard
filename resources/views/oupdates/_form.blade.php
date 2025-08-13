@if($errors->any())
    <div class="alert alert-danger">
        <ul class="mb-0 small">
            @foreach($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="row g-3">
    <div class="col-md-4">
        <label for="parent_version" class="form-label">Parent Version</label>
        <input type="text" name="parent_version" id="parent_version"
               class="form-control" required
               value="{{ old('parent_version', $oupdate->parent_version ?? '') }}">
        <div class="invalid-feedback">Required.</div>
    </div>

    <div class="col-md-4">
        <label for="version" class="form-label">Version</label>
        <input type="text" name="version" id="version" class="form-control" required
               value="{{ old('version', $oupdate->version ?? '') }}">
        <div class="invalid-feedback">Required.</div>
    </div>
</div>

<hr class="my-4">

<div class="mb-3">
    <label for="olinux_script" class="form-label">Linux Install / Update Script</label>
    <textarea name="olinux_script" id="olinux_script" rows="8"
              class="form-control font-monospace" placeholder="# Bash script here...">{{ old('olinux_script', $oupdate->olinux_script ?? '') }}</textarea>
</div>

{{-- Future fields for mac_script / win_script could go here --}}

<div class="d-flex justify-content-end gap-2 mt-4">
    <a href="{{ url()->previous() }}" class="btn btn-outline-secondary">Cancel</a>
    <button type="submit" class="btn btn-pete d-inline-flex align-items-center gap-1">
        <i class="bi bi-save"></i> Save
    </button>
</div>

{{-- ✨ OPTIONAL: Tiny client‑side Bootstrap validation --}}
@push('scripts')
<script>
    (() => {
        'use strict';
        const forms = document.querySelectorAll('.needs-validation');
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>
@endpush
