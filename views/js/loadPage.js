$(document).ready(async () => {
  let url = window.location.href;
  if (url.indexOf("admin.php") != -1) {
    if ((await isLogin()) == 1 && (await getRole()) != "1") {
      let tab = document.querySelector("#header .top .top-menu .tab-title");
      if (tab != null) tab.click();
    } else {
      window.location.href = "index.php";
    }
  } else if (url.indexOf("index.php") != -1) {
    if ((await isLogin()) == 1) {
      if ((await getRole()) == 1) {
        loadHomeByAjax(1);
      } else {
        logout();
      }
    } else {
      loadHomeByAjax(1);
    }
  } else {
    loadHomeByAjax(1);
  }
});

const loadPageByAjax = async (pageTarget) => {
  $.ajax({
    url: "views/pages/user/content.php",
    type: "POST",
    data: { page: pageTarget },
    dataType: "html",
    success: function (data) {
      document.querySelector("#content").innerHTML = data;
      if (pageTarget == "myAccount") setUserInfo();
      if (pageTarget == "Statistic") {
        // statistic1();
        // statistic2();
        // statistic3();
        statistic4();
      }
    },
  });
};

const filterByCategory = (category) => {
  // Xóa trạng thái "active" khỏi tất cả các mục
  document
    .querySelectorAll(".header-category .category-item")
    .forEach((item) => {
      item.classList.remove("active");
    });

  // Đặt trạng thái "active" cho mục được chọn
  const selectedItem = document.querySelector(
    `.header-category .category-item[data-value="${category}"]`
  );
  if (selectedItem) selectedItem.classList.add("active");

  // Gọi hàm loadHomeByAjax để tải dữ liệu
  loadHomeByAjax(1);
};

const loadHomeByAjax = (currentPage) => {
  let name = document.querySelector("#search #search-btn").value;
  let selectedCategory = document.querySelector(
    ".header-category .category-item.active"
  );
  let category = selectedCategory
    ? selectedCategory.getAttribute("data-value")
    : 0;
  let priceStartInput = document.querySelector("#search .price-begin input");
  let priceEndInput = document.querySelector("#search .price-end input");
  if (priceStartInput.value != "" && isNaN(priceStartInput.value)) {
    customNotice(
      "fa-sharp fa-light fa-circle-exclamation",
      "Start price must be a number!",
      3
    );
    priceStartInput.focus();
    return;
  }
  if (priceEndInput.value != "" && isNaN(priceEndInput.value)) {
    customNotice(
      "fa-sharp fa-light fa-circle-exclamation",
      "End price must be a number!",
      3
    );
    priceEndInput.focus();
    return;
  }
  if (
    priceStartInput.value != "" &&
    priceEndInput.value != "" &&
    parseFloat(priceStartInput.value) > parseFloat(priceEndInput.value)
  ) {
    customNotice(
      "fa-sharp fa-light fa-circle-exclamation",
      "Start price must be smaller than end price!",
      3
    );
    priceStartInput.focus();
    return;
  }
  if (
    (priceStartInput.value != "" &&
      priceEndInput.value != "" &&
      parseFloat(priceStartInput.value) < 0) ||
    parseFloat(priceEndInput.value) < 0
  ) {
    customNotice(
      "fa-sharp fa-light fa-circle-exclamation",
      "Price must be more than or equal 0!",
      3
    );
    priceStartInput.focus();
    return;
  }
  priceStart = priceStartInput.value;
  priceEnd = priceEndInput.value;
  $.ajax({
    url: "views/pages/user/home.php",
    type: "POST",
    data: {
      name: name,
      category: category,
      priceStart: priceStart,
      priceEnd: priceEnd,
      currentPage: currentPage,
    },
    dataType: "html",
    success: function (data) {
      document.querySelector("#content").innerHTML = data;
      const searchBar = document.querySelector("#search-bar");
      if (searchBar) {
        searchBar.style.display = "block"; // Hiển thị thanh tìm kiếm
      }

      const tabs = document.querySelectorAll("#header .tab-title");
      tabs.forEach((tab) => tab.classList.remove("active")); // Xóa trạng thái "active" khỏi tất cả các nút
      const homeTab = document.querySelector(
        "#header .tab-title[onclick*='home']"
      );
      if (homeTab) homeTab.classList.add("active"); // Đặt trạng thái "active" cho nút Home
    },
  });
};

const resetHomePage = () => {
  // Gửi yêu cầu AJAX để tải lại trang home với bộ lọc mặc định
  $.ajax({
    url: "views/pages/user/home.php",
    type: "POST",
    data: {
      name: "", // Tên tìm kiếm mặc định
      category: 0, // Danh mục mặc định là "ALL"
      priceStart: "", // Giá bắt đầu mặc định
      priceEnd: "", // Giá kết thúc mặc định
      currentPage: 1, // Trang đầu tiên
    },
    dataType: "html",
    success: function (data) {
      document.querySelector("#content").innerHTML = data;

      // Làm sạch giao diện tìm kiếm
      document.querySelector("#search-btn").value = ""; // Xóa tên tìm kiếm
      document.querySelector(".price-begin input").value = ""; // Xóa giá bắt đầu
      document.querySelector(".price-end input").value = ""; // Xóa giá kết thúc

      // Đặt trạng thái "active" cho danh mục "ALL"
      document
        .querySelectorAll(".header-category .category-item")
        .forEach((item) => {
          item.classList.remove("active");
        });
      const allCategory = document.querySelector(
        ".header-category .category-item[data-value='0']"
      );
      if (allCategory) allCategory.classList.add("active");
    },
    error: function () {
      console.error("Failed to reset the home page.");
    },
  });
};

const loadAlbumByAjax = (currentPage = 1) => {
  let name = document.querySelector(".search-bar .search-input input").value;
  let category = document.querySelector(
    ".search-bar .filter-input select"
  ).value;
  let priceStartInput = document.querySelector(
    ".search-bar .price-begin input"
  );
  let orderDirection = rotationDegrees % 360 == 0 ? 1 : 2; //1 is down, 2 is up
  console.log(rotationDegrees % 360);
  let priceEndInput = document.querySelector(".search-bar .price-end input");
  if (priceStartInput.value != "" && isNaN(priceStartInput.value)) {
    customNotice(
      "fa-sharp fa-light fa-circle-exclamation",
      "Start price must be a number!",
      3
    );
    priceStartInput.focus();
    return;
  }
  if (priceEndInput.value != "" && isNaN(priceEndInput.value)) {
    customNotice(
      "fa-sharp fa-light fa-circle-exclamation",
      "End price must be a number!",
      3
    );
    priceEndInput.focus();
    return;
  }
  if (
    priceStartInput.value != "" &&
    priceEndInput.value != "" &&
    parseFloat(priceStartInput.value) > parseFloat(priceEndInput.value)
  ) {
    customNotice(
      "fa-sharp fa-light fa-circle-exclamation",
      "Start price must be smaller than end price!",
      3
    );
    priceStartInput.focus();
    return;
  }
  if (
    (priceStartInput.value != "" &&
      priceEndInput.value != "" &&
      parseFloat(priceStartInput.value) < 0) ||
    parseFloat(priceEndInput.value) < 0
  ) {
    customNotice(
      "fa-sharp fa-light fa-circle-exclamation",
      "Price must be more than or equal 0!",
      3
    );
    priceStartInput.focus();
    return;
  }
  priceStart = priceStartInput.value;
  priceEnd = priceEndInput.value;

  $.ajax({
    url: "views/pages/admin/productManager.php",
    type: "POST",
    data: {
      name: name,
      category: parseFloat(category),
      priceStart: priceStart,
      priceEnd: priceEnd,
      orderDirection: orderDirection,
      currentPage: currentPage,
    },
    dataType: "html",
    success: function (data) {
      document.querySelector("#content").innerHTML = data;
      document.querySelector(".search-bar .search-input input").value = name;
      document.querySelector(".search-bar .filter-input select").value =
        category;
      if (priceStart != -1) {
        document.querySelector(".search-bar .price-begin input").value =
          priceStart;
      }
      if (priceEnd != -1) {
        document.querySelector(".search-bar .price-end input").value = priceEnd;
      }
      let arrow = document.querySelector(
        "#productManager .title-list .title:nth-of-type(3) i"
      );
      arrow.style.transform = `rotate(${rotationDegrees}deg)`;
    },
  });
};

const loadOrderByAjax = (currentPage = 1) => {
  let name = document.querySelector(".search-bar .search-input input").value;
  let category = document.querySelector(
    ".search-bar .filter-input select"
  ).value;
  let address = document.querySelector(
    ".search-bar .search-address-input input"
  ).value;
  let datStartInput = document.querySelector(".search-bar .date-begin input");
  let dateEndInput = document.querySelector(".search-bar .date-end input");
  if (datStartInput.value != "" && dateEndInput.value != "") {
    if (new Date(datStartInput.value) > new Date(dateEndInput.value)) {
      customNotice(
        "fa-sharp fa-light fa-circle-exclamation",
        "Start date must be smaller than end date!",
        3
      );
      datStartInput.focus();
      return;
    }
  }
  $.ajax({
    url: "views/pages/admin/orderManager.php",
    type: "POST",
    data: {
      name: name,
      category: category,
      address: address,
      dateStart: datStartInput.value,
      dateEnd: dateEndInput.value,
      currentPage: currentPage,
    },
    dataType: "html",
    success: function (data) {
      document.querySelector("#content").innerHTML = data;
      document.querySelector(".search-bar .search-input input").value = name;
      document.querySelector(".search-bar .filter-input select").value =
        category;
      document.querySelector(".search-bar .search-address-input input").value =
        address;
      document.querySelector(".search-bar .date-begin input").value =
        datStartInput.value;
      document.querySelector(".search-bar .date-end input").value =
        dateEndInput.value;
    },
  });
};

function suggestAddress(query) {
  if (query.length === 0) {
    document.getElementById("addressSuggestions").style.display = "none";
    return;
  }

  document
    .getElementById("searchAddress")
    .addEventListener("input", function () {
      const address = this.value.trim(); // Loại bỏ khoảng trắng thừa
      suggestAddress(address); // Gọi hàm gợi ý địa chỉ

      // Nếu ô input không rỗng, gọi loadOrderByAjax
      if (address === "") {
        loadOrderByAjax(1);
      }
    });

  $.ajax({
    url: "util/suggestAddress.php", // File xử lý gợi ý
    type: "POST",
    data: { query: query },
    success: function (data) {
      const suggestions = document.getElementById("addressSuggestions");
      suggestions.innerHTML = data;
      suggestions.style.display = "block";
    },
    error: function () {
      console.error("Failed to fetch address suggestions.");
    },
  });
}

function formatDateToMySQL(date) {
  const [day, month, year] = date.split("/");
  return `${year}-${month}-${day}`;
}

function handleDateChange(inputId) {
  const input = document.getElementById(inputId);
  const dateValue = input.value.trim();

  // Kiểm tra định dạng ngày hợp lệ (dd/MM/yyyy)
  if (/^\d{2}\/\d{2}\/\d{4}$/.test(dateValue)) {
    const formattedDate = formatDateToMySQL(dateValue);
    console.log(`Formatted Date (${inputId}):`, formattedDate);
    loadOrderByAjax(1); // Gọi hàm tải lại dữ liệu
  } else {
    alert("Invalid date format. Please use dd/MM/yyyy.");
  }
}

function selectAddress(address) {
  document.getElementById("searchAddress").value = address;
  document.getElementById("addressSuggestions").style.display = "none";
}

let currentPage = "home";

const loadProductDetailsByAjax = (albumID, page) => {
  currentPage = page;
  $.ajax({
    url: "views/pages/user/productDetails.php",
    type: "POST",
    data: { albumID: albumID },
    dataType: "html",
    success: function (data) {
      // if (page == 1) {
      // document.querySelector("#detailProduct").innerHTML = data;
      // document.querySelector("#detailProduct").style.display = "inherit";
      // document.querySelector("#home").style.display = "none";
      // } else {
      //   document.querySelector("#detailProduct2").innerHTML = data;
      //   document.querySelector("#detailProduct2").style.display = "inherit";
      //   document.querySelector("#favorite").style.display = "none";
      // }
      document.querySelector("#detailProduct").innerHTML = data;
      document.querySelector("#detailProduct").style.display = "inherit";

      if (page === "favorites") {
        document.querySelector("#favorite").style.display = "none";
      } else {
        document.querySelector("#home").style.display = "none";
      }
    },
  });
};

function closeDetailProductInHome() {
  // if (page == 1) {
  // document.querySelector("#home").style.display = "inherit";
  // document.querySelector("#detailProduct").style.display = "none";
  // } else {
  //   document.querySelector("#favorite").style.display = "inherit";
  //   document.querySelector("#detailProduct").style.display = "none";
  // }

  document.querySelector("#detailProduct").style.display = "none";

  if (currentPage === "favorites") {
    document.querySelector("#favorite").style.display = "inherit";
  } else {
    document.querySelector("#home").style.display = "inherit";
  }
}

const loadProductDetailsByAjaxFavourite = (albumID) => {
  $.ajax({
    url: "views/pages/user/productDetails.php",
    type: "POST",
    data: { albumID: albumID },
    dataType: "html",
    success: function (data) {
      document.querySelector("#detailProduct2").innerHTML = data;
      document.querySelector("#detailProduct2").style.display = "inherit";
      document.querySelector("#favorite").style.display = "none";
    },
  });
};

// function closeDetailProductInHome() {
//   document.querySelector("#favorite").style.display = "inherit";
//   document.querySelector("#detailProduct").style.display = "none";
// }

const loadModalBoxByAjax = (modalBoxTarget, id) => {
  $.ajax({
    url: "views/pages/admin/modalBox.php",
    type: "POST",
    data: { modalBox: modalBoxTarget, id: id },
    dataType: "html",
    success: function (data) {
      document.querySelector("#modal-box").innerHTML = data;
      if (modalBoxTarget == "editAccount") setAccountInfo();
      else if (modalBoxTarget == "editOrder") setOrderInfo();
    },
  });
};
const tabNoticeNotNow = (input) => {
  input.parentElement.parentElement.style.display = "none";
};
const tabNoticeLogIn = (input) => {
  tabNoticeNotNow(input);
  loadLoginByAjax("signIn");
};
const hideTabNotice = () => {
  let tabNoticeAll = document.querySelectorAll("#header .tab-notice");
  tabNoticeAll.forEach((element) => {
    element.style.display = "none";
  });
};
const removeColorTab = () => {
  let tabActive = document.querySelector("#header .tab-title.active");
  if (tabActive != null) tabActive.classList.remove("active");
};

const selectMenu = async (selectedTab, pageTarget) => {
  hideTabNotice();
  let loginPage = document.querySelector("#login");
  if (!((await isLogin()) == 1) && pageTarget != "home") {
    if (!loginPage) {
      selectedTab.childNodes[5].style.display = "block";
    }
    return;
  }
  removeColorTab();
  selectedTab.classList.add("active");

  const searchContainer = document.getElementById("search");
  if (searchContainer) {
    if (pageTarget === "home") {
      searchContainer.style.display = "flex"; // Hiển thị thanh tìm kiếm
    } else {
      searchContainer.style.display = "none"; // Ẩn thanh tìm kiếm
    }
  }
  
  const homeTab = document.querySelector("#header .tab-title[onclick*='home']");
  if (pageTarget === "home" && homeTab) {
    homeTab.classList.add("active"); // Đặt trạng thái "active" cho tab Home
  }

  if (pageTarget == "home") return;
  loadPageByAjax(pageTarget);
};
const selectMenuFooter = () => {
  hideTabNotice();
  removeColorTab();
  loadPageByAjax("footer");
};
const selectMenuAdmin = (selectedTab, pageTarget) => {
  removeColorTab();
  selectedTab.classList.add("active");
  loadPageByAjax(pageTarget);
};
const loadLoginByAjax = (pageTarget) => {
  const login = document.querySelector("#login");
  if (login == null) {
    $.ajax({
      url: "views/pages/user/content.php",
      type: "POST",
      data: { page: "login" },
      dataType: "html",
      success: function (data) {
        document.querySelector("#content").innerHTML = data;
        if (pageTarget == "signUp") {
          document.querySelector("#content").innerHTML = data;
          const poster = document.querySelector("#login .poster");
          poster.style.transform = "translateX(-100%)";
          poster.style.backgroundPosition = "left";
          const left = document.querySelector("#login .left");
          left.style.transform = "translateX(50%)";
          left.style.zIndex = "1";
          left.style.opacity = "0";
          const right = document.querySelector("#login .right");
          right.style.transform = "translateX(100%)";
          right.style.opacity = "1";
          right.style.zIndex = "2";
        }
      },
    });
  } else {
    if (pageTarget == "signUp") {
      const poster = document.querySelector("#login .poster");
      poster.style.transform = "translateX(-100%)";
      poster.style.backgroundPosition = "left";
      const left = document.querySelector("#login .left");
      left.style.transform = "translateX(50%)";
      left.style.zIndex = "1";
      left.style.opacity = "0";
      const right = document.querySelector("#login .right");
      right.style.transform = "translateX(100%)";
      right.style.opacity = "1";
      right.style.zIndex = "2";
    } else {
      const poster = document.querySelector("#login .poster");
      poster.style.transform = "translateX(0)";
      poster.style.backgroundPosition = "right";
      const left = document.querySelector("#login .left");
      left.style.transform = "translateX(0)";
      left.style.zIndex = "2";
      left.style.opacity = "1";
      const right = document.querySelector("#login .right");
      right.style.transform = "translateX(50%)";
      right.style.zIndex = "1";
      right.style.opacity = "0";
    }
  }
};
$("#content").on("keypress", "#login #password-field", function (e) {
  if (e.which == 13) {
    login();
  }
});
