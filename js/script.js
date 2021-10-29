// text neon
const currentTab = {
  key: 'image',
  currentEl: 'imageLink',
  nextEl: 'colorLink',
  prevEl: '',
};

let calculatedData = {};

const neonData = {
  id: null,
  text: null,
  image: null,
  color: null,
  font: null,
  size: null,
  style: null,
  backing_color: null,
  extra: {
    waterproof: null,
    remote: null,
    mounting: null,
  },
};

const pricingData = {
  font_id: '',
  word: '',
  custom_width: null,
  add_ons: {},
};

function toggleContainer(content) {
  $('.content-container').addClass('hidden');
  if (content === 'text-neon') {
    $('.textneon-container').removeClass('hidden');
  } else if (content === 'logo-neon') {
    $('.logoneon-container').removeClass('hidden');
  } else {
    $('.home-container').removeClass('hidden');
  }
  handleTimlineWidth();
}

$('.big-wrapper').on('click', function () {
  const toggleContent = $(this).attr('data-toggle');
  toggleContainer(toggleContent);
});

$('.tab-box .tab').on('click', function (e) {
  e.preventDefault();
  const toggleContent = $(this).attr('data-toggle');
  toggleContainer(toggleContent);
});

$('#closeBtn').on('click', function (e) {
  e.preventDefault();
  const toggleContent = $(this).attr('data-toggle');
  toggleContainer(toggleContent);
});

function openNextTab(e) {
  e.preventDefault();
  if (currentTab.nextEl.length > 0) {
    $(`#${currentTab.nextEl}`).trigger('click');
  }
}

function openPrevTab(e) {
  e.preventDefault();
  if (currentTab.prevEl.length > 0) {
    $(`#${currentTab.prevEl}`).trigger('click');
  }
}

$('#nextBtn').on('click', openNextTab);
$('#mobileNextBtn').on('click', openNextTab);
$('#goBack').on('click', openPrevTab);

//text area
$('.text-input-one').on('keyup', function (e) {
  $('.text-input-two').html($(this).html());
  checkValidation();
  makeWordApiReady($('.the-text').html());
  neonData.text = makeWordApiReady($('.the-text').html());
  pricingData.word = makeWordApiReady($('.the-text').html());
  calculationNeonWord();
});

$('.text-input-two').on('keyup', function (e) {
  $('.text-input-one').html($(this).html());
  checkValidation();
  makeWordApiReady($('.the-text').html());
  neonData.text = makeWordApiReady($('.the-text').html());
  pricingData.word = makeWordApiReady($('.the-text').html());
  calculationNeonWord();
});

function calculationNeonWord() {
  if ($('.the-text').html() === '') {
    $('.preview-price').text('$00.00');
  } else {
    fetchWordCalculatedData(pricingData);
  }
}

function checkValidation() {
  if ($('.the-text').html() === '') {
    $('.next-btn').addClass('hidden');
    $('.placeholder-text').removeClass('hidden');
    $('.the-text').addClass('left-aligned');
    $('.the-text').addClass('placeholder-width');
    $('.preview-scale').hide();
    $('#colorLink').addClass('disabled-link');
  } else {
    $('.next-btn').removeClass('hidden');
    $('.placeholder-text').addClass('hidden');
    $('.the-text').removeClass('left-aligned');
    $('.the-text').removeClass('placeholder-width');
    $('.preview-scale').show();
    $('#colorLink').removeClass('disabled-link');
  }
}

function makeWordApiReady(word) {
  let apiReadyWord = word.trim().replace('<div><br></div>', '');
  apiReadyWord = apiReadyWord.replaceAll('</div>', '');
  apiReadyWord = apiReadyWord.replaceAll('<div>', '[+nl+]');
  return apiReadyWord;
}

$('.text-input-one').trigger('keyup').focus();

// main nav tab
let previousTabId = 'imageList';
let previousTabKey = 'image';
let previousTabClass = 'image-heading';

$('.tab-link').on('click', function (e) {
  e.preventDefault();
  $('.tab-link').removeClass('active');
  $(this).addClass('active');
  $('.inner-bar').addClass('hidden');
  const tabKey = $(this).attr('data-key');
  const tabClass = $(this).attr('class');
  const tabId = $(this).attr('id').replace('Link', 'List');
  $(`#${tabId}`).removeClass('hidden');

  currentTab.currentEl = $(this).attr('id');
  currentTab.nextEl = $(this).attr('data-next');
  currentTab.prevEl = $(this).attr('data-prev');

  const headingClass = tabClass.split(' ')[1].trim();
  const timelineTabLinkClass = headingClass + '-timeline';
  $(`.${timelineTabLinkClass} span`).addClass('active');

  const prevTimelineTabLinkClass = previousTabClass + '-timeline';
  $(`.${prevTimelineTabLinkClass}`).addClass('done');
  console.log(headingClass);

  // previous tab value
  neonData.text = makeWordApiReady($('.the-text').html()).replaceAll('[+nl+]', ' ');
  $.each($(`#${previousTabId} .active`), function (index, tab) {
    const dataValue = $(tab).attr('data-value');
    if ($(tab).attr('data-key')) {
      neonData[previousTabKey][$(tab).attr('data-key')] = dataValue;
    } else {
      neonData[previousTabKey] = dataValue;
    }
  });

  previousTabId = tabId;
  previousTabKey = tabKey;
  previousTabClass = headingClass;

  updateResult();
  updateOrder();

  if (tabId === 'imageList') {
    $('.go-back-btn').addClass('hidden');
    $('.close-btn').removeClass('hidden');
  } else {
    $('.go-back-btn').removeClass('hidden');
    $('.close-btn').addClass('hidden');
  }

  if (tabId === 'styleList') {
    const styleValue = $(`#${tabId} .active`).attr('data-id');
    pricingData.add_ons.backing_style = parseInt(styleValue);
    calculationNeonWord();
  }

  if (tabId === 'backingColorList') {
    const backingColorValue = $(`#${tabId} .active`).attr('data-id');
    pricingData.add_ons.backing_color = parseInt(backingColorValue);
    calculationNeonWord();
  }

  if (tabId === 'extraList') {
    $.each($(`#${tabId} .active`), function (index, tab) {
      const dataKey = $(tab).attr('data-key');
      const dataValue = $(tab).attr('data-value');
      pricingData.add_ons[dataKey] = dataValue.toLowerCase();
    });
    calculationNeonWord();
  }

  if (tabId === 'finishList') {
    $('.content-bar').hide();
    $('.design-box').addClass('hidden');
    $('.order-box').removeClass('hidden');
    $('.mobile-bottom').hide();
    $('.the-text').css('pointer-events', 'none');
    $('.sidebar-container').removeClass('mobile-hide');
    $('.sidebar-container').show();
    $('.primary-container').addClass('mobile-height');
    $('.order-price').text(`$${calculatedData.price.selling}`);
  } else {
    $(`#${currentTab.nextEl}`).removeClass('disabled-link');
    $('.content-bar').show();
    $('.design-box').removeClass('hidden');
    $('.order-box').addClass('hidden');
    $('.mobile-bottom').show();
    $('.the-text').css('pointer-events', 'all');
    $('.sidebar-container').addClass('mobile-hide');
    $('.primary-container').removeClass('mobile-height');
  }
});

function updateResult() {
  if (neonData.text) {
    $('.write-text').hide();
    $('.final-box').removeClass('hidden');
    $('.text-result .final-text').text(neonData.text);
    $('.text-result').removeClass('hidden');
  } else {
    $('.write-text').show();
    $('.text-result').addClass('hidden');
    $('.final-box').addClass('hidden');
  }

  if (neonData.color) {
    $('.final-box').removeClass('hidden');
    $('.color-result .final-text').text(neonData.color.toUpperCase());
    $('.color-result').removeClass('hidden');
  } else {
    $('.color-result').addClass('hidden');
  }

  if (neonData.font) {
    $('.final-box').removeClass('hidden');
    $('.font-result .final-text').text(neonData.font.toUpperCase());
    $('.font-result').removeClass('hidden');
  } else {
    $('.font-result').addClass('hidden');
  }

  if (neonData.size) {
    $('.final-box').removeClass('hidden');
    $('.size-result .final-text').text(neonData.size.replaceAll(',', ' '));
    $('.size-result').removeClass('hidden');
  } else {
    $('.size-result').addClass('hidden');
  }

  if (neonData.style) {
    $('.final-box').removeClass('hidden');
    $('.style-result .final-text').text(neonData.style.toUpperCase());
    $('.style-result').removeClass('hidden');
  } else {
    $('.style-result').addClass('hidden');
  }

  if (neonData.backing_color) {
    $('.final-box').removeClass('hidden');
    $('.backing-color-result .final-text').text(neonData.backing_color.toUpperCase());
    $('.backing-color-result').removeClass('hidden');
  } else {
    $('.backing-color-result').addClass('hidden');
  }
}

function updateOrder() {
  $('.order-text').text(neonData.text);
  if (neonData.size) {
    $('.order-size').text(neonData.size.replaceAll(',', ' '));
  } else {
    $('.order-size').text('');
  }
  $('.order-font').text(neonData.font);
  $('.order-color').text(neonData.color);
  $('.order-style').text(neonData.style);
  $('.order-backing-color').text(neonData.backing_color);
  $('.order-waterproof').text('Waterproof ' + neonData.extra.waterproof + ' only');
  if (neonData.extra.remote) {
    $('.order-remote').text(neonData.extra.remote.toLowerCase() === 'yes' ? 'Remote' : '');
  } else {
    $('.order-remote').text('');
  }
  if (neonData.extra.mounting) {
    $('.order-mounting').text(neonData.extra.mounting.toLowerCase() === 'yes' ? 'Mounting' : '');
  } else {
    $('.order-mounting').text('');
  }
}

// stok images
function triggerStockImageCardClickEvent() {
  $('.stock-image-card').on('click', function () {
    $('.stock-image-card').removeClass('active');
    $(this).addClass('active');
    const src = $(this).find('img').attr('src');
    $('#primaryContainer').css('background-image', `url(${src})`);
  });
}

// upload stock image
const allowedFileTypes = ['png', 'jpg', 'jpeg', 'JPG', 'JPEG', 'PNG'];
$('#uploadStockImageBtn').on('change', function (e) {
  e.preventDefault();
  const files = $(this)[0].files;
  if (files.length > 0) {
    $.each(files, function (index, file) {
      if (allowedFileTypes.indexOf(file.type.replace('image/', '')) >= 0) {
        uploadCustomFile(file, function (data) {
          // Note: remove hostUrl concatination when we upload to s3
          const imageUrl = hostUrl + data.url;
          $('#customImages').append(stockImageCard(imageUrl, false));
          triggerStockImageCardClickEvent();
        });
      }
    });
  }
});

function uploadCustomFile(file, successCb) {
  const url = hostUrl + '/v1/upload/file';
  const fileData = new FormData();
  fileData.append('file', file);
  postFormData(url, fileData, successCb);
}

// font box
function triggerFontCardClickEvent() {
  $('.font-card').on('click', function () {
    $('.font-card').removeClass('active');
    $(this).addClass('active');

    const fontName = $(this).attr('data-value');
    $('.the-text').css('font-family', fontName);

    const dataId = $(this).attr('data-id');
    pricingData.font_id = parseInt(dataId);
    calculationNeonWord();
  });
}

// color box
function triggerColorCardClickEvent() {
  $('.color-card').on('click', function () {
    $('.color-card').removeClass('active');
    $(this).addClass('active');

    const colorCode = $(this).attr('data-color-code');
    $('.the-text').css('color', colorCode);
    $('.the-text').css('text-shadow', `0 0 40px ${colorCode}, 0 0 20px ${colorCode}, 0 0 60px ${colorCode}, 0 0 30px ${colorCode}, 0 0 150px #fff, 0 0 4px #fff`);
    $('.font-card p').css('color', colorCode);
    $('.font-card').css('border-color', colorCode);

    const colorName = $(this).attr('data-value');
    $('#color-label').text(colorName);
    $('#color-label').css('color', colorCode);
  });
}

// size box
$('.size-card').on('click', function () {
  $('.size-card').removeClass('active');
  $(this).addClass('active');
  const cardId = $(this).attr('id');
  if (cardId === 'customCard') {
    $('.popup-slider').show(200);
  }
});

$('.custom-size-btn').on('click', function (e) {
  e.preventDefault();
  $('.popup-slider').hide(200);
});

// slider
$(function () {
  $('#slider').slider();
});

// backing style
function triggerStyleCardClickEvent() {
  $('.style-card').on('click', function () {
    $('.style-card').removeClass('active');
    $(this).addClass('active');
    const dataId = $(this).attr('data-id');
    pricingData.add_ons.backing_style = parseInt(dataId);
    calculationNeonWord();
  });
}

// backing color
function triggerBackingColorCardClickEvent() {
  $('.backing-color-card').on('click', function () {
    $('.backing-color-card').removeClass('active');
    $(this).addClass('active');
    const dataId = $(this).attr('data-id');
    pricingData.add_ons.backing_color = parseInt(dataId);
    calculationNeonWord();
  });
}

// extra box
$('.waterproof-link').on('click', function (e) {
  e.preventDefault();
  $('.waterproof-link').removeClass('active');
  $(this).addClass('active');
  const dataValue = $(this).attr('data-value');
  pricingData.add_ons.waterproof = dataValue.toLocaleLowerCase();
  calculationNeonWord();
});

$('.choose-remote-link').on('click', function (e) {
  e.preventDefault();
  $('.choose-remote-link').removeClass('active');
  $(this).addClass('active');
  const dataValue = $(this).attr('data-value');
  pricingData.add_ons.remote = dataValue.toLocaleLowerCase();
  calculationNeonWord();
});

$('.choose-mount-link').on('click', function (e) {
  e.preventDefault();
  $('.choose-mount-link').removeClass('active');
  $(this).addClass('active');
  const dataValue = $(this).attr('data-value');
  pricingData.add_ons.mounting = dataValue.toLocaleLowerCase();
  calculationNeonWord();
});

$('.done-btn').on('click', function (e) {
  e.preventDefault();
  $('.next-btn').trigger('click');
});

// add to cart and redirect user to checkout page
// variantId is the id of the product's variant which is to be added to the cart
function addToCart(variantId) {
  const url = '/cart/add.js';
  const orderData = {
    items: [],
  };
  orderData.items.push({
    id: variantId,
    quantity: 1,
  });
  postData(url, orderData, function (data) {
    // check if success and redirect
    window.location.href = '/checkout';
  });
}
