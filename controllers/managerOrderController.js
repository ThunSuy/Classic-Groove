let orderStatus = null;
let orderID = null;
let isOrderDiff = false;
const setOrderInfo = () => {
  orderStatus = document.querySelector("#edit-order .orderStatus").value;
  orderID = document.querySelector("#edit-order .orderID").value;
};
const isOrderInfoChange = () => {
  let saveBtn = document.querySelector("#edit-order .btnOrderSave");
  if (orderStatus == document.querySelector("#edit-order .orderStatus").value) {
    saveBtn.style.cursor = "no-drop";
    saveBtn.style.opacity = "0.5";
    isOrderDiff = false;
  } else {
    saveBtn.style.cursor = "pointer";
    saveBtn.style.opacity = "1";
    isOrderDiff = true;
  }
};
// const updateOrder = () => {
//   if (!isOrderDiff) return;
//   setOrderInfo();
//   $.ajax({
//     url:
//       "util/order.php?status=" +
//       orderStatus +
//       "&orderID=" +
//       orderID +
//       "&action=updateOrder",
//     type: "PUT",
//     success: function (res) {
//       if (res == "Not enough product quantity") {
//         customNotice(
//           "fa-sharp fa-light fa-circle-exclamation",
//           "Not enough product quantity!",
//           3
//         );
//       } else if (res != "Success") alert(res);
//       else {
//         customNotice(
//           "fa-sharp fa-light fa-circle-check",
//           "Update successfully!",
//           1
//         );
//         loadPageByAjax("Order");
//       }
//     },
//   });
// };
const updateOrder = () => {
  if (!isOrderDiff) return;
  setOrderInfo();

  $.ajax({
    url:
      "util/order.php?status=" +
      orderStatus +
      "&orderID=" +
      orderID +
      "&action=updateOrder",
    type: "PUT",
    success: function (res) {
      if (res === "Success") {
        customNotice(
          "fa-sharp fa-light fa-circle-check",
          "Order updated successfully!",
          1
        );
        loadModalBoxByAjax('editOrder',orderID);
        // Tải lại dữ liệu bảng hoặc thông tin order vừa cập nhật
        loadUpdatedOrder(orderID);
        
      } else {
        customNotice(
          "fa-sharp fa-light fa-circle-exclamation",
          "Failed to update order!",
          3
        );
      }
    },
    error: function () {
      customNotice(
        "fa-sharp fa-light fa-circle-exclamation",
        "An error occurred while updating the order!",
        3
      );
    },
  });
};

const loadUpdatedOrder = (orderID) => {
  $.ajax({
    url: "util/order.php?action=getOrderInfo&orderID=" + orderID,
    type: "GET",
    dataType: "json",
    success: function (order) {
      console.log(order);
      if (order) {
        // Cập nhật thông tin của order trong bảng
        const row = document.querySelector(
          `#orderManager .list .placeholder[data-id="${orderID}"]`
        );
        if (row) {
          row.querySelector("#orderManager .item[data-field='status']").innerText =
            order.trangThai;
          // row.querySelector("#orderManager .item[data-field='address']").innerText =
          //   order.diaChiGiaoHang;
          // // row.querySelector("#orderManager .item[data-field='phone']").innerText =
          // //   order.phone;
          // row.querySelector(
          //   ".item[data-field='total']"
          // ).innerText = `$${order.tongTien}`;
        } else{
          console.error("Order row not found.");
        }
      } else {
        console.error("Failed to load updated order.");
      }
    },
    error: function () {
      console.error("An error occurred while loading the updated order.");
    },
  });
};
