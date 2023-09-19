$(() => {


   const dropdownItems = document.querySelectorAll('.dropdown-item');

        dropdownItems.forEach(function (item) {
          item.addEventListener('click', function () {
            const selectedValue = item.getAttribute('href').substring(1); // Remove the '#' character
            document.getElementById('search_param').value = selectedValue;
            document.querySelector('.dropdown-toggle').textContent = item.textContent;
          });
        });
	
});