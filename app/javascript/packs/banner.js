const nameInputVisible = document.querySelector("#fuckthis");
const cityInputVisible = document.querySelector("#fuck-this-too");
const nameInputInvisible = document.querySelector("#banner-name-input-hidden");
const cityInputInvisible = document.querySelector("#banner-city-input-hidden");
const submit = document.querySelector("#banner-surprise-me-button");

if (submit != null) {

  document.querySelector(".navbar-wagon").classList.add('navbar-lp')
  submit.addEventListener("click", setInputs);

};

function setInputs() {
  nameInputInvisible.value = nameInputVisible.innerHTML;
  cityInputInvisible.value = cityInputVisible.innerHTML;
};

