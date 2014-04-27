$(document).ready ->
  # enable chosen js

  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No se encontraron resultados'
    placeholder_text_multiple: "Seleccione acompaniantes"
    max_selected_options: 5
    width: '750px'