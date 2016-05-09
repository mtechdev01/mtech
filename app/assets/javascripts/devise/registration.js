function changeHiddenInput(select)
    {
        if (select.value == "Autre") {
            document.getElementById("hiddenDiv").style.display = "block";
            document.getElementById("hiddenInput").value = "";
        }
        else {
            document.getElementById("hiddenDiv").style.display = "none";
            document.getElementById("hiddenInput").value = select.value;
        }
    }

    // This example displays an address form, using the autocomplete feature
    // of the Google Places API to help users fill in the information.

    var placeSearch, autocomplete;
    var componentForm = {
      locality: 'long_name',
      country: 'long_name',
      postal_code: 'short_name'
    };

    function initAutocomplete() {
      // Create the autocomplete object, restricting the search to geographical
      // location types.
    autocomplete = new google.maps.places.Autocomplete(
      /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
      {types: ['geocode']});

      // When the user selects an address from the dropdown, populate the address
      // fields in the form.
      autocomplete.addListener('place_changed', fillInAddress);
    }

    // [START region_fillform]
    function fillInAddress() {
      // Get the place details from the autocomplete object.
      var place = autocomplete.getPlace();

      for (var component in componentForm) {
        document.getElementById(component).value = '';
        document.getElementById(component).disabled = false;
      }

      // Get each component of the address from the place details
      // and fill the corresponding field on the form.
      for (var i = 0; i < place.address_components.length; i++) {
        var addressType = place.address_components[i].types[0];
        if (componentForm[addressType]) {
          var val = place.address_components[i][componentForm[addressType]];
          document.getElementById(addressType).value = val;

        }
      }
    }
    // [END region_fillform]
