window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const addTaxValue = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = addTaxValue;

    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = Math.floor(inputValue - addTaxValue);

  })
});