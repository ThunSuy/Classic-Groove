<?php
require("../../../util/dataProvider.php");
$dp = new DataProvider();
$orderID = $_POST['id'];
$order = getOrder($orderID);
$detailOrder = getDetailOrder($orderID);

?>
<div class="modal-placeholder" id="edit-order">
    <div class="modal-box">
        <div class="modal-header ">
            <h1><i class="fa-regular fa-square-kanban fa-rotate-270"></i> Edit order</h1>
        </div>
        <div class="modal-left">
            <div class="modal-info ">
                <div class="modal-item">
                    <div class="item-header">Order id</div>
                    <div class="item-input"><input type="text" class="orderID" value="<?= $order['maHoaDon'] ?>"
                            disabled></div>
                </div>
                <div class="modal-item">
                    <div class="item-header">Account id</div>
                    <div class="item-input"><input type="text" class="orderAccount" value="<?= $order['khachHang'] ?>"
                            disabled></div>
                </div>
                <div class="modal-item">
                    <div class="item-header">Date of order</div>
                    <div class="item-input"><input type="text" class="orderDate"
                            value="<?= date("d/m/Y", strtotime($order['thoiGianDat'])) ?>" disabled></div>
                </div>
                <div class="modal-item">
                    <div class="item-header">Total price</div>
                    <div class="item-input"><input type="text" class="orderPrice" value="<?= $order['tongTien'] ?>"
                            disabled></div>
                </div>
                <div class="modal-item">
                    <div class="item-header">Payment</div>
                    <div class="item-input"><input type="text" class="orderMode" value="<?= $order['hinhThucNhanHang'] ?>"
                            disabled>
                    </div>
                </div>
                <!-- <div class="modal-item">
                    <div class="item-header">Status</div>
                    <div class="item-input"><select name="" id="" onchange="isOrderInfoChange()" class="orderStatus">
                            <option value="?= $order['trangThai'] ?>"> ?= $order['trangThai'] ?></option>
                            ?php if ($order['trangThai'] == "Pending"): ?>
                                <option value="Shipping">Shipping</option>
                            ?php elseif ($order['trangThai'] == "Shipping"): ?>
                                <option value="Delivered">Delivered</option>
                            ?php endif; ?>

                        </select>
                    </div>
                </div> -->
                <!-- <div class="modal-item">
                    <div class="item-header">Status</div>
                    <div class="item-input">
                        <select name="" id="" onchange="isOrderInfoChange()" class="orderStatus">
                            
                            <option value="?= $order['trangThai'] ?>">?= $order['trangThai'] ?></option>
                            ?php if ($order['hinhThucNhanHang'] === "Online"): ?>
                                ?php if ($order['trangThai'] === "Unconfirmed"): ?>
                                    <option value="Confirmed">Confirmed</option>
                                ?php elseif ($order['trangThai'] === "Confirmed"): ?>
                                    <option value="Shipping">Shipping</option>
                                ?php elseif ($order['trangThai'] === "Shipping"): ?>
                                    <option value="Successful">Successful</option>
                                    <option value="Failed">Failed</option>
                                ?php endif; ?>
                            ?php elseif ($order['hinhThucNhanHang'] === "Onsite"): ?>
                                ?php if ($order['trangThai'] === "Unconfirmed"): ?>
                                    <option value="Confirmed">Confirmed</option>
                                ?php elseif ($order['trangThai'] === "Confirmed"): ?>
                                    <option value="Successful">Successful</option>
                                    <option value="Failed">Failed</option>
                                ?php endif; ?>
                            ?php endif; ?>
                        </select>
                    </div>
                </div> -->
                <div class="modal-item">
                    <div class="item-header">Status</div>
                    <div class="item-input">
                        <select name="" id="" onchange="isOrderInfoChange()" class="orderStatus"
                            <?= ($order['trangThai'] === "Successful" || $order['trangThai'] === "Failed") ? "disabled" : "" ?>>
                            <option value="<?= $order['trangThai'] ?>"><?= $order['trangThai'] ?></option>
                            <?php if ($order['trangThai'] === "Unconfirmed"): ?>
                                <option value="Confirmed">Confirmed</option>
                            <?php elseif ($order['trangThai'] === "Confirmed"): ?>
                                <option value="Shipping">Shipping</option>
                            <?php elseif ($order['trangThai'] === "Shipping"): ?>
                                <option value="Successful">Successful</option>
                                <option value="Failed">Failed</option>
                            <?php endif; ?>
                        </select>
                    </div>
                </div>
                <div class="modal-item" style=" grid-column: 1 / 3; width: 90%; margin: 0 5%;">
                    <div class="item-header">Address</div>
                    <div class="item-input"><input type="text" disabled value="<?= $order['diaChiGiaoHang'] ?>"
                            class="orderAddress"></div>
                </div>
                <div class="modal-item" style=" grid-column: 1 / 3; width: 90%; margin: 0 5%;">
                <div class="item-header">Phone</div>
                <div class="item-input"><input type="text" class="orderAddress"
                        value="<?= $order['phone'] ?>" disabled></div>
            </div>
            </div>
        </div>
        <div class="modal-right ">
            <div class="title-list ">
                <div class="title-placeholder">
                    <div class="title" style="padding-right: 10px;">No.</div>
                    <div class="title" style="padding-right: 15px;">AID</div>
                    <div class="title" style="padding-right: 15px;">Album name</div>
                    <div class="title" style="padding-right: 10px;">Quantity</div>
                    <div class="title" style="padding-right: 10px;">Price</div>
                </div>
            </div>
            <div class="list">
                <?php for ($i = 0; $i < count($detailOrder); $i++): ?>
                    <div class="placeholder">
                        <div class="info">
                            <div class="item">
                                <?= sprintf("%02d", $i + 1) ?>
                            </div>
                            <div class="item">
                                <?= $detailOrder[$i]['album'] ?>
                            </div>
                            <div class="item">
                                <?= $detailOrder[$i]['ten'] ?>
                            </div>
                            <div class="item">
                                <?= $detailOrder[$i]['soLuong'] ?>
                            </div>
                            <div class="item>" style="
                            display:flex;
                            justify-content:center;
                            align-items:center;
                            color: var(--gr1)"><?= $detailOrder[$i]['gia'] ?></div>
                        </div>
                    </div>
                <?php endfor; ?>
            </div>
        </div>
        <div class="modal-button">
            <div class="button-layout"></div>
            <div class="button-layout">
                <div class="edit-button btnOrderSave" onclick="updateOrder()">
                    <div class="icon-placeholder"><i class="fa-solid fa-pen-to-square"></i></div>
                    <div class="info-placeholder">Save</div>
                </div>
                <div class="back-button" onclick="closeEditorder()">
                    <div class="icon-placeholder"><i class="fa-solid fa-angle-left"></i></div>
                    <div class="info-placeholder">Close</div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
function getOrder($orderID)
{
    global $dp;
    // $sql = "SELECT * FROM hoadon WHERE maHoaDon = " . $orderID;
    $sql = "SELECT hoadon.*, nguoidung.SDT as phone
    FROM hoadon
    JOIN nguoidung ON hoadon.khachHang = nguoidung.maNguoiDung
    WHERE hoadon.maHoaDon = " . $orderID;

    $result = $dp->excuteQuery($sql);
    return $result->fetch_assoc();
}
function getDetailOrder($orderID)
{
    global $dp;
    $sql = "SELECT chitiethoadon.*, album.tenAlbum as ten, album.gia as gia
            FROM chitiethoadon join album on chitiethoadon.album = album.maAlbum
            WHERE hoaDon = " . $orderID;
    $result = $dp->excuteQuery($sql);
    $detailOrder = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            array_push($detailOrder, $row);
        }
    }
    return $detailOrder;
}
?>