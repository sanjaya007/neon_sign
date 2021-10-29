const hostUrl = 'http://127.0.0.1:3001';

function getData(url, successCb) {
  $.ajax({
    type: 'GET',
    dataType: 'json',
    url: url,
    success: successCb,
  });
}

function postData(url, data, successCb) {
  $.ajax({
    type: 'POST',
    dataType: 'json',
    url: url,
    data: data,
    success: successCb,
  });
}

function postFormData(url, formData, successCb) {
  $.ajax({
    url: url,
    data: formData,
    contentType: false,
    processData: false,
    cache: false,
    type: 'POST',
    success: successCb,
  });
}

function fetchHeading() {
  const url = hostUrl + '/v1/api/headings/all';
  getData(url, function (response) {
    const data = response.data.headings;
    $('.image-heading').text(data.image);
    $('.write-heading').text(data.write_text);
    $('.font-heading').text(data.fonts);
    $('.color-heading').text(data.color);
    $('.size-heading').text(data.size);
    $('.style-heading').text(data.backing_style);
    $('.backing-color-heading').text(data.backing_color);
    $('.extra-heading').text(data.extra);
  });
}

function cls(name) {
  return document.getElementsByClassName(name);
}

function handleTimlineWidth() {
  $('.image-heading-timeline').css('width', cls('image-heading')[0].offsetWidth + 'px');
  $('.write-heading-timeline').css('width', cls('write-heading')[0].offsetWidth + 'px');
  $('.font-heading-timeline').css('width', cls('font-heading')[0].offsetWidth + 'px');
  $('.color-heading-timeline').css('width', cls('color-heading')[0].offsetWidth + 'px');
  $('.size-heading-timeline').css('width', cls('size-heading')[0].offsetWidth + 'px');
  $('.style-heading-timeline').css('width', cls('style-heading')[0].offsetWidth + 'px');
  $('.backing-color-heading-timeline').css('width', cls('backing-color-heading')[0].offsetWidth + 'px');
  $('.extra-heading-timeline').css('width', cls('extra-heading')[0].offsetWidth + 'px');
  $('.finish-heading-timeline').css('width', cls('finish-heading')[0].offsetWidth + 'px');
}

$(window).on('resize', function () {
  if (window.innerWidth > 768) {
    handleTimlineWidth();
  }
});

function stockImageCard(src, active) {
  return `<div class="image-container stock-image-card ${active ? 'active' : ''}" data-value="${src}">
  <img src="${src}" alt="background" referrerpolicy="no-referrer"/>
</div>`;
}

function fontCard(font, active) {
  return `<div class="list-box font-card ${active ? 'active' : ''} flex-css" id="font${font.id}" data-value="${font.name}" data-id="${font.id}"> 
        <p class="font-card-text" style="font-family: ${font.name}"> ${font.tool_name.toLowerCase()} </p>
    </div>`;
}

function colorCard(color, active) {
  return `<div class="list-box color-card ${active ? 'active' : ''} flex-css-column" id="color${color.id}" data-color-code="${color.code}" data-value="${color.name}" >
            <span style="background-color: ${color.code}"></span>
            <p> ${color.name} </p>
          </div>`;
}

function styleCard(style, active) {
  return `<div class="box style-card flex-css-column ${active ? 'active' : ''}" data-value="${style.name}" data-id="${style.id}">
  <img src="./images/cut${style.id}.png" alt="style" />
  <p>${style.name}</p>
</div>`;
}

function backingColorCard(color, active) {
  return `<div class="box backing-color-card flex-css-column ${active ? 'active' : ''}" data-value="${color.name}" data-id="${color.id}">
  <img src="${color.image}" alt="back" />
  <h6>${color.name}</h6>
</div>`;
}

function fetchStockImages() {
  const url = hostUrl + '/v1/api/stock_images/all';
  getData(url, function (response) {
    $.each(response.data.stock_images, function (index, src) {
      $('#stockImages').append(stockImageCard(src, index === 0 ? true : false));
      if (index === 0) {
        $('#primaryContainer').css('background-image', `url(${src})`);
      }
    });
    triggerStockImageCardClickEvent();
  });
}

function fetchFont() {
  const url = hostUrl + '/v1/api/fonts/all';
  getData(url, function (response) {
    $.each(response.data.fonts, function (index, font) {
      $('#fontList').append(fontCard(font, index === 0 ? true : false));
      if (index === 0) {
        $('.the-text').css('font-family', font.name);
        pricingData.font_id = parseInt(font.id);
      }
    });
    triggerFontCardClickEvent();
  });
}

function fetchColor() {
  const url = hostUrl + '/v1/api/colors/all';
  getData(url, function (response) {
    $.each(response.data.colors, function (index, color) {
      $('#colorList').append(colorCard(color, index === 0 ? true : false));
      if (index === 0) {
        $('.the-text').css('color', color.code);
        $('.the-text').css('text-shadow', `0 0 40px ${color.code}, 0 0 20px ${color.code}, 0 0 60px ${color.code}, 0 0 30px ${color.code}, 0 0 150px #fff, 0 0 4px #fff`);
        $('#color-label').text(color.name);
        $('#color-label').css('color', color.code);
        $('.font-card p').css('color', color.code);
        $('.font-card').css('border-color', color.code);
      }
    });
    triggerColorCardClickEvent();
  });
}

function fetchStyle() {
  const url = hostUrl + '/v1/api/backing_styles/all';
  getData(url, function (response) {
    $.each(response.data.backing_styles, function (index, style) {
      if (index < 3) {
        $('#styleList').append(styleCard(style, index === 0 ? true : false));
      }
    });
    triggerStyleCardClickEvent();
  });
}

function fetchBackingColor() {
  const url = hostUrl + '/v1/api/backing_colors/all';
  getData(url, function (response) {
    $.each(response.data.backing_colors, function (index, color) {
      // Note: remove hostUrl concatination when we upload to s3
      color.image = hostUrl + color.image;
      $('#backingColorList').append(backingColorCard(color, index === 0 ? true : false));
    });
    triggerBackingColorCardClickEvent();
  });
}

function fetchWaterproof() {
  const url = hostUrl + '/v1/api/waterproof/all';
  getData(url, function (response) {
    $('.waterproof-rate').text(response.data.percent);
  });
}

function fetchRemote() {
  const url = hostUrl + '/v1/api/remote/all';
  getData(url, function (response) {
    $('.remote-rate').text(response.data.remote.yes.price);
  });
}

function fetchMounting() {
  const url = hostUrl + '/v1/api/mounting/all';
  getData(url, function (response) {
    $('.mounting-rate').text(response.data.mounting.yes.price);
  });
}

fetchHeading();
fetchStockImages();
fetchFont();
fetchColor();
fetchStyle();
fetchBackingColor();
fetchWaterproof();
fetchRemote();
fetchMounting();
