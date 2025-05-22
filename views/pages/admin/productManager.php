<?php
require("../../../util/dataProvider.php");
require("../../../util/pagination.php");
$dp = new DataProvider();
session_start();

$priceRange = getPriceRange();
$minPrice = $priceRange['minPrice'];
$maxPrice = $priceRange['maxPrice'];
$currentPage = isset($_POST['currentPage']) ? (int)$_POST['currentPage'] : 1;
$quantityPerPage = 10; // Số dòng mỗi trang


if (
  isset($_POST['name'])
  && isset($_POST['category'])
  && isset($_POST['priceStart'])
  && isset($_POST['priceEnd'])
  && isset($_POST['orderDirection'])
) {
  $name = $_POST['name'];
  $category = $_POST['category'];
  $priceStart = $_POST['priceStart'];
  $priceEnd = $_POST['priceEnd'];
  $orderBy = $_POST['orderDirection'];
  $album = searchAlbum($name, $category, $priceStart, $priceEnd, $orderBy);
} else {
  $album = getAllAlbum();
}

$category = getAllCategory();
// Sử dụng lớp Pagination
$pagination = new Pagination($album, $quantityPerPage, $currentPage);

?>
<div id="productManager">
  <div class="header">
    <h2><i class="fa-solid fa-album"></i>&#09; Product management</h2>
    <?php if (checkCanAccess(19)): ?>
      <div class="button-placeholder">
        <div class="new-button" onclick="loadModalBoxByAjax('newAlbum')">
          <div class="icon-placeholder"><i class="fa-solid fa-user-plus fa-sm"></i></div>
          <div class="info-placeholder">New</div>
        </div>
      </div>
    <? else: ?>
      <div></div>
    <?php endif ?>
    <div class="search-bar">
      <div class="search-input">
        <i class="fa-solid fa-magnifying-glass"></i>
        <input type="text" placeholder="Looking for somethings?" onchange="loadAlbumByAjax()">
      </div>
      <div class="filter-input">
        <i class="fa-regular fa-filter"></i>
        <select name="" id="category-product" onchange="loadAlbumByAjax()">
          <option value="0">All</option>
          <?php
          foreach ($category as $cat) {
            echo "<option value='" . $cat['maLoai'] . "'>" . $cat['tenLoai'] . "</option>";
          }
          ?>
        </select>
      </div>
      <div class="date-begin price-begin">
        <i class="fa-thin fa-coin"></i>
        <input type="text" name="" id="priceStart-product" placeholder="Start price" value="" onchange="loadAlbumByAjax()">
      </div>
      <div class="date-end price-end">
        <i class="fa-thin fa-coins"></i>
        <input type="text" name="" id="priceEnd-product" placeholder="End price" value="" onchange="loadAlbumByAjax()">
      </div>
    </div>
  </div>
  <div class="title-list">
    <div class="title-placeholder">
      <div class="title">No.</div>
      <div class="title">AlbumID</div>
      <div class="title">
        <span>Album name</span>
        <!-- <i class="fa-solid  fa-up" onclick="turnArrow(this);loadAlbumByAjax()"></i> -->
      </div>
      <div class="title">Artist name</div>
      <div class="title">Kind</div>
      <div class="title">Price</div>
      <div class="title">Status</div>
    </div>
  </div>
  <div class="list">
  <?php for ($i = $pagination->startProduct(); $i <= $pagination->endProduct(); $i++): ?>
      <div class="placeholder" data-id="<?= $album[$i]['maAlbum'] ?>">
        <div class="info">
          <div class="item">
            <?= sprintf("%02d", $i + 1) ?>
          </div>
          <div class="item">
            <?= $album[$i]['maAlbum'] ?>
          </div>
          <div class="item" data-field="name">
            <?= $album[$i]['tenAlbum'] ?>
          </div>
          <div class="item" data-field="artist">
            <?= $album[$i]['tacGia'] ?>
          </div>
          <div class="item" data-field="kind">
            <?= $album[$i]['tenLoai'] ?>
          </div>
          <div class="item" data-field="price">
            <?= $album[$i]['gia'] ?>
          </div>
          <div class="item" data-field="status">
            <?= $album[$i]['TrangThai'] == 1 ? 'Active' : 'Inactive' ?>
          </div>
          <div class="item" onclick="loadModalBoxByAjax('detailAlbum',<?= $album[$i]['maAlbum'] ?>)">
            <i class="fa-regular fa-circle-info"></i>
          </div>
        </div>
      </div>
    <?php endfor; ?>
  </div>
  <?php if ($pagination->quantityPage > 1): ?>
        <div class="pagination-placeholder">
            <div class="pagination-box">
                <?php if ($pagination->currentPage > 1): ?>
                    <div class="item" onclick="loadAlbumByAjax(<?= $pagination->prevDot() ?>)">
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
                    <div class="item" onclick="loadAlbumByAjax(<?= $pagination->nextDot() ?>)">
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
function getAllAlbum()
{
  global $dp;
  // $sql = "SELECT *
  //       FROM album join theloai on album.theLoai = theloai.maLoai
  //       -- where album.TrangThai = 1
  //       ORDER BY tenAlbum ASC";
  $sql = "SELECT *
        FROM album 
        JOIN theloai ON album.theLoai = theloai.maLoai
        ORDER BY album.TrangThai DESC, tenAlbum ASC";

  $result = $dp->excuteQuery($sql);
  $album = array();
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($album, $row);
    }
  }
  return $album;
}
function checkCanAccess($permission)
{
  if (in_array($permission, $_SESSION['permission']))
    return true;
  return false;
}
function getAllCategory()
{
  global $dp;
  $sql = "SELECT * FROM theloai ";
  $result = $dp->excuteQuery($sql);
  $category = array();
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($category, $row);
    }
  }
  return $category;
}
function searchAlbum($name, $category, $priceStart, $priceEnd, $orderBy)
{
  global $dp;
  $sql = "SELECT *
          FROM album join theloai on album.theLoai = theloai.maLoai
           ";
  $f = false;
  if ($name != "" || $category != 0 || $priceStart != "" && $priceEnd != "") {
    $sql = $sql . "and ";
    if ($name != "") {
      $sql = $sql . "(tenAlbum LIKE '%" . $name . "%' ";
      $sql = $sql . " or tacGia LIKE '%" . $name . "%' ";
      $sql = $sql . " or maAlbum LIKE '%" . $name . "%') ";
      $f = true;
    }
    if ($category != 0) {
      if ($f) {
        $sql = $sql . "and ";
      }
      $sql = $sql . "theLoai = " . $category . " ";
      $f = true;
    }
    if ($priceStart != "" && $priceEnd != "") {
      if ($f) {
        $sql = $sql . "and ";
      }
      $sql = $sql . "gia >= " . $priceStart . " and gia <= " . $priceEnd . " ";
      $f = true;
    }
  }
  $sql = $sql . "ORDER BY trangThai DESC";
  if ($orderBy == "1")
    $sql = $sql . " ,tenAlbum ASC";
  else {
    $sql = $sql . " ,tenAlbum DESC";
  }
  $result = $dp->excuteQuery($sql);
  $album = array();
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($album, $row);
    }
  }
  return $album;
}
function getPriceRange()
{
  global $dp;
  $sql = "SELECT MIN(gia) AS minPrice, MAX(gia) AS maxPrice FROM album";
  $result = $dp->excuteQuery($sql);
  $priceRange = $result->fetch_assoc();
  return $priceRange;
}
?>