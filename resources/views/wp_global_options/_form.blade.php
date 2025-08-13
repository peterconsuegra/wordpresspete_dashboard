@if($errors->any())
    <div class="alert alert-danger"><ul class="mb-0 small">@foreach($errors->all() as $e)<li>{{ $e }}</li>@endforeach</ul></div>
@endif

@php
    $option = $option ?? new \App\Models\WpGlobalOption();
@endphp

<div class="row g-3">
    <div class="col-md-6">
        <label for="option_name" class="form-label">Option Name</label>
        <input type="text" id="option_name" name="option_name" class="form-control" required value="{{ old('option_name', $option->option_name) }}">
        <div class="invalid-feedback">Required.</div>
    </div>
</div>

<div class="mb-3 mt-3">
    <label for="option_value" class="form-label">Option Value</label>
    <textarea id="option_value" name="option_value" rows="4" class="form-control">{{ old('option_value', $option->option_value) }}</textarea>
</div>

<div class="mb-3">
    <label class="form-label">Image</label>
    <input type="file" id="image" name="image" class="form-control" accept="image/*">
    @if($option->image)
        <div class="mt-2"><img src="{{ asset('options/' . $option->image) }}" alt="img" class="img-thumbnail" style="max-height:120px;"></div>
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
    const forms=document.querySelectorAll('.needs-validation');
    Array.from(forms).forEach(f=>{f.addEventListener('submit',e=>{if(!f.checkValidity()){e.preventDefault();e.stopPropagation();}f.classList.add('was-validated');},false);});
})();
</script>
@endpush
