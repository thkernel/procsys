// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// require jquery
//= require jquery3
//= require rails-ujs

// require bootsy

//= require turbolinks
//= require bracketplusadmin-14/js/popper.js/umd/popper-utils.min
//= require popper

//= require bootstrap-sprockets

//= require bootstrap

//= require toastr
//= require rails.validations
// require intlTelInput
//= require bracketplusadmin-14/js/bracket
//= require bracketplusadmin-14/js/dashboard
//= require bracketplusadmin-14/js/map.shiftworker
//= require bracketplusadmin-14/js/ResizeSensor
//= require bracketplusadmin-14/js/moment/min/moment.min
//= require bracketplusadmin-14/js/perfect-scrollbar/perfect-scrollbar.min
//= require bracketplusadmin-14/js/rickshaw/rickshaw.min
//= require bracketplusadmin-14/js/gmaps/gmaps.min
//= require bracketplusadmin-14/js/datatables.net/js/jquery.dataTables.min
//= require bracketplusadmin-14/js/datatables.net-dt/js/dataTables.dataTables.min
//= require bracketplusadmin-14/js/datatables.net-responsive/js/dataTables.responsive.min
//= require bracketplusadmin-14/js/datatables.net-responsive-dt/js/responsive.dataTables.min


// require social-share-button
// require_tree .
$(function() {
  $('#pictureInput').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      console.log(file);
      img.src = file.target.result;
      $('.thumbnail-preview').html(img);
    }
    reader.readAsDataURL(image);
    console.log(files);
  });
});

$(function(){
$("#pictureInputLink").on('click', function(e){
    e.preventDefault();
    $("#pictureInput:hidden").trigger('click');
});
});
$(document).on('turbolinks:load', function() {
  $('#datatable1').DataTable({
    responsive: true,
    language: {
        processing: "Traitement en cours...",
        search: "Rechercher&nbsp;:",
        lengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
        info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
        infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
        infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
        infoPostFix: "",
        loadingRecords: "Chargement en cours...",
        zeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
        emptyTable: "Aucune donnée disponible dans le tableau",
        paginate: {
            first: "Premier",
            previous: "Pr&eacute;c&eacute;dent",
            next: "Suivant",
            last: "Dernier"
        },
        aria: {
            sortAscending: ": activer pour trier la colonne par ordre croissant",
            sortDescending: ": activer pour trier la colonne par ordre décroissant"
        }
    }
  });
}
);