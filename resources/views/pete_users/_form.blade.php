@if($errors->any())
    <div class="alert alert-danger"><ul class="mb-0 small">@foreach($errors->all() as $e)<li>{{ $e }}</li>@endforeach</ul></div>
@endif

@php $user = $user ?? new \App\Models\PeteUser(); @endphp

<div class="row g-3">
    <div class="col-md-4">
        <label for="name" class="form-label">Name</label>
        <input type="text" id="name" name="name" class="form-control" required value="{{ old('name', $user->name) }}">
        <div class="invalid-feedback">Required.</div>
    </div>
    <div class="col-md-4">
        <label for="email" class="form-label">Email</label>
        <input type="email" id="email" name="email" class="form-control" required value="{{ old('email', $user->email) }}">
        <div class="invalid-feedback">Valid email required.</div>
    </div>
    <div class="col-md-4">
        <label for="country" class="form-label">Country</label>
        <input type="text" id="country" name="country" class="form-control" value="{{ old('country', $user->country) }}">
    </div>
</div>

<div class="row g-3 mt-3">
    <div class="col-md-3">
        <label for="os" class="form-label">OS</label>
        <input type="text" id="os" name="os" class="form-control" value="{{ old('os', $user->os) }}">
    </div>
    <div class="col-md-3">
        <label for="os_distribution" class="form-label">Distribution</label>
        <input type="text" id="os_distribution" name="os_distribution" class="form-control" value="{{ old('os_distribution', $user->os_distribution) }}">
    </div>
    <div class="col-md-3">
        <label for="os_version" class="form-label">Version</label>
        <input type="text" id="os_version" name="os_version" class="form-control" value="{{ old('os_version', $user->os_version) }}">
    </div>
    <div class="col-md-3">
        <label for="installs" class="form-label">Installs</label>
        <input type="number" id="installs" name="installs" class="form-control" min="0" value="{{ old('installs', $user->installs) }}">
    </div>
</div>

<div class="row g-3 mt-3">
    <div class="col-md-4">
        <label for="contact_me_again" class="form-label">Contact Me Again</label>
        <select id="contact_me_again" name="contact_me_again" class="form-select">
            <option value="0" @selected(old('contact_me_again', $user->contact_me_again)==0)>No</option>
            <option value="1" @selected(old('contact_me_again', $user->contact_me_again)==1)>Yes</option>
        </select>
    </div>
    @if(!$user->exists)
        <div class="col-md-4">
            <label for="password" class="form-label">Password</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>
    @endif
    @if($user->exists)
        <div class="col-md-4">
            <label class="form-label">Created At</label>
            <input type="text" class="form-control-plaintext" readonly value="{{ $user->created_at }}">
        </div>
    @endif
</div>

<div class="d-flex justify-content-end gap-2 mt-4">
    <a href="{{ url()->previous() }}" class="btn btn-outline-secondary">Cancel</a>
    <button type="submit" class="btn btn-pete d-inline-flex align-items-center gap-1"><i class="bi bi-save"></i> Save</button>
</div>

@push('scripts')
<script>(()=>{'use strict';const f=document.querySelectorAll('.needs-validation');Array.from(f).forEach(frm=>{frm.addEventListener('submit',e=>{if(!frm.checkValidity()){e.preventDefault();e.stopPropagation();}frm.classList.add('was-validated');},false);});})();</script>
@endpush