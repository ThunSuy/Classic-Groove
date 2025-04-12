<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
    flatpickr("#dateStart", {
        dateFormat: "d/m/Y", // Định dạng ngày dd/MM/yyyy
        onChange: function(selectedDates, dateStr, instance) {
            console.log("Selected Date Start:", dateStr);
            loadOrderByAjax(1); // Gọi hàm tải lại dữ liệu
        },
    });

    flatpickr("#dateEnd", {
        dateFormat: "d/m/Y", // Định dạng ngày dd/MM/yyyy
        onChange: function(selectedDates, dateStr, instance) {
            console.log("Selected Date End:", dateStr);
            loadOrderByAjax(1); // Gọi hàm tải lại dữ liệu
        },
    });
</script>

<?php
require("../../../util/dataProvider.php");
require("../../../util/pagination.php");
$dp = new DataProvider();

$currentPage = isset($_POST['currentPage']) ? (int)$_POST['currentPage'] : 1;
$quantityPerPage = 10; // Số dòng mỗi trang

if (
    isset($_POST['name']) && isset($_POST['category'])
    && isset($_POST['dateStart']) && isset($_POST['dateEnd']) && isset($_POST['address'])
) {
    $name = $_POST['name'];
    $category = $_POST['category'];
    $address = $_POST['address'];
    $dateStart = $_POST['dateStart'];
    $dateEnd = $_POST['dateEnd'];
    $order = searchOrder($name, $category,$address, $dateStart, $dateEnd);
} else {
    $order = getAllOrder();
}
// if ($dateStart != "") {
//     $dateStart = DateTime::createFromFormat('d/m/Y', $dateStart)->format('Y-m-d');
// }
// if ($dateEnd != "") {
//     $dateEnd = DateTime::createFromFormat('d/m/Y', $dateEnd)->format('Y-m-d');
// }

// Sử dụng lớp Pagination
$pagination = new Pagination($order, $quantityPerPage, $currentPage);
?>
<div id="orderManager">
    <div class="header">
        <h2><i class="fa-regular fa-list"></i> Order management</h2>
        <div class="search-bar">
            <div class="search-input">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="text" placeholder="Looking for somethings?" onchange="loadOrderByAjax(1)">
            </div>
            <!-- <div class="search-input">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="text" placeholder="Address (City)">
            </div> -->
            <div class="search-address-input">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="text" placeholder="Address (City)" id="searchAddress" oninput="suggestAddress(this.value)">
                <div id="addressSuggestions" class="suggestions" onclick="loadOrderByAjax(1)"></div>
            </div>
            <div class="filter-input">
                <i class="fa-regular fa-filter"></i>
                <select name="" id="" onchange="loadOrderByAjax(1)">
                    <option value="All">All</option>
                    <option value="Unconfirmed">Unconfirmed</option>
                    <option value="Confirmed">Confirmed</option>
                    <option value="Shipping">Shipping</option>
                    <option value="Successful">Successful</option>
                    <option value="Failed">Failed</option>
                    <option value="Cancel">Cancel</option>
                </select>
            </div>
            <div class="date-begin">
                <input type="date" name="" id="dateStart" onchange="loadOrderByAjax(1)">
            </div>
            <div class="date-end">
                <input type="date" name="" id="dateEnd" onchange="loadOrderByAjax(1)">
            </div>
        </div>
    </div>
    <div class="title-list">
        <div class="title-placeholder">
            <div class="title" style="padding-right: 10px;">No.</div>
            <div class="title" style="padding-right: 15px;">Order ID</div>
            <div class="title" style="padding-right: 15px;">Account ID</div>
            <div class="title" style="padding-right: 10px;">Date of order</div>
            <div class="title" style="padding-right: 10px;">Total price</div>
            <div class="title" style="padding-right: 10px;">Payment</div>
            <div class="title" style="padding-right: 10px;">Status</div>
            <div class="title"></div>
        </div>
    </div>
    <div class="list">
        <?php for ($i = $pagination->startProduct(); $i <= $pagination->endProduct(); $i++): ?>
            <div class="placeholder" data-id="<?= $order[$i]['maHoaDon'] ?>">
                <div class="info">
                    <div class="item">
                        <?= sprintf("%02d", $i + 1) ?>
                    </div>
                    <div class="item">
                        <?= $order[$i]['maHoaDon'] ?>
                    </div>
                    <div class="item">
                        <?= $order[$i]['khachHang'] ?>
                    </div>
                    <div class="item">
                        <?= date("d/m/Y H:i", strtotime($order[$i]['thoiGianDat'])) ?>
                    </div>
                    <div class="item">
                        <?= "$" . $order[$i]['tongTien'] ?>
                    </div>
                    <div class="item">
                        <div class="item">
                            <?= $order[$i]['hinhThucNhanHang'] ?>
                        </div>
                    </div>
                    <div class="item" data-field="status">
                        <?= $order[$i]['trangThai'] ?>
                    </div>
                    <div class="item" onclick="loadModalBoxByAjax('editOrder',<?= $order[$i]['maHoaDon'] ?>)"><i
                            class="fa-regular fa-circle-info"></i></div>
                </div>
            </div>
        <?php endfor ?>
    </div>
    <?php if ($pagination->quantityPage > 1): ?>
        <div class="pagination-placeholder">
            <div class="pagination-box">
                <?php if ($pagination->currentPage > 1): ?>
                    <div class="item" onclick="loadOrderByAjax(<?= $pagination->prevDot() ?>)">
                        <i class="fa-solid fa-chevron-left"></i>
                    </div>
                <?php else: ?>
                    <div class="item hide" style="cursor: default;">
                        <i style="color: var(--gr1)" class="fa-solid fa-chevron-left"></i>
                    </div>
                <?php endif ?>
                <div class="item">
                    <?= $pagination->currentPage . " OF " . $pagination->quantityPage ?>
                </div>
                <?php if ($pagination->currentPage < $pagination->quantityPage): ?>
                    <div class="item" onclick="loadOrderByAjax(<?= $pagination->nextDot() ?>)">
                        <i class="fa-solid fa-chevron-right"></i>
                    </div>
                <?php else: ?>
                    <div class="item hide" style="cursor: default;">
                        <i style="color: var(--gr1)" class="fa-solid fa-chevron-right"></i>
                    </div>
                <?php endif ?>
            </div>
        </div>
    <?php endif ?>
    <div id="modal-box"></div>
</div>


<?php
function getAllOrder()
{
    global $dp;
    // $sql = "SELECT * FROM hoadon";
    $sql = "SELECT * FROM hoadon ORDER BY thoiGianDat DESC";
    $result = $dp->excuteQuery($sql);
    $order = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            array_push($order, $row);
        }
    }
    return $order;
}

function searchOrder($name, $category, $address, $dateStart, $dateEnd)
{
    global $dp;
    $sql = "SELECT * FROM hoadon ";
    $f = false; // Biến để kiểm tra xem có điều kiện nào đã được thêm vào chưa

    // Kiểm tra các điều kiện tìm kiếm
    if ($name != "" || $category != "All" || $address != "" || ($dateStart != "" && $dateEnd != "")) {
        $sql .= "WHERE ";
        if ($name != "") {
            $sql .= " (khachHang LIKE '%$name%' ";
            $sql .= " OR maHoaDon LIKE '%$name%') ";
            $f = true;
        }
        if ($category != "All") {
            if ($f) {
                $sql .= "AND ";
            }
            $sql .= "trangThai = '$category' ";
            $f = true;
        }
        if ($address != "") { // Chỉ thêm điều kiện address nếu không phải chuỗi trống
            if ($f) {
                $sql .= "AND ";
            }
            $sql .= "diaChiGiaoHang LIKE '%$address%' ";
            $f = true;
        }
        if ($dateStart != "" && $dateEnd != "") {
            if ($f) {
                $sql .= "AND ";
            }
            $sql .= "thoiGianDat >= '$dateStart' AND thoiGianDat <= '$dateEnd' ";
        }
    }

    $sql .= "ORDER BY thoiGianDat DESC";

    $result = $dp->excuteQuery($sql);
    $order = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            array_push($order, $row);
        }
    }
    return $order;
}

// function searchOrder($name, $category, $dateStart, $dateEnd)
// {
//     global $dp;
//     $sql = "SELECT * FROM hoadon ";
//     $f = false;

//     if ($name != "" || $category != "All" || $dateStart != "" && $dateEnd != "") {
//         $sql .= "WHERE ";
//         if ($name != "") {
//             $sql .= " (khachHang LIKE '%$name%' ";
//             $sql .= " or maHoaDon LIKE '%$name%') ";

//             $f = true;
//         }
//         if ($category != "All") {
//             if ($f) {
//                 $sql .= "AND ";
//             }
//             $sql .= "trangThai = '$category' ";
//             $f = true;
//         }
//         if ($dateStart != "" && $dateEnd != "") {
//             if ($f) {
//                 $sql .= "AND ";
//             }
//             $sql .= "thoiGianDat >= '$dateStart' And thoiGianDat <= '$dateEnd'";
//         }
//     }
//     $sql .= "ORDER BY thoiGianDat DESC";

//     $result = $dp->excuteQuery($sql);
//     $order = array();
//     if ($result->num_rows > 0) {
//         while ($row = $result->fetch_assoc()) {
//             array_push($order, $row);
//         }
//     }
//     return $order;
// }
?>