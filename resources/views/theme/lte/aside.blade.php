

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

  <!-- Sidebar - Brand -->
  <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{ route('inicio') }}">
    <div class="sidebar-brand-icon rotate-n-15">
      <i class="fas fa-laugh-wink"></i>
    </div>
    <div class="sidebar-brand-text mx-3">Tecnologia Actual <sup></sup></div>
  </a>

  <!-- Divider -->
  <hr class="sidebar-divider my-0">

  <!-- Nav Item - Dashboard -->
  <li class="nav-item active">
    <a class="nav-link" href="{{ route('inicio') }}">
      <i class="fas fa-fw fa-tachometer-alt"></i>
      <span>Tablero</span></a>
  </li>

  <!-- Divider -->
  <hr class="sidebar-divider">

  <!-- Heading -->
  <div class="sidebar-heading">
    Interface
  </div>

  <!-- Nav Item - Pages Collapse Menu -->
  <li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
      <i class="fas fa-cart-arrow-down"></i>
          <span>Ventas</span>
    </a>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
        <h6 class="collapse-header">Utilidades</h6>
        <a class="collapse-item" href="{{ route('ventas.index') }}">Listado</a>
        <a class="collapse-item" href="{{ route('ventas.reportes') }}">Reportes</a>
      </div>
    </div>
  </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo2" aria-expanded="true" aria-controls="collapseTwo2">
        <i class="fas fa-credit-card"></i>
            <span>Pagos</span>
      </a>
      <div id="collapseTwo2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Utilidades</h6>
          <a class="collapse-item" href="{{ route('pagos.index') }}">Listado</a>
  
  
        </div>
      </div>
    </li>

  <!-- Nav Item - Utilities Collapse Menu -->
  <li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
      <i class="fas fa-project-diagram"></i> 
          <span>Productos</span>
    </a>
    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
        <h6 class="collapse-header">Utilidades</h6>
        <a class="collapse-item" href="{{ route('productos.index') }}">Listado</a>
        <a class="collapse-item" href="{{ route('categorias.index') }}">Categorias</a>
        <a class="collapse-item" href="#"></a>
        <a class="collapse-item" href="#"></a>
      </div>
    </div>
  </li>

  <!-- Divider -->
  <hr class="sidebar-divider">

  <!-- Heading -->
  <div class="sidebar-heading">
    Complementos
  </div>

  <!-- Nav Item - Pages Collapse Menu -->
  <li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
      <i class="fas fa-address-card"></i>
      <span>Clientes</span>
    </a>
    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
        <h6 class="collapse-header">Utilidades</h6>
        <a class="collapse-item" href="{{ route('clientes.index') }}">Lista</a>
        <a class="collapse-item" href="#">Potenciales</a>
        <a class="collapse-item" href="#"></a>
        <div class="collapse-divider"></div>
        <h6 class="collapse-header">Otros</h6>

        <a class="collapse-item" href="#"></a>
      </div>
    </div>
  </li>

    <!-- Nav Item - Pages Collapse Menu -->
  <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProeevedores" aria-expanded="true" aria-controls="collapseProeevedores">
        <i class="fab fa-amazon"></i>
        <span>Proveedores</span>
      </a>
      <div id="collapseProeevedores" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Utilidades</h6>
          <a class="collapse-item" href="{{ route('proevedor.index') }}">Lista</a>

          <a class="collapse-item" href="#"></a>
        </div>
      </div>
    </li>
 
  <!-- Divider -->
  <hr class="sidebar-divider d-none d-md-block">

  <!-- Sidebar Toggler (Sidebar) -->
  <div class="text-center d-none d-md-inline">
    <button class="rounded-circle border-0" id="sidebarToggle"></button>
  </div>

</ul>
<!-- End of Sidebar -->