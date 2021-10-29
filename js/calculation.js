function fetchWordCalculatedData(pricingData) {
  const url = hostUrl + '/v1/api/calc/pricing';
  let stData = Object.assign({}, pricingData);
  delete stData.add_ons;
  stData.add_ons = JSON.stringify(pricingData.add_ons);

  postData(url, stData, function (data) {
    console.log(data.data);
    calculatedData = data.data;
    $('.preview-price').text('$' + data.data.price.selling);

    $('.heightCM').text(data.data.base.height + 'cm');
    $('.heightIN').text(data.data.base.height_inch + 'in');
    $('.widthCM').text(data.data.base.width + 'cm');
    $('.widthIN').text(data.data.base.width_inch + 'in');
  });
}
