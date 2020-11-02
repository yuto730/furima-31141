window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = Math.floor(inputValue / 10);
    addTaxDom.innerHTML = fee;
    const profit = document.getElementById("profit");
    const profit_part = Math.floor(inputValue - fee);
    profit.innerHTML = profit_part;
  })
});