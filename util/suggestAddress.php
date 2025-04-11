<?php
require("../util/dataProvider.php");
$dp = new DataProvider();

// if (isset($_POST['query'])) {
//     $query = $_POST['query'];
//     $sql = "SELECT DISTINCT diaChiGiaoHang FROM hoadon WHERE diaChiGiaoHang LIKE '%$query%' LIMIT 10";
//     $result = $dp->excuteQuery($sql);

//     if ($result->num_rows > 0) {
//         while ($row = $result->fetch_assoc()) {
//             echo '<div onclick="selectAddress(\'' . htmlspecialchars($row['diaChiGiaoHang'], ENT_QUOTES) . '\')">' . htmlspecialchars($row['diaChiGiaoHang']) . '</div>';
//         }
//     } else {
//         echo '<div>No suggestions found</div>';
//     }
// }

if (isset($_POST['query'])) {
    $query = $_POST['query'];

    // Cắt chuỗi để lấy phần sau dấu phẩy
    $queryParts = explode(',', $query);
    $query = trim(end($queryParts)); // Lấy phần cuối và loại bỏ khoảng trắng

    $sql = "SELECT DISTINCT diaChiGiaoHang FROM hoadon WHERE diaChiGiaoHang LIKE '%$query%' LIMIT 10";
    $result = $dp->excuteQuery($sql);

    $uniqueAddresses = []; // Mảng để lưu các địa chỉ duy nhất

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            // Cắt chuỗi để chỉ lấy phần cuối của địa chỉ
            $addressParts = explode(',', $row['diaChiGiaoHang']);
            $shortAddress = trim(end($addressParts)); // Lấy phần cuối và loại bỏ khoảng trắng

            // Kiểm tra xem địa chỉ đã tồn tại trong mảng chưa
            if (!in_array($shortAddress, $uniqueAddresses)) {
                $uniqueAddresses[] = $shortAddress; // Thêm địa chỉ vào mảng nếu chưa tồn tại
                echo '<div onclick="selectAddress(\'' . htmlspecialchars($shortAddress, ENT_QUOTES) . '\')">' . htmlspecialchars($shortAddress, ENT_QUOTES) . '</div>';
            }
        }
    } else {
        echo '<div>No suggestions found</div>';
    }
}
?>